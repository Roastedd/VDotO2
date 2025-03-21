import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/repositories/training_plan_repository.dart' as data;
import 'package:vo2rpg/domain/repositories/training_plan_repository.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';

part 'training_plan_provider.g.dart';

/// Provider for the training plan repository
@riverpod
TrainingPlanRepository trainingPlanRepository(Ref ref) {
  return data.TrainingPlanRepository() as TrainingPlanRepository;
}

/// Provider for user's training plans
@riverpod
Future<List<TrainingPlan>> userTrainingPlans(Ref ref) async {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    throw Exception('User not authenticated');
  }
  return repository.getUserPlans(user.id);
}

/// Provider for a specific training plan
@riverpod
Future<TrainingPlan> trainingPlan(Ref ref, String planId) async {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  final plan = await repository.getPlan(planId);
  if (plan == null) {
    throw Exception('Training plan not found');
  }
  return plan;
}

/// Provider for workouts in a training plan
@riverpod
Future<List<Workout>> trainingPlanWorkouts(
  Ref ref,
  String planId,
) async {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  return repository.getPlanWorkouts(planId);
}

/// Notifier for managing training plan creation and updates
@riverpod
class TrainingPlanNotifier extends _$TrainingPlanNotifier {
  @override
  FutureOr<void> build() async {}

  Future<TrainingPlan> createPlan({
    required String userId,
    required PlanType type,
    required double currentVdot,
    required DateTime startDate,
    DateTime? raceDate,
    double? targetRaceDistance,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(trainingPlanRepositoryProvider);

    try {
      final plan = await repository.createPlan(
        userId: userId,
        type: type,
        currentVdot: currentVdot,
        startDate: startDate,
        raceDate: raceDate,
        targetRaceDistance: targetRaceDistance,
      );

      state = const AsyncData(null);
      return plan;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  Future<void> updatePlan(TrainingPlan plan) async {
    state = const AsyncLoading();

    final repository = ref.read(trainingPlanRepositoryProvider);

    try {
      await repository.updatePlan(plan);
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  Future<void> deletePlan(String planId) async {
    state = const AsyncLoading();

    final repository = ref.read(trainingPlanRepositoryProvider);

    try {
      await repository.deletePlan(planId);
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  Future<void> updateWorkout(Workout workout) async {
    state = const AsyncLoading();

    final repository = ref.read(trainingPlanRepositoryProvider);

    try {
      await repository.updateWorkout(workout);
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}
