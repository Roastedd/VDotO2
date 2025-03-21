import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:vo2rpg/data/models/achievement.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/models/workout_metrics.dart';

part 'achievement_service.g.dart';

/// Service for managing achievements and tracking progress
@riverpod
class AchievementService extends _$AchievementService {
  final _uuid = const Uuid();
  final Map<String, Achievement> _achievements = {};
  final Map<String, AchievementProgress> _progress = {};

  @override
  Stream<List<Achievement>> build() async* {
    // Initialize default achievements
    if (_achievements.isEmpty) {
      _initializeDefaultAchievements();
    }
    yield _achievements.values.toList();
  }

  /// Initialize default achievements
  void _initializeDefaultAchievements() {
    // Distance achievements
    _addAchievement(
      title: 'First Steps',
      description: 'Run your first kilometer',
      type: AchievementType.distance,
      requiredValue: 1000,
      iconName: 'distance_1',
    );
    _addAchievement(
      title: 'Getting Started',
      description: 'Run 5 kilometers total',
      type: AchievementType.distance,
      requiredValue: 5000,
      iconName: 'distance_5',
    );
    _addAchievement(
      title: 'Road Warrior',
      description: 'Run 10 kilometers total',
      type: AchievementType.distance,
      requiredValue: 10000,
      iconName: 'distance_10',
    );
    _addAchievement(
      title: 'Half Marathon Hero',
      description: 'Run 21.1 kilometers total',
      type: AchievementType.distance,
      requiredValue: 21097,
      iconName: 'distance_half',
    );
    _addAchievement(
      title: 'Marathon Master',
      description: 'Run 42.2 kilometers total',
      type: AchievementType.distance,
      requiredValue: 42195,
      iconName: 'distance_full',
    );

    // Streak achievements
    _addAchievement(
      title: 'Consistent Runner',
      description: 'Complete workouts 3 days in a row',
      type: AchievementType.streak,
      requiredValue: 3,
      iconName: 'streak_3',
    );
    _addAchievement(
      title: 'Dedicated Runner',
      description: 'Complete workouts 7 days in a row',
      type: AchievementType.streak,
      requiredValue: 7,
      iconName: 'streak_7',
    );
    _addAchievement(
      title: 'Running Fanatic',
      description: 'Complete workouts 30 days in a row',
      type: AchievementType.streak,
      requiredValue: 30,
      iconName: 'streak_30',
    );

    // Speed achievements
    _addAchievement(
      title: 'Speed Demon',
      description: 'Run 1 kilometer under 5 minutes',
      type: AchievementType.speed,
      requiredValue: 300,
      iconName: 'speed_5',
    );
    _addAchievement(
      title: 'Lightning Fast',
      description: 'Run 1 kilometer under 4 minutes',
      type: AchievementType.speed,
      requiredValue: 240,
      iconName: 'speed_4',
    );

    // VDOT achievements
    _addAchievement(
      title: 'Fitness Level 1',
      description: 'Reach VDOT score of 30',
      type: AchievementType.vdot,
      requiredValue: 30,
      iconName: 'vdot_30',
    );
    _addAchievement(
      title: 'Fitness Level 2',
      description: 'Reach VDOT score of 40',
      type: AchievementType.vdot,
      requiredValue: 40,
      iconName: 'vdot_40',
    );
    _addAchievement(
      title: 'Fitness Level 3',
      description: 'Reach VDOT score of 50',
      type: AchievementType.vdot,
      requiredValue: 50,
      iconName: 'vdot_50',
    );
  }

  /// Add a new achievement
  void _addAchievement({
    required String title,
    required String description,
    required AchievementType type,
    required int requiredValue,
    String? iconName,
  }) {
    final achievement = Achievement(
      id: _uuid.v4(),
      title: title,
      description: description,
      type: type,
      requiredValue: requiredValue,
      currentValue: 0,
      iconName: iconName,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _achievements[achievement.id] = achievement;
  }

  /// Update achievement progress based on workout completion
  void updateProgress(Workout workout, WorkoutMetrics metrics) {
    final now = DateTime.now();

    // Update distance achievements
    if (metrics.distance != null) {
      _updateTypeProgress(
        type: AchievementType.distance,
        value: metrics.distance!.toInt(),
        timestamp: now,
      );
    }

    // Update speed achievements
    if (metrics.currentPace != null) {
      _updateTypeProgress(
        type: AchievementType.speed,
        value: metrics.currentPace!.toInt(),
        timestamp: now,
        compareFunction: (current, required) => current <= required,
      );
    }

    // Update streak achievements
    _updateStreak(workout.completedDate ?? now);
  }

  /// Update VDOT achievement progress
  void updateVdotProgress(double vdot) {
    _updateTypeProgress(
      type: AchievementType.vdot,
      value: vdot.toInt(),
      timestamp: DateTime.now(),
    );
  }

  /// Update progress for achievements of a specific type
  void _updateTypeProgress({
    required AchievementType type,
    required int value,
    required DateTime timestamp,
    bool Function(int current, int required)? compareFunction,
  }) {
    final typeAchievements = _achievements.values
        .where((a) => a.type == type && !a.isCompleted)
        .toList();

    for (final achievement in typeAchievements) {
      final progress = _progress[achievement.id] ??
          AchievementProgress(
            achievementId: achievement.id,
            currentValue: 0,
            lastUpdated: timestamp,
          );

      final newValue = type == AchievementType.streak
          ? value
          : progress.currentValue + value;

      final isCompleted =
          compareFunction?.call(newValue, achievement.requiredValue) ??
              newValue >= achievement.requiredValue;

      if (isCompleted && !achievement.isCompleted) {
        _achievements[achievement.id] = achievement.copyWith(
          isCompleted: true,
          completedAt: timestamp,
          currentValue: newValue,
          updatedAt: timestamp,
        );
        state = AsyncValue.data(_achievements.values.toList());
      } else {
        _progress[achievement.id] = progress.copyWith(
          currentValue: newValue,
          lastUpdated: timestamp,
        );
      }
    }
  }

  /// Update workout streak
  void _updateStreak(DateTime completionDate) {
    final streakAchievements = _achievements.values
        .where((a) => a.type == AchievementType.streak && !a.isCompleted)
        .toList();

    for (final achievement in streakAchievements) {
      final progress = _progress[achievement.id];

      if (progress == null) {
        _progress[achievement.id] = AchievementProgress(
          achievementId: achievement.id,
          currentValue: 1,
          lastUpdated: completionDate,
        );
        continue;
      }

      final daysSinceLastWorkout =
          completionDate.difference(progress.lastUpdated).inDays;

      final newStreak =
          daysSinceLastWorkout <= 1 ? progress.currentValue + 1 : 1;

      if (newStreak >= achievement.requiredValue) {
        _achievements[achievement.id] = achievement.copyWith(
          isCompleted: true,
          completedAt: completionDate,
          currentValue: newStreak,
          updatedAt: completionDate,
        );
        state = AsyncValue.data(_achievements.values.toList());
      } else {
        _progress[achievement.id] = progress.copyWith(
          currentValue: newStreak,
          lastUpdated: completionDate,
        );
      }
    }
  }

  /// Get all achievements
  List<Achievement> getAchievements() => _achievements.values.toList();

  /// Get achievements of a specific type
  List<Achievement> getAchievementsByType(AchievementType type) =>
      _achievements.values.where((a) => a.type == type).toList();

  /// Get completed achievements
  List<Achievement> getCompletedAchievements() =>
      _achievements.values.where((a) => a.isCompleted).toList();

  /// Get achievement progress
  AchievementProgress? getProgress(String achievementId) =>
      _progress[achievementId];
}
