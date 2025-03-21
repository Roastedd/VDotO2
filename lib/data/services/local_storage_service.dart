import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';

/// Service for managing local data persistence using Hive
class LocalStorageService {
  static const String _trainingPlansBox = 'training_plans';
  static const String _workoutsBox = 'workouts';
  static bool _initialized = false;

  /// Initialize Hive and register adapters
  static Future<void> initialize() async {
    // Skip re-initialization
    if (_initialized) {
      return;
    }

    // Initialize Hive
    await Hive.initFlutter();

    try {
      // Register adapters
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(PlanTypeAdapter());
      }
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(WorkoutTypeAdapter());
      }
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(WorkoutStatusAdapter());
      }
      if (!Hive.isAdapterRegistered(3)) {
        Hive.registerAdapter(TrainingPlanAdapter());
      }
      if (!Hive.isAdapterRegistered(4)) {
        Hive.registerAdapter(WorkoutAdapter());
      }

      // Open boxes
      await Hive.openBox<TrainingPlan>(_trainingPlansBox);
      await Hive.openBox<Workout>(_workoutsBox);

      _initialized = true;
    } catch (e) {
      if (kIsWeb) {
        // On web, if we have issues with Hive, log it but don't crash
        debugPrint('Web storage initialization error (non-critical): $e');
        _initialized = true; // Mark as initialized to prevent retries
      } else {
        // On mobile, rethrow as storage is critical
        rethrow;
      }
    }
  }

  /// Save a training plan locally
  Future<void> saveTrainingPlan(TrainingPlan plan) async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return;
    }

    final box = Hive.box<TrainingPlan>(_trainingPlansBox);
    await box.put(plan.id, plan);

    // Save workouts
    final workoutsBox = Hive.box<Workout>(_workoutsBox);
    for (final workout in plan.workouts) {
      await workoutsBox.put(workout.id, workout);
    }
  }

  /// Get a training plan by ID
  Future<TrainingPlan?> getTrainingPlan(String planId) async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return null;
    }

    final box = Hive.box<TrainingPlan>(_trainingPlansBox);
    return box.get(planId);
  }

  /// Get all training plans
  Future<List<TrainingPlan>> getAllTrainingPlans() async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return [];
    }

    final box = Hive.box<TrainingPlan>(_trainingPlansBox);
    return box.values.toList();
  }

  /// Delete a training plan
  Future<void> deleteTrainingPlan(String planId) async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return;
    }

    final box = Hive.box<TrainingPlan>(_trainingPlansBox);
    await box.delete(planId);

    // Delete associated workouts
    final workoutsBox = Hive.box<Workout>(_workoutsBox);
    final workouts =
        workoutsBox.values.where((w) => w.trainingPlanId == planId);
    for (final workout in workouts) {
      await workoutsBox.delete(workout.id);
    }
  }

  /// Save a workout
  Future<void> saveWorkout(Workout workout) async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return;
    }

    final box = Hive.box<Workout>(_workoutsBox);
    await box.put(workout.id, workout);
  }

  /// Get workouts for a training plan
  Future<List<Workout>> getPlanWorkouts(String planId) async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return [];
    }

    final box = Hive.box<Workout>(_workoutsBox);
    return box.values.where((w) => w.trainingPlanId == planId).toList();
  }

  /// Clear all local data
  Future<void> clearAll() async {
    if (!_initialized && kIsWeb) {
      debugPrint('Storage not available on this web instance');
      return;
    }

    await Hive.box<TrainingPlan>(_trainingPlansBox).clear();
    await Hive.box<Workout>(_workoutsBox).clear();
  }
}
