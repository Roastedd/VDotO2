import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_metrics.freezed.dart';
part 'workout_metrics.g.dart';

/// Data class for workout metrics
@freezed
abstract class WorkoutMetrics with _$WorkoutMetrics {
  const factory WorkoutMetrics({
    int? heartRate,
    double? currentPace, // seconds per kilometer
    double? averagePace, // seconds per kilometer
    double? distance, // meters
    Duration? duration,
    double? speed, // meters per second
    double? elevation, // meters
    double? cadence, // steps per minute
    required DateTime timestamp,
  }) = _WorkoutMetrics;

  factory WorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$WorkoutMetricsFromJson(json);
}
