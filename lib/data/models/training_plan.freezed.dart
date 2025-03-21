// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingPlan {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get userId;
  @HiveField(2)
  PlanType get planType;
  @HiveField(3)
  DateTime get startDate;
  @HiveField(4)
  DateTime get endDate;
  @HiveField(5)
  @JsonKey(name: 'target_race_distance')
  int get targetRaceDistance;
  @HiveField(6)
  @JsonKey(name: 'target_race_date')
  DateTime? get targetRaceDate;
  @HiveField(7)
  @JsonKey(name: 'current_week')
  int get currentWeek;
  @HiveField(8)
  @JsonKey(name: 'current_vdot')
  double get currentVdot;
  @HiveField(9)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(10)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @HiveField(11)
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;
  @HiveField(12)
  List<Workout> get workouts;

  /// Create a copy of TrainingPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrainingPlanCopyWith<TrainingPlan> get copyWith =>
      _$TrainingPlanCopyWithImpl<TrainingPlan>(
          this as TrainingPlan, _$identity);

  /// Serializes this TrainingPlan to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrainingPlan &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.targetRaceDistance, targetRaceDistance) ||
                other.targetRaceDistance == targetRaceDistance) &&
            (identical(other.targetRaceDate, targetRaceDate) ||
                other.targetRaceDate == targetRaceDate) &&
            (identical(other.currentWeek, currentWeek) ||
                other.currentWeek == currentWeek) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            const DeepCollectionEquality().equals(other.workouts, workouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      planType,
      startDate,
      endDate,
      targetRaceDistance,
      targetRaceDate,
      currentWeek,
      currentVdot,
      createdAt,
      updatedAt,
      isDeleted,
      const DeepCollectionEquality().hash(workouts));

  @override
  String toString() {
    return 'TrainingPlan(id: $id, userId: $userId, planType: $planType, startDate: $startDate, endDate: $endDate, targetRaceDistance: $targetRaceDistance, targetRaceDate: $targetRaceDate, currentWeek: $currentWeek, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, workouts: $workouts)';
  }
}

/// @nodoc
abstract mixin class $TrainingPlanCopyWith<$Res> {
  factory $TrainingPlanCopyWith(
          TrainingPlan value, $Res Function(TrainingPlan) _then) =
      _$TrainingPlanCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) PlanType planType,
      @HiveField(3) DateTime startDate,
      @HiveField(4) DateTime endDate,
      @HiveField(5)
      @JsonKey(name: 'target_race_distance')
      int targetRaceDistance,
      @HiveField(6) @JsonKey(name: 'target_race_date') DateTime? targetRaceDate,
      @HiveField(7) @JsonKey(name: 'current_week') int currentWeek,
      @HiveField(8) @JsonKey(name: 'current_vdot') double currentVdot,
      @HiveField(9) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(10) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(11) @JsonKey(name: 'is_deleted') bool isDeleted,
      @HiveField(12) List<Workout> workouts});
}

/// @nodoc
class _$TrainingPlanCopyWithImpl<$Res> implements $TrainingPlanCopyWith<$Res> {
  _$TrainingPlanCopyWithImpl(this._self, this._then);

  final TrainingPlan _self;
  final $Res Function(TrainingPlan) _then;

  /// Create a copy of TrainingPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? planType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? targetRaceDistance = null,
    Object? targetRaceDate = freezed,
    Object? currentWeek = null,
    Object? currentVdot = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? workouts = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planType: null == planType
          ? _self.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as PlanType,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetRaceDistance: null == targetRaceDistance
          ? _self.targetRaceDistance
          : targetRaceDistance // ignore: cast_nullable_to_non_nullable
              as int,
      targetRaceDate: freezed == targetRaceDate
          ? _self.targetRaceDate
          : targetRaceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentWeek: null == currentWeek
          ? _self.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as int,
      currentVdot: null == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double,
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
      workouts: null == workouts
          ? _self.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TrainingPlan implements TrainingPlan {
  const _TrainingPlan(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.planType,
      @HiveField(3) required this.startDate,
      @HiveField(4) required this.endDate,
      @HiveField(5)
      @JsonKey(name: 'target_race_distance')
      required this.targetRaceDistance,
      @HiveField(6) @JsonKey(name: 'target_race_date') this.targetRaceDate,
      @HiveField(7) @JsonKey(name: 'current_week') required this.currentWeek,
      @HiveField(8) @JsonKey(name: 'current_vdot') required this.currentVdot,
      @HiveField(9) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(10) @JsonKey(name: 'updated_at') required this.updatedAt,
      @HiveField(11) @JsonKey(name: 'is_deleted') this.isDeleted = false,
      @HiveField(12) this.workouts = const []});
  factory _TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final PlanType planType;
  @override
  @HiveField(3)
  final DateTime startDate;
  @override
  @HiveField(4)
  final DateTime endDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'target_race_distance')
  final int targetRaceDistance;
  @override
  @HiveField(6)
  @JsonKey(name: 'target_race_date')
  final DateTime? targetRaceDate;
  @override
  @HiveField(7)
  @JsonKey(name: 'current_week')
  final int currentWeek;
  @override
  @HiveField(8)
  @JsonKey(name: 'current_vdot')
  final double currentVdot;
  @override
  @HiveField(9)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(10)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @HiveField(11)
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @override
  @JsonKey()
  @HiveField(12)
  final List<Workout> workouts;

  /// Create a copy of TrainingPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrainingPlanCopyWith<_TrainingPlan> get copyWith =>
      __$TrainingPlanCopyWithImpl<_TrainingPlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TrainingPlanToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TrainingPlan &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.targetRaceDistance, targetRaceDistance) ||
                other.targetRaceDistance == targetRaceDistance) &&
            (identical(other.targetRaceDate, targetRaceDate) ||
                other.targetRaceDate == targetRaceDate) &&
            (identical(other.currentWeek, currentWeek) ||
                other.currentWeek == currentWeek) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            const DeepCollectionEquality().equals(other.workouts, workouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      planType,
      startDate,
      endDate,
      targetRaceDistance,
      targetRaceDate,
      currentWeek,
      currentVdot,
      createdAt,
      updatedAt,
      isDeleted,
      const DeepCollectionEquality().hash(workouts));

  @override
  String toString() {
    return 'TrainingPlan(id: $id, userId: $userId, planType: $planType, startDate: $startDate, endDate: $endDate, targetRaceDistance: $targetRaceDistance, targetRaceDate: $targetRaceDate, currentWeek: $currentWeek, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, workouts: $workouts)';
  }
}

/// @nodoc
abstract mixin class _$TrainingPlanCopyWith<$Res>
    implements $TrainingPlanCopyWith<$Res> {
  factory _$TrainingPlanCopyWith(
          _TrainingPlan value, $Res Function(_TrainingPlan) _then) =
      __$TrainingPlanCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) PlanType planType,
      @HiveField(3) DateTime startDate,
      @HiveField(4) DateTime endDate,
      @HiveField(5)
      @JsonKey(name: 'target_race_distance')
      int targetRaceDistance,
      @HiveField(6) @JsonKey(name: 'target_race_date') DateTime? targetRaceDate,
      @HiveField(7) @JsonKey(name: 'current_week') int currentWeek,
      @HiveField(8) @JsonKey(name: 'current_vdot') double currentVdot,
      @HiveField(9) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(10) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(11) @JsonKey(name: 'is_deleted') bool isDeleted,
      @HiveField(12) List<Workout> workouts});
}

/// @nodoc
class __$TrainingPlanCopyWithImpl<$Res>
    implements _$TrainingPlanCopyWith<$Res> {
  __$TrainingPlanCopyWithImpl(this._self, this._then);

  final _TrainingPlan _self;
  final $Res Function(_TrainingPlan) _then;

  /// Create a copy of TrainingPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? planType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? targetRaceDistance = null,
    Object? targetRaceDate = freezed,
    Object? currentWeek = null,
    Object? currentVdot = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? workouts = null,
  }) {
    return _then(_TrainingPlan(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      planType: null == planType
          ? _self.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as PlanType,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetRaceDistance: null == targetRaceDistance
          ? _self.targetRaceDistance
          : targetRaceDistance // ignore: cast_nullable_to_non_nullable
              as int,
      targetRaceDate: freezed == targetRaceDate
          ? _self.targetRaceDate
          : targetRaceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentWeek: null == currentWeek
          ? _self.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as int,
      currentVdot: null == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double,
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
      workouts: null == workouts
          ? _self.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

// dart format on
