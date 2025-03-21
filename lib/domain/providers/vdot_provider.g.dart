// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vdot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userVdotScoresHash() => r'3fa4d29d119a68fd1081a6ff1d737ba578f9de4c';

/// Provider for the user's VDOT scores
///
/// Copied from [UserVdotScores].
@ProviderFor(UserVdotScores)
final userVdotScoresProvider =
    AutoDisposeAsyncNotifierProvider<UserVdotScores, List<VdotScore>>.internal(
  UserVdotScores.new,
  name: r'userVdotScoresProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userVdotScoresHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserVdotScores = AutoDisposeAsyncNotifier<List<VdotScore>>;
String _$vdotHash() => r'8e855174ae0f6ef0271f07c120cb73507d208fb2';

/// Provider for managing VDOT calculations and state
///
/// Copied from [Vdot].
@ProviderFor(Vdot)
final vdotProvider = AutoDisposeNotifierProvider<Vdot, double?>.internal(
  Vdot.new,
  name: r'vdotProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vdotHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Vdot = AutoDisposeNotifier<double?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
