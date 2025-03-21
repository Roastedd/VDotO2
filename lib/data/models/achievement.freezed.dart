// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Achievement {
  String get id;
  String get title;
  String get description;
  AchievementType get type;
  int get requiredValue;
  int get currentValue;
  bool get isCompleted;
  String? get iconName;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementCopyWith<Achievement> get copyWith =>
      _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Achievement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.requiredValue, requiredValue) ||
                other.requiredValue == requiredValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
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
      title,
      description,
      type,
      requiredValue,
      currentValue,
      isCompleted,
      iconName,
      completedAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, type: $type, requiredValue: $requiredValue, currentValue: $currentValue, isCompleted: $isCompleted, iconName: $iconName, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) _then) =
      _$AchievementCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      int requiredValue,
      int currentValue,
      bool isCompleted,
      String? iconName,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res> implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? requiredValue = null,
    Object? currentValue = null,
    Object? isCompleted = null,
    Object? iconName = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      requiredValue: null == requiredValue
          ? _self.requiredValue
          : requiredValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _self.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      iconName: freezed == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _Achievement implements Achievement {
  const _Achievement(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.requiredValue,
      required this.currentValue,
      this.isCompleted = false,
      this.iconName,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final AchievementType type;
  @override
  final int requiredValue;
  @override
  final int currentValue;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String? iconName;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AchievementCopyWith<_Achievement> get copyWith =>
      __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AchievementToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Achievement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.requiredValue, requiredValue) ||
                other.requiredValue == requiredValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
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
      title,
      description,
      type,
      requiredValue,
      currentValue,
      isCompleted,
      iconName,
      completedAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, type: $type, requiredValue: $requiredValue, currentValue: $currentValue, isCompleted: $isCompleted, iconName: $iconName, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(
          _Achievement value, $Res Function(_Achievement) _then) =
      __$AchievementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      int requiredValue,
      int currentValue,
      bool isCompleted,
      String? iconName,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$AchievementCopyWithImpl<$Res> implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? requiredValue = null,
    Object? currentValue = null,
    Object? isCompleted = null,
    Object? iconName = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Achievement(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      requiredValue: null == requiredValue
          ? _self.requiredValue
          : requiredValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _self.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      iconName: freezed == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
mixin _$AchievementProgress {
  String get achievementId;
  int get currentValue;
  @JsonKey(name: 'last_updated')
  DateTime get lastUpdated;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementProgressCopyWith<AchievementProgress> get copyWith =>
      _$AchievementProgressCopyWithImpl<AchievementProgress>(
          this as AchievementProgress, _$identity);

  /// Serializes this AchievementProgress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementProgress &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, achievementId, currentValue, lastUpdated);

  @override
  String toString() {
    return 'AchievementProgress(achievementId: $achievementId, currentValue: $currentValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class $AchievementProgressCopyWith<$Res> {
  factory $AchievementProgressCopyWith(
          AchievementProgress value, $Res Function(AchievementProgress) _then) =
      _$AchievementProgressCopyWithImpl;
  @useResult
  $Res call(
      {String achievementId,
      int currentValue,
      @JsonKey(name: 'last_updated') DateTime lastUpdated});
}

/// @nodoc
class _$AchievementProgressCopyWithImpl<$Res>
    implements $AchievementProgressCopyWith<$Res> {
  _$AchievementProgressCopyWithImpl(this._self, this._then);

  final AchievementProgress _self;
  final $Res Function(AchievementProgress) _then;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? currentValue = null,
    Object? lastUpdated = null,
  }) {
    return _then(_self.copyWith(
      achievementId: null == achievementId
          ? _self.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _self.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AchievementProgress implements AchievementProgress {
  const _AchievementProgress(
      {required this.achievementId,
      required this.currentValue,
      @JsonKey(name: 'last_updated') required this.lastUpdated});
  factory _AchievementProgress.fromJson(Map<String, dynamic> json) =>
      _$AchievementProgressFromJson(json);

  @override
  final String achievementId;
  @override
  final int currentValue;
  @override
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdated;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AchievementProgressCopyWith<_AchievementProgress> get copyWith =>
      __$AchievementProgressCopyWithImpl<_AchievementProgress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AchievementProgressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AchievementProgress &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, achievementId, currentValue, lastUpdated);

  @override
  String toString() {
    return 'AchievementProgress(achievementId: $achievementId, currentValue: $currentValue, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$AchievementProgressCopyWith<$Res>
    implements $AchievementProgressCopyWith<$Res> {
  factory _$AchievementProgressCopyWith(_AchievementProgress value,
          $Res Function(_AchievementProgress) _then) =
      __$AchievementProgressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String achievementId,
      int currentValue,
      @JsonKey(name: 'last_updated') DateTime lastUpdated});
}

/// @nodoc
class __$AchievementProgressCopyWithImpl<$Res>
    implements _$AchievementProgressCopyWith<$Res> {
  __$AchievementProgressCopyWithImpl(this._self, this._then);

  final _AchievementProgress _self;
  final $Res Function(_AchievementProgress) _then;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? achievementId = null,
    Object? currentValue = null,
    Object? lastUpdated = null,
  }) {
    return _then(_AchievementProgress(
      achievementId: null == achievementId
          ? _self.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _self.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
