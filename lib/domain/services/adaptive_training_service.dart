import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'dart:math' as math;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vo2rpg/core/utils/vdot_calculator.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/domain/repositories/training_plan_repository.dart';

part 'adaptive_training_service.g.dart';

/// Provider for the training plan repository
@Riverpod(keepAlive: true)
TrainingPlanRepository trainingPlanRepository(Ref ref) {
  final supabase = Supabase.instance.client;
  return SupabaseTrainingPlanRepository(supabase);
}

/// Service to provide adaptive training service
@Riverpod(keepAlive: true)
AdaptiveTrainingService adaptiveTrainingService(Ref ref) {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  return AdaptiveTrainingService(repository);
}

/// Service class that provides adaptive training adjustments based on workout performance
class AdaptiveTrainingService {
  final TrainingPlanRepository _repository;

  AdaptiveTrainingService(this._repository);

  /// Analyzes completed workouts and updates the training plan accordingly
  Future<TrainingPlan> adjustTrainingPlan(TrainingPlan plan) async {
    // Collect recent workouts for performance analysis
    final recentWorkouts = plan.workouts
        .where((w) => w.status == WorkoutStatus.completed)
        .where((w) => w.actualDistance != null && w.actualDuration != null)
        .toList();

    // If no completed workouts with data, return the plan unchanged
    if (recentWorkouts.isEmpty) {
      return plan;
    }

    // Analyze performance to determine if VDOT adjustment is needed
    final vdotAdjustment =
        _analyzeWorkoutPerformance(recentWorkouts, plan.currentVdot);

    // If no significant adjustment needed, return plan as is
    if (vdotAdjustment == 0) {
      return plan;
    }

    // Apply the adjustment to the training plan
    final adjustedPlan = plan.copyWith(
      currentVdot: plan.currentVdot + vdotAdjustment,
      updatedAt: DateTime.now(),
    );

    // Update future workouts based on new VDOT
    final updatedWorkouts = _adjustUpcomingWorkouts(
      adjustedPlan.workouts,
      adjustedPlan.currentVdot,
      DateTime.now(),
    );

    // Create the final updated plan
    final updatedPlan = adjustedPlan.copyWith(
      workouts: updatedWorkouts,
    );

    // Save the updated plan to repository
    await _repository.updatePlan(updatedPlan);

    // Return the updated plan
    return updatedPlan;
  }

  /// Analyzes workout performance to determine VDOT adjustments
  double _analyzeWorkoutPerformance(
      List<Workout> completedWorkouts, double currentVdot) {
    // Skip if no workouts with distance and time data
    if (completedWorkouts.isEmpty) return 0;

    // Calculate average performance ratio for each workout
    // If actual pace is faster than expected, this suggests a VDOT increase
    double totalVdotDelta = 0;
    int countValidWorkouts = 0;

    for (final workout in completedWorkouts) {
      // Skip workouts without required data
      if (workout.actualDistance == null ||
          workout.actualDuration == null ||
          workout.plannedDistance == null) {
        continue;
      }

      // Calculate the expected duration for the actual distance based on current VDOT
      final actualDistanceMeters = workout.actualDistance!.toDouble();
      final actualDurationSeconds = Duration(seconds: workout.actualDuration!);

      // Calculate an implied VDOT from the actual performance
      final impliedVdot = VdotCalculator.calculateVdot(
        distance: actualDistanceMeters,
        time: actualDurationSeconds,
      );

      // Difference between implied and current VDOT
      final vdotDelta = impliedVdot - currentVdot;

      // Weight different workout types differently
      final weight = _getWorkoutTypeWeight(workout.workoutType);

      totalVdotDelta += vdotDelta * weight;
      countValidWorkouts++;
    }

    // No valid workouts found
    if (countValidWorkouts == 0) return 0;

    // Calculate weighted average VDOT change
    final averageVdotDelta = totalVdotDelta / countValidWorkouts;

    // Apply a dampening factor to prevent large swings (0.5 = 50% of calculated adjustment)
    final dampenedDelta = averageVdotDelta * 0.5;

    // Limit maximum adjustment to +/- 2.0 VDOT points at once
    return math.min(2.0, math.max(-2.0, dampenedDelta));
  }

  /// Assigns weights to different workout types for VDOT calculation
  double _getWorkoutTypeWeight(WorkoutType type) {
    return switch (type) {
      // Time trials and interval sessions are most predictive
      WorkoutType.interval => 1.0,
      // Threshold runs are also good indicators
      WorkoutType.threshold => 0.8,
      // Long runs and easy runs less so
      WorkoutType.longRun => 0.6,
      WorkoutType.easy => 0.4,
      // Rest days have no weight
      WorkoutType.rest => 0.0,
    };
  }

  /// Adjusts upcoming workouts based on new VDOT
  List<Workout> _adjustUpcomingWorkouts(
    List<Workout> workouts,
    double newVdot,
    DateTime currentDate,
  ) {
    final adjustedWorkouts = <Workout>[];

    // Adjust each workout that hasn't been completed yet
    for (final workout in workouts) {
      // Skip completed workouts or past workouts
      if (workout.status == WorkoutStatus.completed ||
          workout.scheduledDate.isBefore(currentDate)) {
        adjustedWorkouts.add(workout);
        continue;
      }

      // For future workouts, adjust based on new VDOT
      if (workout.plannedDistance != null) {
        // Keep the same distance but adjust target paces
        final adjustedWorkout = _adjustWorkoutPaces(workout, newVdot);
        adjustedWorkouts.add(adjustedWorkout);
      } else {
        // No distance to adjust, keep as is
        adjustedWorkouts.add(workout);
      }
    }

    return adjustedWorkouts;
  }

  /// Adjusts workout paces based on new VDOT
  Workout _adjustWorkoutPaces(Workout workout, double newVdot) {
    // Get training paces for the new VDOT
    final paces = VdotCalculator.getTrainingPaces(newVdot);

    // Determine target pace based on workout type
    final targetPaceKey = switch (workout.workoutType) {
      WorkoutType.easy => 'easy',
      WorkoutType.threshold => 'threshold',
      WorkoutType.interval => 'interval',
      WorkoutType.longRun => 'easy', // Long runs are at easy pace
      WorkoutType.rest => 'easy', // Default
    };

    // Get the target pace in seconds per km
    final targetPaceSeconds = paces[targetPaceKey] ?? 0.0;

    // If the workout has a planned distance, calculate expected duration
    final plannedDistance = workout.plannedDistance;
    if (plannedDistance != null && targetPaceSeconds > 0) {
      final distanceKm = plannedDistance / 1000.0;
      final durationSeconds = (distanceKm * targetPaceSeconds).round();

      // Update workout with new target pace and expected duration
      return workout.copyWith(
        notes: workout.notes != null
            ? "${workout.notes}\nTarget pace: ${(targetPaceSeconds / 60.0).toStringAsFixed(2)} min/km"
            : "Target pace: ${(targetPaceSeconds / 60.0).toStringAsFixed(2)} min/km",
        plannedDuration: durationSeconds,
        updatedAt: DateTime.now(),
      );
    }

    // No adjustments needed/possible
    return workout;
  }
}
