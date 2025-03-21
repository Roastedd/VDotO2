// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialPost {
  String get id;
  String get userId;
  String get userName;
  String get userAvatarUrl;
  String get workoutId;
  String? get caption;
  int get likes;
  bool get isLiked;
  bool get isReported;
  DateTime get createdAt;
  DateTime get updatedAt;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;

  /// Create a copy of SocialPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialPostCopyWith<SocialPost> get copyWith =>
      _$SocialPostCopyWithImpl<SocialPost>(this as SocialPost, _$identity);

  /// Serializes this SocialPost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isReported, isReported) ||
                other.isReported == isReported) &&
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
      userId,
      userName,
      userAvatarUrl,
      workoutId,
      caption,
      likes,
      isLiked,
      isReported,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'SocialPost(id: $id, userId: $userId, userName: $userName, userAvatarUrl: $userAvatarUrl, workoutId: $workoutId, caption: $caption, likes: $likes, isLiked: $isLiked, isReported: $isReported, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $SocialPostCopyWith<$Res> {
  factory $SocialPostCopyWith(
          SocialPost value, $Res Function(SocialPost) _then) =
      _$SocialPostCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String userAvatarUrl,
      String workoutId,
      String? caption,
      int likes,
      bool isLiked,
      bool isReported,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class _$SocialPostCopyWithImpl<$Res> implements $SocialPostCopyWith<$Res> {
  _$SocialPostCopyWithImpl(this._self, this._then);

  final SocialPost _self;
  final $Res Function(SocialPost) _then;

  /// Create a copy of SocialPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = null,
    Object? workoutId = null,
    Object? caption = freezed,
    Object? likes = null,
    Object? isLiked = null,
    Object? isReported = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
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
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: null == userAvatarUrl
          ? _self.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isReported: null == isReported
          ? _self.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _SocialPost implements SocialPost {
  const _SocialPost(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.userAvatarUrl,
      required this.workoutId,
      this.caption,
      this.likes = 0,
      this.isLiked = false,
      this.isReported = false,
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(name: 'is_deleted') this.isDeleted = false});
  factory _SocialPost.fromJson(Map<String, dynamic> json) =>
      _$SocialPostFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userAvatarUrl;
  @override
  final String workoutId;
  @override
  final String? caption;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final bool isReported;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  /// Create a copy of SocialPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialPostCopyWith<_SocialPost> get copyWith =>
      __$SocialPostCopyWithImpl<_SocialPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialPostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isReported, isReported) ||
                other.isReported == isReported) &&
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
      userId,
      userName,
      userAvatarUrl,
      workoutId,
      caption,
      likes,
      isLiked,
      isReported,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'SocialPost(id: $id, userId: $userId, userName: $userName, userAvatarUrl: $userAvatarUrl, workoutId: $workoutId, caption: $caption, likes: $likes, isLiked: $isLiked, isReported: $isReported, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$SocialPostCopyWith<$Res>
    implements $SocialPostCopyWith<$Res> {
  factory _$SocialPostCopyWith(
          _SocialPost value, $Res Function(_SocialPost) _then) =
      __$SocialPostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String userAvatarUrl,
      String workoutId,
      String? caption,
      int likes,
      bool isLiked,
      bool isReported,
      DateTime createdAt,
      DateTime updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class __$SocialPostCopyWithImpl<$Res> implements _$SocialPostCopyWith<$Res> {
  __$SocialPostCopyWithImpl(this._self, this._then);

  final _SocialPost _self;
  final $Res Function(_SocialPost) _then;

  /// Create a copy of SocialPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = null,
    Object? workoutId = null,
    Object? caption = freezed,
    Object? likes = null,
    Object? isLiked = null,
    Object? isReported = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_SocialPost(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: null == userAvatarUrl
          ? _self.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isReported: null == isReported
          ? _self.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as bool,
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
