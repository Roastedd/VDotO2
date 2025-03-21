// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  String get id;
  String get email;
  String? get displayName;
  String? get profileImageUrl;
  double? get currentVdot;
  @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
  DateTime? get updatedAt;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName,
      profileImageUrl, currentVdot, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, displayName: $displayName, profileImageUrl: $profileImageUrl, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String email,
      String? displayName,
      String? profileImageUrl,
      double? currentVdot,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? profileImageUrl = freezed,
    Object? currentVdot = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVdot: freezed == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Profile implements Profile {
  const _Profile(
      {required this.id,
      required this.email,
      this.displayName,
      this.profileImageUrl,
      this.currentVdot,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      this.createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      this.updatedAt,
      @JsonKey(name: 'is_deleted') this.isDeleted = false});
  factory _Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? profileImageUrl;
  @override
  final double? currentVdot;
  @override
  @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName,
      profileImageUrl, currentVdot, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, displayName: $displayName, profileImageUrl: $profileImageUrl, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? displayName,
      String? profileImageUrl,
      double? currentVdot,
      @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
      DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? profileImageUrl = freezed,
    Object? currentVdot = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_Profile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVdot: freezed == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
