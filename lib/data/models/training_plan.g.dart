// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) =>
    _TrainingPlan(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      planType: $enumDecode(_$PlanTypeEnumMap, json['plan_type']),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      targetRaceDistance: (json['target_race_distance'] as num).toInt(),
      targetRaceDate: json['target_race_date'] == null
          ? null
          : DateTime.parse(json['target_race_date'] as String),
      currentWeek: (json['current_week'] as num).toInt(),
      currentVdot: (json['current_vdot'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
      workouts: (json['workouts'] as List<dynamic>?)
              ?.map((e) => Workout.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrainingPlanToJson(_TrainingPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'plan_type': _$PlanTypeEnumMap[instance.planType]!,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'target_race_distance': instance.targetRaceDistance,
      'target_race_date': instance.targetRaceDate?.toIso8601String(),
      'current_week': instance.currentWeek,
      'current_vdot': instance.currentVdot,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'workouts': instance.workouts,
    };

const _$PlanTypeEnumMap = {
  PlanType.base: 'base',
  PlanType.fiveK: '5k',
  PlanType.tenK: '10k',
  PlanType.halfMarathon: 'half_marathon',
  PlanType.marathon: 'marathon',
};
