// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutMetrics {
  int? get heartRate;
  double? get currentPace; // seconds per kilometer
  double? get averagePace; // seconds per kilometer
  double? get distance; // meters
  Duration? get duration;
  double? get speed; // meters per second
  double? get elevation; // meters
  double? get cadence; // steps per minute
  DateTime get timestamp;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutMetricsCopyWith<WorkoutMetrics> get copyWith =>
      _$WorkoutMetricsCopyWithImpl<WorkoutMetrics>(
          this as WorkoutMetrics, _$identity);

  /// Serializes this WorkoutMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutMetrics &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.currentPace, currentPace) ||
                other.currentPace == currentPace) &&
            (identical(other.averagePace, averagePace) ||
                other.averagePace == averagePace) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.cadence, cadence) || other.cadence == cadence) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heartRate, currentPace,
      averagePace, distance, duration, speed, elevation, cadence, timestamp);

  @override
  String toString() {
    return 'WorkoutMetrics(heartRate: $heartRate, currentPace: $currentPace, averagePace: $averagePace, distance: $distance, duration: $duration, speed: $speed, elevation: $elevation, cadence: $cadence, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $WorkoutMetricsCopyWith<$Res> {
  factory $WorkoutMetricsCopyWith(
          WorkoutMetrics value, $Res Function(WorkoutMetrics) _then) =
      _$WorkoutMetricsCopyWithImpl;
  @useResult
  $Res call(
      {int? heartRate,
      double? currentPace,
      double? averagePace,
      double? distance,
      Duration? duration,
      double? speed,
      double? elevation,
      double? cadence,
      DateTime timestamp});
}

/// @nodoc
class _$WorkoutMetricsCopyWithImpl<$Res>
    implements $WorkoutMetricsCopyWith<$Res> {
  _$WorkoutMetricsCopyWithImpl(this._self, this._then);

  final WorkoutMetrics _self;
  final $Res Function(WorkoutMetrics) _then;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heartRate = freezed,
    Object? currentPace = freezed,
    Object? averagePace = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? speed = freezed,
    Object? elevation = freezed,
    Object? cadence = freezed,
    Object? timestamp = null,
  }) {
    return _then(_self.copyWith(
      heartRate: freezed == heartRate
          ? _self.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPace: freezed == currentPace
          ? _self.currentPace
          : currentPace // ignore: cast_nullable_to_non_nullable
              as double?,
      averagePace: freezed == averagePace
          ? _self.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      elevation: freezed == elevation
          ? _self.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      cadence: freezed == cadence
          ? _self.cadence
          : cadence // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkoutMetrics implements WorkoutMetrics {
  const _WorkoutMetrics(
      {this.heartRate,
      this.currentPace,
      this.averagePace,
      this.distance,
      this.duration,
      this.speed,
      this.elevation,
      this.cadence,
      required this.timestamp});
  factory _WorkoutMetrics.fromJson(Map<String, dynamic> json) =>
      _$WorkoutMetricsFromJson(json);

  @override
  final int? heartRate;
  @override
  final double? currentPace;
// seconds per kilometer
  @override
  final double? averagePace;
// seconds per kilometer
  @override
  final double? distance;
// meters
  @override
  final Duration? duration;
  @override
  final double? speed;
// meters per second
  @override
  final double? elevation;
// meters
  @override
  final double? cadence;
// steps per minute
  @override
  final DateTime timestamp;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutMetricsCopyWith<_WorkoutMetrics> get copyWith =>
      __$WorkoutMetricsCopyWithImpl<_WorkoutMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkoutMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutMetrics &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.currentPace, currentPace) ||
                other.currentPace == currentPace) &&
            (identical(other.averagePace, averagePace) ||
                other.averagePace == averagePace) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.cadence, cadence) || other.cadence == cadence) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heartRate, currentPace,
      averagePace, distance, duration, speed, elevation, cadence, timestamp);

  @override
  String toString() {
    return 'WorkoutMetrics(heartRate: $heartRate, currentPace: $currentPace, averagePace: $averagePace, distance: $distance, duration: $duration, speed: $speed, elevation: $elevation, cadence: $cadence, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutMetricsCopyWith<$Res>
    implements $WorkoutMetricsCopyWith<$Res> {
  factory _$WorkoutMetricsCopyWith(
          _WorkoutMetrics value, $Res Function(_WorkoutMetrics) _then) =
      __$WorkoutMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? heartRate,
      double? currentPace,
      double? averagePace,
      double? distance,
      Duration? duration,
      double? speed,
      double? elevation,
      double? cadence,
      DateTime timestamp});
}

/// @nodoc
class __$WorkoutMetricsCopyWithImpl<$Res>
    implements _$WorkoutMetricsCopyWith<$Res> {
  __$WorkoutMetricsCopyWithImpl(this._self, this._then);

  final _WorkoutMetrics _self;
  final $Res Function(_WorkoutMetrics) _then;

  /// Create a copy of WorkoutMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? heartRate = freezed,
    Object? currentPace = freezed,
    Object? averagePace = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? speed = freezed,
    Object? elevation = freezed,
    Object? cadence = freezed,
    Object? timestamp = null,
  }) {
    return _then(_WorkoutMetrics(
      heartRate: freezed == heartRate
          ? _self.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPace: freezed == currentPace
          ? _self.currentPace
          : currentPace // ignore: cast_nullable_to_non_nullable
              as double?,
      averagePace: freezed == averagePace
          ? _self.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      elevation: freezed == elevation
          ? _self.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      cadence: freezed == cadence
          ? _self.cadence
          : cadence // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
