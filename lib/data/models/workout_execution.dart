import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'workout_execution.freezed.dart';
part 'workout_execution.g.dart';

/// Model representing a workout execution session
@freezed
@HiveType(typeId: 13)
abstract class WorkoutExecution with _$WorkoutExecution {
  const factory WorkoutExecution({
    @HiveField(0) required String id,
    @HiveField(1) required String workoutId,
    @HiveField(2) required DateTime startTime,
    @HiveField(3) DateTime? endTime,
    @HiveField(4) required double distance, // in meters

    @HiveField(5) required Duration duration,
    @HiveField(6) double? averagePace, // in seconds per kilometer

    @HiveField(7) double? averageHeartRate,
    @HiveField(8) double? elevationGain,
    @HiveField(9) List<Position>? route,
    @HiveField(10) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(11) @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _WorkoutExecution;

  factory WorkoutExecution.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExecutionFromJson(json);
}

/// Position data point
@freezed
@HiveType(typeId: 14)
abstract class Position with _$Position {
  const factory Position({
    @HiveField(0) required double latitude,
    @HiveField(1) required double longitude,
    @HiveField(2) required double altitude,
    @HiveField(3) required DateTime timestamp,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
