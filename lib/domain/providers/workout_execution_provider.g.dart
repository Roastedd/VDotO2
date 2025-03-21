// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_execution_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutExecutionServiceHash() =>
    r'9033aff35270453ce8857323c201dd05d7beb790';

/// See also [workoutExecutionService].
@ProviderFor(workoutExecutionService)
final workoutExecutionServiceProvider =
    Provider<service.WorkoutExecutionService>.internal(
  workoutExecutionService,
  name: r'workoutExecutionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutExecutionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutExecutionServiceRef
    = ProviderRef<service.WorkoutExecutionService>;
String _$workoutMetricsHash() => r'3aebc5e12208a8ffc0a68e91ae8dce9d5cb56673';

/// Provider for workout metrics during execution
///
/// Copied from [workoutMetrics].
@ProviderFor(workoutMetrics)
final workoutMetricsProvider =
    AutoDisposeStreamProvider<models.WorkoutMetrics>.internal(
  workoutMetrics,
  name: r'workoutMetricsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutMetricsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutMetricsRef = AutoDisposeStreamProviderRef<models.WorkoutMetrics>;
String _$workoutLocationHash() => r'005da66a4517e9c1b3d2fb3cca506e92db203396';

/// See also [workoutLocation].
@ProviderFor(workoutLocation)
final workoutLocationProvider = AutoDisposeStreamProvider<Position>.internal(
  workoutLocation,
  name: r'workoutLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutLocationRef = AutoDisposeStreamProviderRef<Position>;
String _$workoutExecutionControllerHash() =>
    r'70b9faa23452d19b106243aaab10df92a96f8da9';

/// Provider for workout execution controller
///
/// Copied from [WorkoutExecutionController].
@ProviderFor(WorkoutExecutionController)
final workoutExecutionControllerProvider =
    AutoDisposeAsyncNotifierProvider<WorkoutExecutionController, void>.internal(
  WorkoutExecutionController.new,
  name: r'workoutExecutionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutExecutionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WorkoutExecutionController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
