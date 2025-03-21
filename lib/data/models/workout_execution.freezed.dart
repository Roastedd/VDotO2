// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_execution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutExecution {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get workoutId;
  @HiveField(2)
  DateTime get startTime;
  @HiveField(3)
  DateTime? get endTime;
  @HiveField(4)
  double get distance; // in meters
  @HiveField(5)
  Duration get duration;
  @HiveField(6)
  double? get averagePace; // in seconds per kilometer
  @HiveField(7)
  double? get averageHeartRate;
  @HiveField(8)
  double? get elevationGain;
  @HiveField(9)
  List<Position>? get route;
  @HiveField(10)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(11)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of WorkoutExecution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutExecutionCopyWith<WorkoutExecution> get copyWith =>
      _$WorkoutExecutionCopyWithImpl<WorkoutExecution>(
          this as WorkoutExecution, _$identity);

  /// Serializes this WorkoutExecution to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutExecution &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.averagePace, averagePace) ||
                other.averagePace == averagePace) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.elevationGain, elevationGain) ||
                other.elevationGain == elevationGain) &&
            const DeepCollectionEquality().equals(other.route, route) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workoutId,
      startTime,
      endTime,
      distance,
      duration,
      averagePace,
      averageHeartRate,
      elevationGain,
      const DeepCollectionEquality().hash(route),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'WorkoutExecution(id: $id, workoutId: $workoutId, startTime: $startTime, endTime: $endTime, distance: $distance, duration: $duration, averagePace: $averagePace, averageHeartRate: $averageHeartRate, elevationGain: $elevationGain, route: $route, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $WorkoutExecutionCopyWith<$Res> {
  factory $WorkoutExecutionCopyWith(
          WorkoutExecution value, $Res Function(WorkoutExecution) _then) =
      _$WorkoutExecutionCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String workoutId,
      @HiveField(2) DateTime startTime,
      @HiveField(3) DateTime? endTime,
      @HiveField(4) double distance,
      @HiveField(5) Duration duration,
      @HiveField(6) double? averagePace,
      @HiveField(7) double? averageHeartRate,
      @HiveField(8) double? elevationGain,
      @HiveField(9) List<Position>? route,
      @HiveField(10) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(11) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$WorkoutExecutionCopyWithImpl<$Res>
    implements $WorkoutExecutionCopyWith<$Res> {
  _$WorkoutExecutionCopyWithImpl(this._self, this._then);

  final WorkoutExecution _self;
  final $Res Function(WorkoutExecution) _then;

  /// Create a copy of WorkoutExecution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? distance = null,
    Object? duration = null,
    Object? averagePace = freezed,
    Object? averageHeartRate = freezed,
    Object? elevationGain = freezed,
    Object? route = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averagePace: freezed == averagePace
          ? _self.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double?,
      averageHeartRate: freezed == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as double?,
      elevationGain: freezed == elevationGain
          ? _self.elevationGain
          : elevationGain // ignore: cast_nullable_to_non_nullable
              as double?,
      route: freezed == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Position>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkoutExecution implements WorkoutExecution {
  const _WorkoutExecution(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.workoutId,
      @HiveField(2) required this.startTime,
      @HiveField(3) this.endTime,
      @HiveField(4) required this.distance,
      @HiveField(5) required this.duration,
      @HiveField(6) this.averagePace,
      @HiveField(7) this.averageHeartRate,
      @HiveField(8) this.elevationGain,
      @HiveField(9) this.route,
      @HiveField(10) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(11) @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _WorkoutExecution.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExecutionFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String workoutId;
  @override
  @HiveField(2)
  final DateTime startTime;
  @override
  @HiveField(3)
  final DateTime? endTime;
  @override
  @HiveField(4)
  final double distance;
// in meters
  @override
  @HiveField(5)
  final Duration duration;
  @override
  @HiveField(6)
  final double? averagePace;
// in seconds per kilometer
  @override
  @HiveField(7)
  final double? averageHeartRate;
  @override
  @HiveField(8)
  final double? elevationGain;
  @override
  @HiveField(9)
  final List<Position>? route;
  @override
  @HiveField(10)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(11)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of WorkoutExecution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutExecutionCopyWith<_WorkoutExecution> get copyWith =>
      __$WorkoutExecutionCopyWithImpl<_WorkoutExecution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkoutExecutionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutExecution &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.averagePace, averagePace) ||
                other.averagePace == averagePace) &&
            (identical(other.averageHeartRate, averageHeartRate) ||
                other.averageHeartRate == averageHeartRate) &&
            (identical(other.elevationGain, elevationGain) ||
                other.elevationGain == elevationGain) &&
            const DeepCollectionEquality().equals(other.route, route) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workoutId,
      startTime,
      endTime,
      distance,
      duration,
      averagePace,
      averageHeartRate,
      elevationGain,
      const DeepCollectionEquality().hash(route),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'WorkoutExecution(id: $id, workoutId: $workoutId, startTime: $startTime, endTime: $endTime, distance: $distance, duration: $duration, averagePace: $averagePace, averageHeartRate: $averageHeartRate, elevationGain: $elevationGain, route: $route, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutExecutionCopyWith<$Res>
    implements $WorkoutExecutionCopyWith<$Res> {
  factory _$WorkoutExecutionCopyWith(
          _WorkoutExecution value, $Res Function(_WorkoutExecution) _then) =
      __$WorkoutExecutionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String workoutId,
      @HiveField(2) DateTime startTime,
      @HiveField(3) DateTime? endTime,
      @HiveField(4) double distance,
      @HiveField(5) Duration duration,
      @HiveField(6) double? averagePace,
      @HiveField(7) double? averageHeartRate,
      @HiveField(8) double? elevationGain,
      @HiveField(9) List<Position>? route,
      @HiveField(10) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(11) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$WorkoutExecutionCopyWithImpl<$Res>
    implements _$WorkoutExecutionCopyWith<$Res> {
  __$WorkoutExecutionCopyWithImpl(this._self, this._then);

  final _WorkoutExecution _self;
  final $Res Function(_WorkoutExecution) _then;

  /// Create a copy of WorkoutExecution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workoutId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? distance = null,
    Object? duration = null,
    Object? averagePace = freezed,
    Object? averageHeartRate = freezed,
    Object? elevationGain = freezed,
    Object? route = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_WorkoutExecution(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      averagePace: freezed == averagePace
          ? _self.averagePace
          : averagePace // ignore: cast_nullable_to_non_nullable
              as double?,
      averageHeartRate: freezed == averageHeartRate
          ? _self.averageHeartRate
          : averageHeartRate // ignore: cast_nullable_to_non_nullable
              as double?,
      elevationGain: freezed == elevationGain
          ? _self.elevationGain
          : elevationGain // ignore: cast_nullable_to_non_nullable
              as double?,
      route: freezed == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<Position>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$Position {
  @HiveField(0)
  double get latitude;
  @HiveField(1)
  double get longitude;
  @HiveField(2)
  double get altitude;
  @HiveField(3)
  DateTime get timestamp;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PositionCopyWith<Position> get copyWith =>
      _$PositionCopyWithImpl<Position>(this as Position, _$identity);

  /// Serializes this Position to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Position &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, altitude, timestamp);

  @override
  String toString() {
    return 'Position(latitude: $latitude, longitude: $longitude, altitude: $altitude, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) _then) =
      _$PositionCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) double altitude,
      @HiveField(3) DateTime timestamp});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res> implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._self, this._then);

  final Position _self;
  final $Res Function(Position) _then;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? timestamp = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _self.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Position implements Position {
  const _Position(
      {@HiveField(0) required this.latitude,
      @HiveField(1) required this.longitude,
      @HiveField(2) required this.altitude,
      @HiveField(3) required this.timestamp});
  factory _Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  @override
  @HiveField(0)
  final double latitude;
  @override
  @HiveField(1)
  final double longitude;
  @override
  @HiveField(2)
  final double altitude;
  @override
  @HiveField(3)
  final DateTime timestamp;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PositionCopyWith<_Position> get copyWith =>
      __$PositionCopyWithImpl<_Position>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PositionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Position &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, altitude, timestamp);

  @override
  String toString() {
    return 'Position(latitude: $latitude, longitude: $longitude, altitude: $altitude, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$PositionCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$PositionCopyWith(_Position value, $Res Function(_Position) _then) =
      __$PositionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) double altitude,
      @HiveField(3) DateTime timestamp});
}

/// @nodoc
class __$PositionCopyWithImpl<$Res> implements _$PositionCopyWith<$Res> {
  __$PositionCopyWithImpl(this._self, this._then);

  final _Position _self;
  final $Res Function(_Position) _then;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? timestamp = null,
  }) {
    return _then(_Position(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _self.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
