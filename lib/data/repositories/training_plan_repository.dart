import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/services/local_storage_service.dart';
import 'package:vo2rpg/domain/repositories/training_plan_repository.dart'
    as domain;

/// Repository for managing training plans
class TrainingPlanRepository implements domain.TrainingPlanRepository {
  final _supabase = Supabase.instance.client;
  final _localStorage = LocalStorageService();

  @override
  Future<TrainingPlan?> getPlan(String planId) async {
    try {
      // Try to get from local storage first
      final localPlan = await _localStorage.getTrainingPlan(planId);
      if (localPlan != null) {
        return localPlan;
      }

      // If not found locally, fetch from Supabase
      final data = await _supabase
          .from('training_plans')
          .select('*, workouts(*)')
          .eq('id', planId)
          .single();

      final plan = TrainingPlan.fromJson(data);

      // Save to local storage
      await _localStorage.saveTrainingPlan(plan);

      return plan;
    } catch (e) {
      // If offline and plan exists locally, return local plan
      final localPlan = await _localStorage.getTrainingPlan(planId);
      if (localPlan != null) {
        return localPlan;
      }
      rethrow;
    }
  }

  @override
  Future<List<TrainingPlan>> getUserPlans(String userId) async {
    try {
      // Try to get from Supabase first
      final data = await _supabase
          .from('training_plans')
          .select('*, workouts(*)')
          .eq('user_id', userId)
          .order('created_at');

      final plans = data.map((plan) => TrainingPlan.fromJson(plan)).toList();

      // Save all plans to local storage
      for (final plan in plans) {
        await _localStorage.saveTrainingPlan(plan);
      }

      return plans;
    } catch (e) {
      // If offline, return local plans
      return _localStorage.getAllTrainingPlans();
    }
  }

  @override
  Future<TrainingPlan> createPlan({
    required String userId,
    required PlanType type,
    required double currentVdot,
    required DateTime startDate,
    DateTime? raceDate,
    double? targetRaceDistance,
  }) async {
    try {
      final plan = TrainingPlan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        planType: type,
        startDate: startDate,
        endDate: raceDate ?? startDate.add(const Duration(days: 56)),
        targetRaceDistance: ((targetRaceDistance ?? 0) * 1000)
            .round(), // Convert to meters and round to int
        currentVdot: currentVdot,
        currentWeek: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Supabase
      final data = await _supabase
          .from('training_plans')
          .insert(plan.toJson())
          .select('*, workouts(*)')
          .single();

      final createdPlan = TrainingPlan.fromJson(data);

      // Save to local storage
      await _localStorage.saveTrainingPlan(createdPlan);

      return createdPlan;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePlan(TrainingPlan plan) async {
    try {
      // Update in Supabase
      await _supabase
          .from('training_plans')
          .update(plan.toJson())
          .eq('id', plan.id);

      // Update in local storage
      await _localStorage.saveTrainingPlan(plan);
    } catch (e) {
      // If offline, update locally only
      await _localStorage.saveTrainingPlan(plan);
      rethrow;
    }
  }

  @override
  Future<void> deletePlan(String planId) async {
    try {
      // Delete from Supabase
      await _supabase.from('training_plans').delete().eq('id', planId);

      // Delete from local storage
      await _localStorage.deleteTrainingPlan(planId);
    } catch (e) {
      // If offline, delete locally only
      await _localStorage.deleteTrainingPlan(planId);
      rethrow;
    }
  }

  @override
  Future<List<Workout>> getPlanWorkouts(String planId) async {
    try {
      // Try to get from Supabase first
      final data = await _supabase
          .from('workouts')
          .select()
          .eq('training_plan_id', planId)
          .order('scheduled_date');

      final workouts =
          data.map((workout) => Workout.fromJson(workout)).toList();

      // Save workouts to local storage
      for (final workout in workouts) {
        await _localStorage.saveWorkout(workout);
      }

      return workouts;
    } catch (e) {
      // If offline, return local workouts
      return _localStorage.getPlanWorkouts(planId);
    }
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    try {
      // Update in Supabase
      await _supabase
          .from('workouts')
          .update(workout.toJson())
          .eq('id', workout.id);

      // Update in local storage
      await _localStorage.saveWorkout(workout);
    } catch (e) {
      // If offline, update locally only
      await _localStorage.saveWorkout(workout);
      rethrow;
    }
  }
}
