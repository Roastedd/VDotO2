import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/models/workout_execution.dart';

part 'workout_repository.g.dart';

/// Repository for managing workouts and workout executions
@riverpod
class WorkoutRepository extends _$WorkoutRepository {
  late final SupabaseClient _supabase;

  @override
  FutureOr<void> build() {
    _supabase = Supabase.instance.client;
  }

  /// Fetch all workouts for a user
  Future<List<Workout>> getWorkouts(String userId) async {
    final response = await _supabase
        .from('workouts')
        .select()
        .eq('user_id', userId)
        .order('created_at');

    return response.map((json) => Workout.fromJson(json)).toList();
  }

  /// Fetch a single workout by ID
  Future<Workout?> getWorkout(String workoutId) async {
    final response = await _supabase
        .from('workouts')
        .select()
        .eq('id', workoutId)
        .maybeSingle();

    return response == null ? null : Workout.fromJson(response);
  }

  /// Save a workout execution
  Future<void> saveWorkoutExecution(WorkoutExecution execution) async {
    await _supabase.from('workout_executions').upsert(execution.toJson());
  }

  /// Get workout executions for a user
  Future<List<WorkoutExecution>> getWorkoutExecutions(String userId) async {
    final response = await _supabase
        .from('workout_executions')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return response.map((json) => WorkoutExecution.fromJson(json)).toList();
  }

  /// Get the last workout execution for a user
  Future<WorkoutExecution?> getLastWorkoutExecution(String userId) async {
    final response = await _supabase
        .from('workout_executions')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    return response == null ? null : WorkoutExecution.fromJson(response);
  }
}
