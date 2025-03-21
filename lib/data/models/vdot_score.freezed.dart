// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vdot_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VdotScore {
  String? get id;
  String get userId;
  double get score;
  @JsonKey(name: 'race_distance')
  double get raceDistance;
  @JsonKey(name: 'race_time')
  double get raceTime;
  @JsonKey(name: 'assessment_date')
  DateTime get assessmentDate;
  @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
  DateTime? get updatedAt;

  /// Create a copy of VdotScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VdotScoreCopyWith<VdotScore> get copyWith =>
      _$VdotScoreCopyWithImpl<VdotScore>(this as VdotScore, _$identity);

  /// Serializes this VdotScore to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VdotScore &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.raceDistance, raceDistance) ||
                other.raceDistance == raceDistance) &&
            (identical(other.raceTime, raceTime) ||
                other.raceTime == raceTime) &&
            (identical(other.assessmentDate, assessmentDate) ||
                other.assessmentDate == assessmentDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, score, raceDistance,
      raceTime, assessmentDate, createdAt, updatedAt);

  @override
  String toString() {
    return 'VdotScore(id: $id, userId: $userId, score: $score, raceDistance: $raceDistance, raceTime: $raceTime, assessmentDate: $assessmentDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $VdotScoreCopyWith<$Res> {
  factory $VdotScoreCopyWith(VdotScore value, $Res Function(VdotScore) _then) =
      _$VdotScoreCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String userId,
      double score,
      @JsonKey(name: 'race_distance') double raceDistance,
      @JsonKey(name: 'race_time') double raceTime,
      @JsonKey(name: 'assessment_date') DateTime assessmentDate,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class _$VdotScoreCopyWithImpl<$Res> implements $VdotScoreCopyWith<$Res> {
  _$VdotScoreCopyWithImpl(this._self, this._then);

  final VdotScore _self;
  final $Res Function(VdotScore) _then;

  /// Create a copy of VdotScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? score = null,
    Object? raceDistance = null,
    Object? raceTime = null,
    Object? assessmentDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      raceDistance: null == raceDistance
          ? _self.raceDistance
          : raceDistance // ignore: cast_nullable_to_non_nullable
              as double,
      raceTime: null == raceTime
          ? _self.raceTime
          : raceTime // ignore: cast_nullable_to_non_nullable
              as double,
      assessmentDate: null == assessmentDate
          ? _self.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VdotScore implements VdotScore {
  const _VdotScore(
      {this.id,
      required this.userId,
      required this.score,
      @JsonKey(name: 'race_distance') required this.raceDistance,
      @JsonKey(name: 'race_time') required this.raceTime,
      @JsonKey(name: 'assessment_date') required this.assessmentDate,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      this.createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      this.updatedAt});
  factory _VdotScore.fromJson(Map<String, dynamic> json) =>
      _$VdotScoreFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final double score;
  @override
  @JsonKey(name: 'race_distance')
  final double raceDistance;
  @override
  @JsonKey(name: 'race_time')
  final double raceTime;
  @override
  @JsonKey(name: 'assessment_date')
  final DateTime assessmentDate;
  @override
  @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
  final DateTime? updatedAt;

  /// Create a copy of VdotScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VdotScoreCopyWith<_VdotScore> get copyWith =>
      __$VdotScoreCopyWithImpl<_VdotScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VdotScoreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VdotScore &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.raceDistance, raceDistance) ||
                other.raceDistance == raceDistance) &&
            (identical(other.raceTime, raceTime) ||
                other.raceTime == raceTime) &&
            (identical(other.assessmentDate, assessmentDate) ||
                other.assessmentDate == assessmentDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, score, raceDistance,
      raceTime, assessmentDate, createdAt, updatedAt);

  @override
  String toString() {
    return 'VdotScore(id: $id, userId: $userId, score: $score, raceDistance: $raceDistance, raceTime: $raceTime, assessmentDate: $assessmentDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$VdotScoreCopyWith<$Res>
    implements $VdotScoreCopyWith<$Res> {
  factory _$VdotScoreCopyWith(
          _VdotScore value, $Res Function(_VdotScore) _then) =
      __$VdotScoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      double score,
      @JsonKey(name: 'race_distance') double raceDistance,
      @JsonKey(name: 'race_time') double raceTime,
      @JsonKey(name: 'assessment_date') DateTime assessmentDate,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class __$VdotScoreCopyWithImpl<$Res> implements _$VdotScoreCopyWith<$Res> {
  __$VdotScoreCopyWithImpl(this._self, this._then);

  final _VdotScore _self;
  final $Res Function(_VdotScore) _then;

  /// Create a copy of VdotScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? score = null,
    Object? raceDistance = null,
    Object? raceTime = null,
    Object? assessmentDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_VdotScore(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      raceDistance: null == raceDistance
          ? _self.raceDistance
          : raceDistance // ignore: cast_nullable_to_non_nullable
              as double,
      raceTime: null == raceTime
          ? _self.raceTime
          : raceTime // ignore: cast_nullable_to_non_nullable
              as double,
      assessmentDate: null == assessmentDate
          ? _self.assessmentDate
          : assessmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
