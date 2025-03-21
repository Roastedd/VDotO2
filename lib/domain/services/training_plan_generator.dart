/// A service for generating training plans and workouts following Apple HIG guidelines.
/// This service ensures that all generated content follows accessibility standards
/// and provides a consistent user experience across iOS and Android platforms.
import 'package:uuid/uuid.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';

/// Service for generating training plans and workouts
class TrainingPlanGenerator {
  final _uuid = const Uuid();

  /// Generates a new training plan with proper validation and error handling.
  ///
  /// Parameters:
  /// - [userId]: The unique identifier of the user
  /// - [type]: The type of training plan (e.g., 5K, 10K)
  /// - [currentVdot]: The user's current VDOT score
  /// - [startDate]: The start date of the training plan
  /// - [raceDate]: Optional race date for race-specific plans
  /// - [targetRaceDistance]: Optional target race distance in meters
  ///
  /// Returns a [TrainingPlan] instance with generated workouts.
  ///
  /// Throws [ArgumentError] if invalid parameters are provided.
  TrainingPlan generatePlan({
    required String userId,
    required PlanType type,
    required double currentVdot,
    required DateTime startDate,
    DateTime? raceDate,
    double? targetRaceDistance,
  }) {
    // Validate inputs
    if (currentVdot <= 0) {
      throw ArgumentError('VDOT score must be positive');
    }

    if (raceDate != null && raceDate.isBefore(startDate)) {
      throw ArgumentError('Race date must be after start date');
    }

    final duration = _getPlanDuration(type);
    final endDate = startDate.add(Duration(days: duration * 7));

    return TrainingPlan(
      id: _uuid.v4(),
      userId: userId,
      planType: type,
      startDate: startDate,
      endDate: endDate,
      currentVdot: currentVdot,
      currentWeek: 1,
      targetRaceDate: raceDate,
      targetRaceDistance: targetRaceDistance?.toInt() ?? 0,
      isDeleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Generates workouts for a training plan
  List<Workout> generateWorkouts(TrainingPlan plan) {
    final workouts = <Workout>[];
    final duration = _getPlanDuration(plan.planType);

    for (var week = 1; week <= duration; week++) {
      workouts.addAll(_generateWeeklyWorkouts(
        plan: plan,
        week: week,
        totalWeeks: duration,
      ));
    }

    return workouts;
  }

  /// Gets the duration of a plan in weeks
  int _getPlanDuration(PlanType type) {
    switch (type) {
      case PlanType.base:
        return 8;
      case PlanType.fiveK:
      case PlanType.tenK:
      case PlanType.halfMarathon:
        return 12;
      case PlanType.marathon:
        return 18;
    }
  }

  /// Generates workouts for a specific week
  List<Workout> _generateWeeklyWorkouts({
    required TrainingPlan plan,
    required int week,
    required int totalWeeks,
  }) {
    final workouts = <Workout>[];
    final weekStart = plan.startDate.add(Duration(days: (week - 1) * 7));

    // Easy run on Monday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.easy,
      date: weekStart,
      distance: 5000.0, // 5K
    ));

    // Threshold run on Tuesday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.threshold,
      date: weekStart.add(const Duration(days: 2)),
      distance: 8000.0, // 8K
    ));

    // Rest on Wednesday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.rest,
      date: weekStart.add(const Duration(days: 3)),
    ));

    // Interval session on Thursday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.interval,
      date: weekStart.add(const Duration(days: 4)),
      distance: 6000.0, // 6K
    ));

    // Easy run on Friday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.easy,
      date: weekStart.add(const Duration(days: 5)),
      distance: 5000.0, // 5K
    ));

    // Long run on Sunday
    workouts.add(_createWorkout(
      plan: plan,
      type: WorkoutType.longRun,
      date: weekStart.add(const Duration(days: 6)),
      distance: _calculateLongRunDistance(
        week: week,
        totalWeeks: totalWeeks,
        planType: plan.planType,
      ),
    ));

    return workouts;
  }

  /// Creates a workout with proper validation and accessibility information.
  /// This ensures the workout details are properly formatted for VoiceOver and
  /// other accessibility features.
  Workout _createWorkout({
    required TrainingPlan plan,
    required WorkoutType type,
    required DateTime date,
    double? distance,
  }) {
    return Workout(
      id: _uuid.v4(),
      trainingPlanId: plan.id,
      workoutType: type,
      scheduledDate: date,
      plannedDistance: distance?.toInt(),
      isDeleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      notes: _generateAccessibleWorkoutNotes(type, distance),
    );
  }

  /// Generates accessibility-friendly workout notes
  String _generateAccessibleWorkoutNotes(WorkoutType type, double? distance) {
    final distanceKm =
        distance != null ? (distance / 1000).toStringAsFixed(1) : null;

    return switch (type) {
      WorkoutType.easy =>
        'Easy run${distanceKm != null ? ' - $distanceKm kilometers' : ''}',
      WorkoutType.threshold =>
        'Threshold run${distanceKm != null ? ' - $distanceKm kilometers' : ''}',
      WorkoutType.interval =>
        'Interval workout${distanceKm != null ? ' - $distanceKm kilometers' : ''}',
      WorkoutType.longRun =>
        'Long run${distanceKm != null ? ' - $distanceKm kilometers' : ''}',
      WorkoutType.rest => 'Rest day',
    };
  }

  /// Calculates the distance for a long run based on training progress
  double _calculateLongRunDistance({
    required int week,
    required int totalWeeks,
    required PlanType planType,
  }) {
    final baseDistance = switch (planType) {
      PlanType.base => 8000.0, // 8K
      PlanType.fiveK => 10000.0, // 10K
      PlanType.tenK => 12000.0, // 12K
      PlanType.halfMarathon => 15000.0, // 15K
      PlanType.marathon => 20000.0, // 20K
    };

    // Progressive increase in distance
    final progress = week / totalWeeks;
    final maxIncrease = switch (planType) {
      PlanType.base => 4000.0, // Up to 12K
      PlanType.fiveK => 5000.0, // Up to 15K
      PlanType.tenK => 8000.0, // Up to 20K
      PlanType.halfMarathon => 10000.0, // Up to 25K
      PlanType.marathon => 22000.0, // Up to 42K
    };

    return baseDistance + (maxIncrease * progress);
  }
}
