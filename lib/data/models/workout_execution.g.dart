// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_execution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutExecution _$WorkoutExecutionFromJson(Map<String, dynamic> json) =>
    _WorkoutExecution(
      id: json['id'] as String,
      workoutId: json['workout_id'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      distance: (json['distance'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      averagePace: (json['average_pace'] as num?)?.toDouble(),
      averageHeartRate: (json['average_heart_rate'] as num?)?.toDouble(),
      elevationGain: (json['elevation_gain'] as num?)?.toDouble(),
      route: (json['route'] as List<dynamic>?)
          ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutExecutionToJson(_WorkoutExecution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workout_id': instance.workoutId,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'distance': instance.distance,
      'duration': instance.duration.inMicroseconds,
      'average_pace': instance.averagePace,
      'average_heart_rate': instance.averageHeartRate,
      'elevation_gain': instance.elevationGain,
      'route': instance.route,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_Position _$PositionFromJson(Map<String, dynamic> json) => _Position(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$PositionToJson(_Position instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'timestamp': instance.timestamp.toIso8601String(),
    };
