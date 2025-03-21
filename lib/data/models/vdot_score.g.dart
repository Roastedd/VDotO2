// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vdot_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VdotScore _$VdotScoreFromJson(Map<String, dynamic> json) => _VdotScore(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      score: (json['score'] as num).toDouble(),
      raceDistance: (json['race_distance'] as num).toDouble(),
      raceTime: (json['race_time'] as num).toDouble(),
      assessmentDate: DateTime.parse(json['assessment_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$VdotScoreToJson(_VdotScore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'score': instance.score,
      'race_distance': instance.raceDistance,
      'race_time': instance.raceTime,
      'assessment_date': instance.assessmentDate.toIso8601String(),
    };
