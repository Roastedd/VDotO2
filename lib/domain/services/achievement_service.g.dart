// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$achievementServiceHash() =>
    r'e91ae95f131a7f1c1a095968af955d9de7e07e8e';

/// Service for managing achievements and tracking progress
///
/// Copied from [AchievementService].
@ProviderFor(AchievementService)
final achievementServiceProvider = AutoDisposeStreamNotifierProvider<
    AchievementService, List<Achievement>>.internal(
  AchievementService.new,
  name: r'achievementServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$achievementServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AchievementService = AutoDisposeStreamNotifier<List<Achievement>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
