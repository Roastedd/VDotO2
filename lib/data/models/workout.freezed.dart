// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Workout {
  @HiveField(0)
  String get id;
  @HiveField(1)
  @JsonKey(name: 'training_plan_id')
  String get trainingPlanId;
  @HiveField(2)
  @JsonKey(name: 'workout_type')
  WorkoutType get workoutType;
  @HiveField(3)
  @JsonKey(name: 'scheduled_date')
  DateTime get scheduledDate;
  @HiveField(4)
  @JsonKey(name: 'completed_date')
  DateTime? get completedDate;
  @HiveField(5)
  @JsonKey(name: 'planned_distance')
  int? get plannedDistance;
  @HiveField(6)
  @JsonKey(name: 'actual_distance')
  int? get actualDistance;
  @HiveField(7)
  @JsonKey(name: 'planned_duration')
  int? get plannedDuration;
  @HiveField(8)
  @JsonKey(name: 'actual_duration')
  int? get actualDuration;
  @HiveField(9)
  String? get notes;
  @HiveField(10)
  WorkoutStatus get status;
  @HiveField(11)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(12)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @HiveField(13)
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<Workout> get copyWith =>
      _$WorkoutCopyWithImpl<Workout>(this as Workout, _$identity);

  /// Serializes this Workout to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Workout &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trainingPlanId, trainingPlanId) ||
                other.trainingPlanId == trainingPlanId) &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.plannedDistance, plannedDistance) ||
                other.plannedDistance == plannedDistance) &&
            (identical(other.actualDistance, actualDistance) ||
                other.actualDistance == actualDistance) &&
            (identical(other.plannedDuration, plannedDuration) ||
                other.plannedDuration == plannedDuration) &&
            (identical(other.actualDuration, actualDuration) ||
                other.actualDuration == actualDuration) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      trainingPlanId,
      workoutType,
      scheduledDate,
      completedDate,
      plannedDistance,
      actualDistance,
      plannedDuration,
      actualDuration,
      notes,
      status,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'Workout(id: $id, trainingPlanId: $trainingPlanId, workoutType: $workoutType, scheduledDate: $scheduledDate, completedDate: $completedDate, plannedDistance: $plannedDistance, actualDistance: $actualDistance, plannedDuration: $plannedDuration, actualDuration: $actualDuration, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) _then) =
      _$WorkoutCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'training_plan_id') String trainingPlanId,
      @HiveField(2) @JsonKey(name: 'workout_type') WorkoutType workoutType,
      @HiveField(3) @JsonKey(name: 'scheduled_date') DateTime scheduledDate,
      @HiveField(4) @JsonKey(name: 'completed_date') DateTime? completedDate,
      @HiveField(5) @JsonKey(name: 'planned_distance') int? plannedDistance,
      @HiveField(6) @JsonKey(name: 'actual_distance') int? actualDistance,
      @HiveField(7) @JsonKey(name: 'planned_duration') int? plannedDuration,
      @HiveField(8) @JsonKey(name: 'actual_duration') int? actualDuration,
      @HiveField(9) String? notes,
      @HiveField(10) WorkoutStatus status,
      @HiveField(11) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(12) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(13) @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res> implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._self, this._then);

  final Workout _self;
  final $Res Function(Workout) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainingPlanId = null,
    Object? workoutType = null,
    Object? scheduledDate = null,
    Object? completedDate = freezed,
    Object? plannedDistance = freezed,
    Object? actualDistance = freezed,
    Object? plannedDuration = freezed,
    Object? actualDuration = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      trainingPlanId: null == trainingPlanId
          ? _self.trainingPlanId
          : trainingPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      workoutType: null == workoutType
          ? _self.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      scheduledDate: null == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _self.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      plannedDistance: freezed == plannedDistance
          ? _self.plannedDistance
          : plannedDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDistance: freezed == actualDistance
          ? _self.actualDistance
          : actualDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      plannedDuration: freezed == plannedDuration
          ? _self.plannedDuration
          : plannedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDuration: freezed == actualDuration
          ? _self.actualDuration
          : actualDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Workout implements Workout {
  const _Workout(
      {@HiveField(0) required this.id,
      @HiveField(1)
      @JsonKey(name: 'training_plan_id')
      required this.trainingPlanId,
      @HiveField(2) @JsonKey(name: 'workout_type') required this.workoutType,
      @HiveField(3)
      @JsonKey(name: 'scheduled_date')
      required this.scheduledDate,
      @HiveField(4) @JsonKey(name: 'completed_date') this.completedDate,
      @HiveField(5) @JsonKey(name: 'planned_distance') this.plannedDistance,
      @HiveField(6) @JsonKey(name: 'actual_distance') this.actualDistance,
      @HiveField(7) @JsonKey(name: 'planned_duration') this.plannedDuration,
      @HiveField(8) @JsonKey(name: 'actual_duration') this.actualDuration,
      @HiveField(9) this.notes,
      @HiveField(10) this.status = WorkoutStatus.pending,
      @HiveField(11) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(12) @JsonKey(name: 'updated_at') required this.updatedAt,
      @HiveField(13) @JsonKey(name: 'is_deleted') this.isDeleted = false});
  factory _Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'training_plan_id')
  final String trainingPlanId;
  @override
  @HiveField(2)
  @JsonKey(name: 'workout_type')
  final WorkoutType workoutType;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_date')
  final DateTime scheduledDate;
  @override
  @HiveField(4)
  @JsonKey(name: 'completed_date')
  final DateTime? completedDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'planned_distance')
  final int? plannedDistance;
  @override
  @HiveField(6)
  @JsonKey(name: 'actual_distance')
  final int? actualDistance;
  @override
  @HiveField(7)
  @JsonKey(name: 'planned_duration')
  final int? plannedDuration;
  @override
  @HiveField(8)
  @JsonKey(name: 'actual_duration')
  final int? actualDuration;
  @override
  @HiveField(9)
  final String? notes;
  @override
  @JsonKey()
  @HiveField(10)
  final WorkoutStatus status;
  @override
  @HiveField(11)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(12)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @HiveField(13)
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutCopyWith<_Workout> get copyWith =>
      __$WorkoutCopyWithImpl<_Workout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkoutToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Workout &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trainingPlanId, trainingPlanId) ||
                other.trainingPlanId == trainingPlanId) &&
            (identical(other.workoutType, workoutType) ||
                other.workoutType == workoutType) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.plannedDistance, plannedDistance) ||
                other.plannedDistance == plannedDistance) &&
            (identical(other.actualDistance, actualDistance) ||
                other.actualDistance == actualDistance) &&
            (identical(other.plannedDuration, plannedDuration) ||
                other.plannedDuration == plannedDuration) &&
            (identical(other.actualDuration, actualDuration) ||
                other.actualDuration == actualDuration) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      trainingPlanId,
      workoutType,
      scheduledDate,
      completedDate,
      plannedDistance,
      actualDistance,
      plannedDuration,
      actualDuration,
      notes,
      status,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'Workout(id: $id, trainingPlanId: $trainingPlanId, workoutType: $workoutType, scheduledDate: $scheduledDate, completedDate: $completedDate, plannedDistance: $plannedDistance, actualDistance: $actualDistance, plannedDuration: $plannedDuration, actualDuration: $actualDuration, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$WorkoutCopyWith(_Workout value, $Res Function(_Workout) _then) =
      __$WorkoutCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'training_plan_id') String trainingPlanId,
      @HiveField(2) @JsonKey(name: 'workout_type') WorkoutType workoutType,
      @HiveField(3) @JsonKey(name: 'scheduled_date') DateTime scheduledDate,
      @HiveField(4) @JsonKey(name: 'completed_date') DateTime? completedDate,
      @HiveField(5) @JsonKey(name: 'planned_distance') int? plannedDistance,
      @HiveField(6) @JsonKey(name: 'actual_distance') int? actualDistance,
      @HiveField(7) @JsonKey(name: 'planned_duration') int? plannedDuration,
      @HiveField(8) @JsonKey(name: 'actual_duration') int? actualDuration,
      @HiveField(9) String? notes,
      @HiveField(10) WorkoutStatus status,
      @HiveField(11) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(12) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(13) @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class __$WorkoutCopyWithImpl<$Res> implements _$WorkoutCopyWith<$Res> {
  __$WorkoutCopyWithImpl(this._self, this._then);

  final _Workout _self;
  final $Res Function(_Workout) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? trainingPlanId = null,
    Object? workoutType = null,
    Object? scheduledDate = null,
    Object? completedDate = freezed,
    Object? plannedDistance = freezed,
    Object? actualDistance = freezed,
    Object? plannedDuration = freezed,
    Object? actualDuration = freezed,
    Object? notes = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_Workout(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      trainingPlanId: null == trainingPlanId
          ? _self.trainingPlanId
          : trainingPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      workoutType: null == workoutType
          ? _self.workoutType
          : workoutType // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      scheduledDate: null == scheduledDate
          ? _self.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _self.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      plannedDistance: freezed == plannedDistance
          ? _self.plannedDistance
          : plannedDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDistance: freezed == actualDistance
          ? _self.actualDistance
          : actualDistance // ignore: cast_nullable_to_non_nullable
              as int?,
      plannedDuration: freezed == plannedDuration
          ? _self.plannedDuration
          : plannedDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDuration: freezed == actualDuration
          ? _self.actualDuration
          : actualDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkoutStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
