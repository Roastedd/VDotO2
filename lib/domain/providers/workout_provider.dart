import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/repositories/workout_repository.dart';

part 'workout_provider.g.dart';

/// Provider for fetching workout details
@riverpod
Future<Workout?> workout(Ref ref, String workoutId) async {
  final repository = ref.watch(workoutRepositoryProvider.notifier);
  return repository.getWorkout(workoutId);
}
