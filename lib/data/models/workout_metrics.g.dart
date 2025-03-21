// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutMetrics _$WorkoutMetricsFromJson(Map<String, dynamic> json) =>
    _WorkoutMetrics(
      heartRate: (json['heart_rate'] as num?)?.toInt(),
      currentPace: (json['current_pace'] as num?)?.toDouble(),
      averagePace: (json['average_pace'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      speed: (json['speed'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
      cadence: (json['cadence'] as num?)?.toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$WorkoutMetricsToJson(_WorkoutMetrics instance) =>
    <String, dynamic>{
      'heart_rate': instance.heartRate,
      'current_pace': instance.currentPace,
      'average_pace': instance.averagePace,
      'distance': instance.distance,
      'duration': instance.duration?.inMicroseconds,
      'speed': instance.speed,
      'elevation': instance.elevation,
      'cadence': instance.cadence,
      'timestamp': instance.timestamp.toIso8601String(),
    };
