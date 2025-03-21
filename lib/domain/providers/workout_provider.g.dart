// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutHash() => r'ce3f7ff5a0a5f8fe7342371cd897ecf59fde3674';

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

/// Provider for fetching workout details
///
/// Copied from [workout].
@ProviderFor(workout)
const workoutProvider = WorkoutFamily();

/// Provider for fetching workout details
///
/// Copied from [workout].
class WorkoutFamily extends Family<AsyncValue<Workout?>> {
  /// Provider for fetching workout details
  ///
  /// Copied from [workout].
  const WorkoutFamily();

  /// Provider for fetching workout details
  ///
  /// Copied from [workout].
  WorkoutProvider call(
    String workoutId,
  ) {
    return WorkoutProvider(
      workoutId,
    );
  }

  @override
  WorkoutProvider getProviderOverride(
    covariant WorkoutProvider provider,
  ) {
    return call(
      provider.workoutId,
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
  String? get name => r'workoutProvider';
}

/// Provider for fetching workout details
///
/// Copied from [workout].
class WorkoutProvider extends AutoDisposeFutureProvider<Workout?> {
  /// Provider for fetching workout details
  ///
  /// Copied from [workout].
  WorkoutProvider(
    String workoutId,
  ) : this._internal(
          (ref) => workout(
            ref as WorkoutRef,
            workoutId,
          ),
          from: workoutProvider,
          name: r'workoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutHash,
          dependencies: WorkoutFamily._dependencies,
          allTransitiveDependencies: WorkoutFamily._allTransitiveDependencies,
          workoutId: workoutId,
        );

  WorkoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workoutId,
  }) : super.internal();

  final String workoutId;

  @override
  Override overrideWith(
    FutureOr<Workout?> Function(WorkoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutProvider._internal(
        (ref) => create(ref as WorkoutRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workoutId: workoutId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Workout?> createElement() {
    return _WorkoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutProvider && other.workoutId == workoutId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workoutId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutRef on AutoDisposeFutureProviderRef<Workout?> {
  /// The parameter `workoutId` of this provider.
  String get workoutId;
}

class _WorkoutProviderElement extends AutoDisposeFutureProviderElement<Workout?>
    with WorkoutRef {
  _WorkoutProviderElement(super.provider);

  @override
  String get workoutId => (origin as WorkoutProvider).workoutId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
