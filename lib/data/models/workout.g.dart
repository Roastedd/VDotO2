// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Workout _$WorkoutFromJson(Map<String, dynamic> json) => _Workout(
      id: json['id'] as String,
      trainingPlanId: json['training_plan_id'] as String,
      workoutType: $enumDecode(_$WorkoutTypeEnumMap, json['workout_type']),
      scheduledDate: DateTime.parse(json['scheduled_date'] as String),
      completedDate: json['completed_date'] == null
          ? null
          : DateTime.parse(json['completed_date'] as String),
      plannedDistance: (json['planned_distance'] as num?)?.toInt(),
      actualDistance: (json['actual_distance'] as num?)?.toInt(),
      plannedDuration: (json['planned_duration'] as num?)?.toInt(),
      actualDuration: (json['actual_duration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      status: $enumDecodeNullable(_$WorkoutStatusEnumMap, json['status']) ??
          WorkoutStatus.pending,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$WorkoutToJson(_Workout instance) => <String, dynamic>{
      'id': instance.id,
      'training_plan_id': instance.trainingPlanId,
      'workout_type': _$WorkoutTypeEnumMap[instance.workoutType]!,
      'scheduled_date': instance.scheduledDate.toIso8601String(),
      'completed_date': instance.completedDate?.toIso8601String(),
      'planned_distance': instance.plannedDistance,
      'actual_distance': instance.actualDistance,
      'planned_duration': instance.plannedDuration,
      'actual_duration': instance.actualDuration,
      'notes': instance.notes,
      'status': _$WorkoutStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.interval: 'interval',
  WorkoutType.threshold: 'threshold',
  WorkoutType.easy: 'easy',
  WorkoutType.longRun: 'long_run',
  WorkoutType.rest: 'rest',
};

const _$WorkoutStatusEnumMap = {
  WorkoutStatus.pending: 'pending',
  WorkoutStatus.completed: 'completed',
  WorkoutStatus.skipped: 'skipped',
};
