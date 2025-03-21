// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingPlanRepositoryHash() =>
    r'aba818d8c3eca03d903861885af15dc11e0525fb';

/// Provider for the training plan repository
///
/// Copied from [trainingPlanRepository].
@ProviderFor(trainingPlanRepository)
final trainingPlanRepositoryProvider =
    AutoDisposeProvider<TrainingPlanRepository>.internal(
  trainingPlanRepository,
  name: r'trainingPlanRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trainingPlanRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrainingPlanRepositoryRef
    = AutoDisposeProviderRef<TrainingPlanRepository>;
String _$userTrainingPlansHash() => r'34e98deed59771a7783c8eff9517ebbe93781119';

/// Provider for user's training plans
///
/// Copied from [userTrainingPlans].
@ProviderFor(userTrainingPlans)
final userTrainingPlansProvider =
    AutoDisposeFutureProvider<List<TrainingPlan>>.internal(
  userTrainingPlans,
  name: r'userTrainingPlansProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTrainingPlansHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserTrainingPlansRef = AutoDisposeFutureProviderRef<List<TrainingPlan>>;
String _$trainingPlanHash() => r'ee9483ed218019a2e2f766a8267e59da1c686c7f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for a specific training plan
///
/// Copied from [trainingPlan].
@ProviderFor(trainingPlan)
const trainingPlanProvider = TrainingPlanFamily();

/// Provider for a specific training plan
///
/// Copied from [trainingPlan].
class TrainingPlanFamily extends Family<AsyncValue<TrainingPlan>> {
  /// Provider for a specific training plan
  ///
  /// Copied from [trainingPlan].
  const TrainingPlanFamily();

  /// Provider for a specific training plan
  ///
  /// Copied from [trainingPlan].
  TrainingPlanProvider call(
    String planId,
  ) {
    return TrainingPlanProvider(
      planId,
    );
  }

  @override
  TrainingPlanProvider getProviderOverride(
    covariant TrainingPlanProvider provider,
  ) {
    return call(
      provider.planId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trainingPlanProvider';
}

/// Provider for a specific training plan
///
/// Copied from [trainingPlan].
class TrainingPlanProvider extends AutoDisposeFutureProvider<TrainingPlan> {
  /// Provider for a specific training plan
  ///
  /// Copied from [trainingPlan].
  TrainingPlanProvider(
    String planId,
  ) : this._internal(
          (ref) => trainingPlan(
            ref as TrainingPlanRef,
            planId,
          ),
          from: trainingPlanProvider,
          name: r'trainingPlanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingPlanHash,
          dependencies: TrainingPlanFamily._dependencies,
          allTransitiveDependencies:
              TrainingPlanFamily._allTransitiveDependencies,
          planId: planId,
        );

  TrainingPlanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.planId,
  }) : super.internal();

  final String planId;

  @override
  Override overrideWith(
    FutureOr<TrainingPlan> Function(TrainingPlanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrainingPlanProvider._internal(
        (ref) => create(ref as TrainingPlanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        planId: planId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TrainingPlan> createElement() {
    return _TrainingPlanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingPlanProvider && other.planId == planId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, planId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrainingPlanRef on AutoDisposeFutureProviderRef<TrainingPlan> {
  /// The parameter `planId` of this provider.
  String get planId;
}

class _TrainingPlanProviderElement
    extends AutoDisposeFutureProviderElement<TrainingPlan>
    with TrainingPlanRef {
  _TrainingPlanProviderElement(super.provider);

  @override
  String get planId => (origin as TrainingPlanProvider).planId;
}

String _$trainingPlanWorkoutsHash() =>
    r'8918c2b1d8f6bf73d8918141746b8887fa06c813';

/// Provider for workouts in a training plan
///
/// Copied from [trainingPlanWorkouts].
@ProviderFor(trainingPlanWorkouts)
const trainingPlanWorkoutsProvider = TrainingPlanWorkoutsFamily();

/// Provider for workouts in a training plan
///
/// Copied from [trainingPlanWorkouts].
class TrainingPlanWorkoutsFamily extends Family<AsyncValue<List<Workout>>> {
  /// Provider for workouts in a training plan
  ///
  /// Copied from [trainingPlanWorkouts].
  const TrainingPlanWorkoutsFamily();

  /// Provider for workouts in a training plan
  ///
  /// Copied from [trainingPlanWorkouts].
  TrainingPlanWorkoutsProvider call(
    String planId,
  ) {
    return TrainingPlanWorkoutsProvider(
      planId,
    );
  }

  @override
  TrainingPlanWorkoutsProvider getProviderOverride(
    covariant TrainingPlanWorkoutsProvider provider,
  ) {
    return call(
      provider.planId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trainingPlanWorkoutsProvider';
}

/// Provider for workouts in a training plan
///
/// Copied from [trainingPlanWorkouts].
class TrainingPlanWorkoutsProvider
    extends AutoDisposeFutureProvider<List<Workout>> {
  /// Provider for workouts in a training plan
  ///
  /// Copied from [trainingPlanWorkouts].
  TrainingPlanWorkoutsProvider(
    String planId,
  ) : this._internal(
          (ref) => trainingPlanWorkouts(
            ref as TrainingPlanWorkoutsRef,
            planId,
          ),
          from: trainingPlanWorkoutsProvider,
          name: r'trainingPlanWorkoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingPlanWorkoutsHash,
          dependencies: TrainingPlanWorkoutsFamily._dependencies,
          allTransitiveDependencies:
              TrainingPlanWorkoutsFamily._allTransitiveDependencies,
          planId: planId,
        );

  TrainingPlanWorkoutsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.planId,
  }) : super.internal();

  final String planId;

  @override
  Override overrideWith(
    FutureOr<List<Workout>> Function(TrainingPlanWorkoutsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrainingPlanWorkoutsProvider._internal(
        (ref) => create(ref as TrainingPlanWorkoutsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        planId: planId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Workout>> createElement() {
    return _TrainingPlanWorkoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingPlanWorkoutsProvider && other.planId == planId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, planId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrainingPlanWorkoutsRef on AutoDisposeFutureProviderRef<List<Workout>> {
  /// The parameter `planId` of this provider.
  String get planId;
}

class _TrainingPlanWorkoutsProviderElement
    extends AutoDisposeFutureProviderElement<List<Workout>>
    with TrainingPlanWorkoutsRef {
  _TrainingPlanWorkoutsProviderElement(super.provider);

  @override
  String get planId => (origin as TrainingPlanWorkoutsProvider).planId;
}

String _$trainingPlanNotifierHash() =>
    r'30e9b980b1491e13842d8bf8fe10b3b7830a7473';

/// Notifier for managing training plan creation and updates
///
/// Copied from [TrainingPlanNotifier].
@ProviderFor(TrainingPlanNotifier)
final trainingPlanNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TrainingPlanNotifier, void>.internal(
  TrainingPlanNotifier.new,
  name: r'trainingPlanNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trainingPlanNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TrainingPlanNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
