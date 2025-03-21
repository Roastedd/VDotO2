import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

/// Types of achievements
enum AchievementType {
  @JsonValue('distance')
  distance, // Total distance milestones

  @JsonValue('streak')
  streak, // Consecutive workout days

  @JsonValue('speed')
  speed, // Speed/pace milestones

  @JsonValue('elevation')
  elevation, // Elevation gain milestones

  @JsonValue('workout')
  workout, // Workout completion milestones

  @JsonValue('vdot')
  vdot, // VDOT improvement milestones
}

/// Achievement model
@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required AchievementType type,
    required int requiredValue,
    required int currentValue,
    @Default(false) bool isCompleted,
    String? iconName,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

/// Achievement progress model
@freezed
abstract class AchievementProgress with _$AchievementProgress {
  const factory AchievementProgress({
    required String achievementId,
    required int currentValue,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
  }) = _AchievementProgress;

  factory AchievementProgress.fromJson(Map<String, dynamic> json) =>
      _$AchievementProgressFromJson(json);
}
