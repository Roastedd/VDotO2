import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/models/workout_metrics.dart' as models;
import 'package:vo2rpg/domain/services/workout_execution_service.dart'
    as service;

part 'workout_execution_provider.g.dart';

@Riverpod(keepAlive: true)
service.WorkoutExecutionService workoutExecutionService(Ref ref) {
  final workoutService = service.WorkoutExecutionService();
  ref.onDispose(() => workoutService.dispose());
  return workoutService;
}

/// Provider for workout metrics during execution
@riverpod
Stream<models.WorkoutMetrics> workoutMetrics(Ref ref) {
  final workoutService = ref.watch(workoutExecutionServiceProvider);
  return workoutService.metricsStream.map((metrics) => models.WorkoutMetrics(
        heartRate: metrics.heartRate,
        currentPace: metrics.currentPace,
        averagePace: metrics.averagePace,
        distance: metrics.distance,
        duration: metrics.duration,
        speed: metrics.speed,
        elevation: metrics.elevation,
        timestamp: metrics.timestamp,
      ));
}

@riverpod
Stream<Position> workoutLocation(Ref ref) {
  final workoutService = ref.watch(workoutExecutionServiceProvider);
  return workoutService.locationStream.cast<Position>();
}

/// Provider for workout execution controller
@riverpod
class WorkoutExecutionController extends _$WorkoutExecutionController {
  late final service.WorkoutExecutionService _service;
  Workout? _currentWorkout;

  @override
  FutureOr<void> build() {
    _service = ref.watch(workoutExecutionServiceProvider);
  }

  /// Start a workout
  Future<void> startWorkout(Workout workout) async {
    state = const AsyncLoading();
    try {
      _currentWorkout = workout;
      await _service.startWorkout(workout);
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// Stop the current workout
  Future<void> stopWorkout() async {
    state = const AsyncLoading();
    try {
      await _service.stopWorkout();
      _currentWorkout = null;
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// Pause the current workout
  Future<void> pauseWorkout() async {
    state = const AsyncLoading();
    try {
      await _service.stopWorkout();
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// Resume the current workout
  Future<void> resumeWorkout() async {
    state = const AsyncLoading();
    try {
      if (_currentWorkout == null) {
        throw StateError('No workout to resume');
      }
      await _service.startWorkout(_currentWorkout!);
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
