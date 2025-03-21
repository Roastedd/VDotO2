import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'social.freezed.dart';
part 'social.g.dart';

/// User profile for social features
@freezed
@HiveType(typeId: 13)
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String id,
    @HiveField(1) required String displayName,
    @HiveField(2) String? avatarUrl,
    @HiveField(3) String? bio,
    @HiveField(4)
    @Default(0)
    @JsonKey(name: 'total_distance')
    int totalDistance,
    @HiveField(5)
    @Default(0)
    @JsonKey(name: 'total_workouts')
    int totalWorkouts,
    @HiveField(6) @JsonKey(name: 'current_vdot') double? currentVdot,
    @HiveField(7) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(8) @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// Social connection between users
@freezed
@HiveType(typeId: 14)
abstract class UserConnection with _$UserConnection {
  const factory UserConnection({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'follower_id') required String followerId,
    @HiveField(2) @JsonKey(name: 'following_id') required String followingId,
    @HiveField(3) @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserConnection;

  factory UserConnection.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionFromJson(json);
}

/// Shared workout post
@freezed
@HiveType(typeId: 15)
abstract class WorkoutPost with _$WorkoutPost {
  const factory WorkoutPost({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'user_id') required String userId,
    @HiveField(2) @JsonKey(name: 'workout_id') required String workoutId,
    @HiveField(3) String? caption,
    @HiveField(4) @JsonKey(name: 'like_count') @Default(0) int likeCount,
    @HiveField(5) @JsonKey(name: 'comment_count') @Default(0) int commentCount,
    @HiveField(6) @Default(false) bool isLiked,
    @HiveField(7) @Default(false) bool isReported,
    @HiveField(8) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(9) @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _WorkoutPost;

  factory WorkoutPost.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPostFromJson(json);
}

/// Comment on a workout post
@freezed
@HiveType(typeId: 16)
abstract class WorkoutComment with _$WorkoutComment {
  const factory WorkoutComment({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'post_id') required String postId,
    @HiveField(2) @JsonKey(name: 'user_id') required String userId,
    @HiveField(3) required String content,
    @HiveField(4) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(5) @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _WorkoutComment;

  factory WorkoutComment.fromJson(Map<String, dynamic> json) =>
      _$WorkoutCommentFromJson(json);
}
