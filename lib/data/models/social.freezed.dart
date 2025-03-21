// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get displayName;
  @HiveField(2)
  String? get avatarUrl;
  @HiveField(3)
  String? get bio;
  @HiveField(4)
  @JsonKey(name: 'total_distance')
  int get totalDistance;
  @HiveField(5)
  @JsonKey(name: 'total_workouts')
  int get totalWorkouts;
  @HiveField(6)
  @JsonKey(name: 'current_vdot')
  double? get currentVdot;
  @HiveField(7)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(8)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, avatarUrl, bio,
      totalDistance, totalWorkouts, currentVdot, createdAt, updatedAt);

  @override
  String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, avatarUrl: $avatarUrl, bio: $bio, totalDistance: $totalDistance, totalWorkouts: $totalWorkouts, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) _then) =
      _$UserProfileCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String displayName,
      @HiveField(2) String? avatarUrl,
      @HiveField(3) String? bio,
      @HiveField(4) @JsonKey(name: 'total_distance') int totalDistance,
      @HiveField(5) @JsonKey(name: 'total_workouts') int totalWorkouts,
      @HiveField(6) @JsonKey(name: 'current_vdot') double? currentVdot,
      @HiveField(7) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(8) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? totalDistance = null,
    Object? totalWorkouts = null,
    Object? currentVdot = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDistance: null == totalDistance
          ? _self.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      currentVdot: freezed == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _UserProfile implements UserProfile {
  const _UserProfile(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.displayName,
      @HiveField(2) this.avatarUrl,
      @HiveField(3) this.bio,
      @HiveField(4) @JsonKey(name: 'total_distance') this.totalDistance = 0,
      @HiveField(5) @JsonKey(name: 'total_workouts') this.totalWorkouts = 0,
      @HiveField(6) @JsonKey(name: 'current_vdot') this.currentVdot,
      @HiveField(7) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(8) @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String displayName;
  @override
  @HiveField(2)
  final String? avatarUrl;
  @override
  @HiveField(3)
  final String? bio;
  @override
  @HiveField(4)
  @JsonKey(name: 'total_distance')
  final int totalDistance;
  @override
  @HiveField(5)
  @JsonKey(name: 'total_workouts')
  final int totalWorkouts;
  @override
  @HiveField(6)
  @JsonKey(name: 'current_vdot')
  final double? currentVdot;
  @override
  @HiveField(7)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(8)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.currentVdot, currentVdot) ||
                other.currentVdot == currentVdot) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, avatarUrl, bio,
      totalDistance, totalWorkouts, currentVdot, createdAt, updatedAt);

  @override
  String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, avatarUrl: $avatarUrl, bio: $bio, totalDistance: $totalDistance, totalWorkouts: $totalWorkouts, currentVdot: $currentVdot, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) _then) =
      __$UserProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String displayName,
      @HiveField(2) String? avatarUrl,
      @HiveField(3) String? bio,
      @HiveField(4) @JsonKey(name: 'total_distance') int totalDistance,
      @HiveField(5) @JsonKey(name: 'total_workouts') int totalWorkouts,
      @HiveField(6) @JsonKey(name: 'current_vdot') double? currentVdot,
      @HiveField(7) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(8) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
    Object? totalDistance = null,
    Object? totalWorkouts = null,
    Object? currentVdot = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_UserProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDistance: null == totalDistance
          ? _self.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkouts: null == totalWorkouts
          ? _self.totalWorkouts
          : totalWorkouts // ignore: cast_nullable_to_non_nullable
              as int,
      currentVdot: freezed == currentVdot
          ? _self.currentVdot
          : currentVdot // ignore: cast_nullable_to_non_nullable
              as double?,
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
mixin _$UserConnection {
  @HiveField(0)
  String get id;
  @HiveField(1)
  @JsonKey(name: 'follower_id')
  String get followerId;
  @HiveField(2)
  @JsonKey(name: 'following_id')
  String get followingId;
  @HiveField(3)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of UserConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserConnectionCopyWith<UserConnection> get copyWith =>
      _$UserConnectionCopyWithImpl<UserConnection>(
          this as UserConnection, _$identity);

  /// Serializes this UserConnection to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserConnection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.followerId, followerId) ||
                other.followerId == followerId) &&
            (identical(other.followingId, followingId) ||
                other.followingId == followingId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, followerId, followingId, createdAt);

  @override
  String toString() {
    return 'UserConnection(id: $id, followerId: $followerId, followingId: $followingId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserConnectionCopyWith<$Res> {
  factory $UserConnectionCopyWith(
          UserConnection value, $Res Function(UserConnection) _then) =
      _$UserConnectionCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'follower_id') String followerId,
      @HiveField(2) @JsonKey(name: 'following_id') String followingId,
      @HiveField(3) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$UserConnectionCopyWithImpl<$Res>
    implements $UserConnectionCopyWith<$Res> {
  _$UserConnectionCopyWithImpl(this._self, this._then);

  final UserConnection _self;
  final $Res Function(UserConnection) _then;

  /// Create a copy of UserConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? followerId = null,
    Object? followingId = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      followerId: null == followerId
          ? _self.followerId
          : followerId // ignore: cast_nullable_to_non_nullable
              as String,
      followingId: null == followingId
          ? _self.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserConnection implements UserConnection {
  const _UserConnection(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'follower_id') required this.followerId,
      @HiveField(2) @JsonKey(name: 'following_id') required this.followingId,
      @HiveField(3) @JsonKey(name: 'created_at') required this.createdAt});
  factory _UserConnection.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'follower_id')
  final String followerId;
  @override
  @HiveField(2)
  @JsonKey(name: 'following_id')
  final String followingId;
  @override
  @HiveField(3)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of UserConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserConnectionCopyWith<_UserConnection> get copyWith =>
      __$UserConnectionCopyWithImpl<_UserConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserConnectionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserConnection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.followerId, followerId) ||
                other.followerId == followerId) &&
            (identical(other.followingId, followingId) ||
                other.followingId == followingId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, followerId, followingId, createdAt);

  @override
  String toString() {
    return 'UserConnection(id: $id, followerId: $followerId, followingId: $followingId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserConnectionCopyWith<$Res>
    implements $UserConnectionCopyWith<$Res> {
  factory _$UserConnectionCopyWith(
          _UserConnection value, $Res Function(_UserConnection) _then) =
      __$UserConnectionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'follower_id') String followerId,
      @HiveField(2) @JsonKey(name: 'following_id') String followingId,
      @HiveField(3) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$UserConnectionCopyWithImpl<$Res>
    implements _$UserConnectionCopyWith<$Res> {
  __$UserConnectionCopyWithImpl(this._self, this._then);

  final _UserConnection _self;
  final $Res Function(_UserConnection) _then;

  /// Create a copy of UserConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? followerId = null,
    Object? followingId = null,
    Object? createdAt = null,
  }) {
    return _then(_UserConnection(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      followerId: null == followerId
          ? _self.followerId
          : followerId // ignore: cast_nullable_to_non_nullable
              as String,
      followingId: null == followingId
          ? _self.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$WorkoutPost {
  @HiveField(0)
  String get id;
  @HiveField(1)
  @JsonKey(name: 'user_id')
  String get userId;
  @HiveField(2)
  @JsonKey(name: 'workout_id')
  String get workoutId;
  @HiveField(3)
  String? get caption;
  @HiveField(4)
  @JsonKey(name: 'like_count')
  int get likeCount;
  @HiveField(5)
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @HiveField(6)
  bool get isLiked;
  @HiveField(7)
  bool get isReported;
  @HiveField(8)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(9)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of WorkoutPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutPostCopyWith<WorkoutPost> get copyWith =>
      _$WorkoutPostCopyWithImpl<WorkoutPost>(this as WorkoutPost, _$identity);

  /// Serializes this WorkoutPost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isReported, isReported) ||
                other.isReported == isReported) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, workoutId, caption,
      likeCount, commentCount, isLiked, isReported, createdAt, updatedAt);

  @override
  String toString() {
    return 'WorkoutPost(id: $id, userId: $userId, workoutId: $workoutId, caption: $caption, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked, isReported: $isReported, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $WorkoutPostCopyWith<$Res> {
  factory $WorkoutPostCopyWith(
          WorkoutPost value, $Res Function(WorkoutPost) _then) =
      _$WorkoutPostCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'workout_id') String workoutId,
      @HiveField(3) String? caption,
      @HiveField(4) @JsonKey(name: 'like_count') int likeCount,
      @HiveField(5) @JsonKey(name: 'comment_count') int commentCount,
      @HiveField(6) bool isLiked,
      @HiveField(7) bool isReported,
      @HiveField(8) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(9) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$WorkoutPostCopyWithImpl<$Res> implements $WorkoutPostCopyWith<$Res> {
  _$WorkoutPostCopyWithImpl(this._self, this._then);

  final WorkoutPost _self;
  final $Res Function(WorkoutPost) _then;

  /// Create a copy of WorkoutPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = null,
    Object? caption = freezed,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? isLiked = null,
    Object? isReported = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: null == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _self.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkoutPost implements WorkoutPost {
  const _WorkoutPost(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'user_id') required this.userId,
      @HiveField(2) @JsonKey(name: 'workout_id') required this.workoutId,
      @HiveField(3) this.caption,
      @HiveField(4) @JsonKey(name: 'like_count') this.likeCount = 0,
      @HiveField(5) @JsonKey(name: 'comment_count') this.commentCount = 0,
      @HiveField(6) this.isLiked = false,
      @HiveField(7) this.isReported = false,
      @HiveField(8) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(9) @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _WorkoutPost.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPostFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @HiveField(2)
  @JsonKey(name: 'workout_id')
  final String workoutId;
  @override
  @HiveField(3)
  final String? caption;
  @override
  @HiveField(4)
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @HiveField(5)
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  @JsonKey()
  @HiveField(6)
  final bool isLiked;
  @override
  @JsonKey()
  @HiveField(7)
  final bool isReported;
  @override
  @HiveField(8)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(9)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of WorkoutPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutPostCopyWith<_WorkoutPost> get copyWith =>
      __$WorkoutPostCopyWithImpl<_WorkoutPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkoutPostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isReported, isReported) ||
                other.isReported == isReported) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, workoutId, caption,
      likeCount, commentCount, isLiked, isReported, createdAt, updatedAt);

  @override
  String toString() {
    return 'WorkoutPost(id: $id, userId: $userId, workoutId: $workoutId, caption: $caption, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked, isReported: $isReported, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutPostCopyWith<$Res>
    implements $WorkoutPostCopyWith<$Res> {
  factory _$WorkoutPostCopyWith(
          _WorkoutPost value, $Res Function(_WorkoutPost) _then) =
      __$WorkoutPostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'workout_id') String workoutId,
      @HiveField(3) String? caption,
      @HiveField(4) @JsonKey(name: 'like_count') int likeCount,
      @HiveField(5) @JsonKey(name: 'comment_count') int commentCount,
      @HiveField(6) bool isLiked,
      @HiveField(7) bool isReported,
      @HiveField(8) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(9) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$WorkoutPostCopyWithImpl<$Res> implements _$WorkoutPostCopyWith<$Res> {
  __$WorkoutPostCopyWithImpl(this._self, this._then);

  final _WorkoutPost _self;
  final $Res Function(_WorkoutPost) _then;

  /// Create a copy of WorkoutPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = null,
    Object? caption = freezed,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? isLiked = null,
    Object? isReported = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_WorkoutPost(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      workoutId: null == workoutId
          ? _self.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as String,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: null == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _self.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
mixin _$WorkoutComment {
  @HiveField(0)
  String get id;
  @HiveField(1)
  @JsonKey(name: 'post_id')
  String get postId;
  @HiveField(2)
  @JsonKey(name: 'user_id')
  String get userId;
  @HiveField(3)
  String get content;
  @HiveField(4)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @HiveField(5)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of WorkoutComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkoutCommentCopyWith<WorkoutComment> get copyWith =>
      _$WorkoutCommentCopyWithImpl<WorkoutComment>(
          this as WorkoutComment, _$identity);

  /// Serializes this WorkoutComment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkoutComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, postId, userId, content, createdAt, updatedAt);

  @override
  String toString() {
    return 'WorkoutComment(id: $id, postId: $postId, userId: $userId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $WorkoutCommentCopyWith<$Res> {
  factory $WorkoutCommentCopyWith(
          WorkoutComment value, $Res Function(WorkoutComment) _then) =
      _$WorkoutCommentCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'post_id') String postId,
      @HiveField(2) @JsonKey(name: 'user_id') String userId,
      @HiveField(3) String content,
      @HiveField(4) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(5) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$WorkoutCommentCopyWithImpl<$Res>
    implements $WorkoutCommentCopyWith<$Res> {
  _$WorkoutCommentCopyWithImpl(this._self, this._then);

  final WorkoutComment _self;
  final $Res Function(WorkoutComment) _then;

  /// Create a copy of WorkoutComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
class _WorkoutComment implements WorkoutComment {
  const _WorkoutComment(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'post_id') required this.postId,
      @HiveField(2) @JsonKey(name: 'user_id') required this.userId,
      @HiveField(3) required this.content,
      @HiveField(4) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(5) @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _WorkoutComment.fromJson(Map<String, dynamic> json) =>
      _$WorkoutCommentFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'post_id')
  final String postId;
  @override
  @HiveField(2)
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @HiveField(3)
  final String content;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(5)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of WorkoutComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkoutCommentCopyWith<_WorkoutComment> get copyWith =>
      __$WorkoutCommentCopyWithImpl<_WorkoutComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkoutCommentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkoutComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, postId, userId, content, createdAt, updatedAt);

  @override
  String toString() {
    return 'WorkoutComment(id: $id, postId: $postId, userId: $userId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$WorkoutCommentCopyWith<$Res>
    implements $WorkoutCommentCopyWith<$Res> {
  factory _$WorkoutCommentCopyWith(
          _WorkoutComment value, $Res Function(_WorkoutComment) _then) =
      __$WorkoutCommentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'post_id') String postId,
      @HiveField(2) @JsonKey(name: 'user_id') String userId,
      @HiveField(3) String content,
      @HiveField(4) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(5) @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$WorkoutCommentCopyWithImpl<$Res>
    implements _$WorkoutCommentCopyWith<$Res> {
  __$WorkoutCommentCopyWithImpl(this._self, this._then);

  final _WorkoutComment _self;
  final $Res Function(_WorkoutComment) _then;

  /// Create a copy of WorkoutComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_WorkoutComment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format on
