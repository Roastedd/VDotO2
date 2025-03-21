import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/domain/services/training_plan_generator.dart';

/// Repository interface for managing training plans
abstract class TrainingPlanRepository {
  /// Creates a new training plan
  Future<TrainingPlan> createPlan({
    required String userId,
    required PlanType type,
    required double currentVdot,
    required DateTime startDate,
    DateTime? raceDate,
    double? targetRaceDistance,
  });

  /// Gets a training plan by ID
  Future<TrainingPlan?> getPlan(String id);

  /// Gets all training plans for a user
  Future<List<TrainingPlan>> getUserPlans(String userId);

  /// Updates a training plan
  Future<void> updatePlan(TrainingPlan plan);

  /// Deletes a training plan
  Future<void> deletePlan(String id);

  /// Gets all workouts for a training plan
  Future<List<Workout>> getPlanWorkouts(String planId);

  /// Updates a workout
  Future<void> updateWorkout(Workout workout);
}

/// Supabase implementation of the training plan repository
class SupabaseTrainingPlanRepository implements TrainingPlanRepository {
  final SupabaseClient _supabase;
  final _generator = TrainingPlanGenerator();

  SupabaseTrainingPlanRepository(this._supabase);

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
      // Generate the plan
      final plan = _generator.generatePlan(
        userId: userId,
        type: type,
        currentVdot: currentVdot,
        startDate: startDate,
        raceDate: raceDate,
        targetRaceDistance: targetRaceDistance,
      );

      // Insert the plan into the database using upsert to handle conflicts
      final response = await _supabase
          .from('training_plans')
          .upsert(plan.toJson())
          .select()
          .single();

      final createdPlan = TrainingPlan.fromJson(response);

      // Generate and insert workouts using a transaction
      final workouts = _generator.generateWorkouts(createdPlan);
      await _supabase.from('workouts').upsert(
            workouts.map((w) => w.toJson()).toList(),
          );

      return createdPlan;
    } on PostgrestException catch (e) {
      throw Exception('Failed to create training plan: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error creating training plan: $e');
    }
  }

  @override
  Future<TrainingPlan?> getPlan(String id) async {
    try {
      final response = await _supabase
          .from('training_plans')
          .select()
          .eq('id', id)
          .eq('is_deleted', false)
          .maybeSingle();

      return response != null ? TrainingPlan.fromJson(response) : null;
    } on PostgrestException catch (e) {
      throw Exception('Failed to get training plan: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error getting training plan: $e');
    }
  }

  @override
  Future<List<TrainingPlan>> getUserPlans(String userId) async {
    try {
      final response = await _supabase
          .from('training_plans')
          .select()
          .eq('user_id', userId)
          .eq('is_deleted', false)
          .order('created_at', ascending: false);

      return response.map((json) => TrainingPlan.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw Exception('Failed to get user training plans: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error getting user training plans: $e');
    }
  }

  @override
  Future<void> updatePlan(TrainingPlan plan) async {
    try {
      await _supabase.from('training_plans').update({
        ...plan.toJson(),
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', plan.id);
    } on PostgrestException catch (e) {
      throw Exception('Failed to update training plan: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error updating training plan: $e');
    }
  }

  @override
  Future<void> deletePlan(String id) async {
    try {
      await _supabase.from('training_plans').update({
        'is_deleted': true,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', id);
    } on PostgrestException catch (e) {
      throw Exception('Failed to delete training plan: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error deleting training plan: $e');
    }
  }

  @override
  Future<List<Workout>> getPlanWorkouts(String planId) async {
    try {
      final response = await _supabase
          .from('workouts')
          .select()
          .eq('training_plan_id', planId)
          .eq('is_deleted', false)
          .order('scheduled_date');

      return response.map((json) => Workout.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw Exception('Failed to get plan workouts: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error getting plan workouts: $e');
    }
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    try {
      await _supabase.from('workouts').update({
        ...workout.toJson(),
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', workout.id);
    } on PostgrestException catch (e) {
      throw Exception('Failed to update workout: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error updating workout: $e');
    }
  }
}
