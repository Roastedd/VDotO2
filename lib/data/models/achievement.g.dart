// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
      requiredValue: (json['required_value'] as num).toInt(),
      currentValue: (json['current_value'] as num).toInt(),
      isCompleted: json['is_completed'] as bool? ?? false,
      iconName: json['icon_name'] as String?,
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'required_value': instance.requiredValue,
      'current_value': instance.currentValue,
      'is_completed': instance.isCompleted,
      'icon_name': instance.iconName,
      'completed_at': instance.completedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$AchievementTypeEnumMap = {
  AchievementType.distance: 'distance',
  AchievementType.streak: 'streak',
  AchievementType.speed: 'speed',
  AchievementType.elevation: 'elevation',
  AchievementType.workout: 'workout',
  AchievementType.vdot: 'vdot',
};

_AchievementProgress _$AchievementProgressFromJson(Map<String, dynamic> json) =>
    _AchievementProgress(
      achievementId: json['achievement_id'] as String,
      currentValue: (json['current_value'] as num).toInt(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$AchievementProgressToJson(
        _AchievementProgress instance) =>
    <String, dynamic>{
      'achievement_id': instance.achievementId,
      'current_value': instance.currentValue,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
