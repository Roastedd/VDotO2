// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
      id: json['id'] as String,
      displayName: json['display_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      bio: json['bio'] as String?,
      totalDistance: (json['total_distance'] as num?)?.toInt() ?? 0,
      totalWorkouts: (json['total_workouts'] as num?)?.toInt() ?? 0,
      currentVdot: (json['current_vdot'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'total_distance': instance.totalDistance,
      'total_workouts': instance.totalWorkouts,
      'current_vdot': instance.currentVdot,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_UserConnection _$UserConnectionFromJson(Map<String, dynamic> json) =>
    _UserConnection(
      id: json['id'] as String,
      followerId: json['follower_id'] as String,
      followingId: json['following_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserConnectionToJson(_UserConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'follower_id': instance.followerId,
      'following_id': instance.followingId,
      'created_at': instance.createdAt.toIso8601String(),
    };

_WorkoutPost _$WorkoutPostFromJson(Map<String, dynamic> json) => _WorkoutPost(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      workoutId: json['workout_id'] as String,
      caption: json['caption'] as String?,
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
      commentCount: (json['comment_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      isReported: json['is_reported'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutPostToJson(_WorkoutPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'workout_id': instance.workoutId,
      'caption': instance.caption,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'is_liked': instance.isLiked,
      'is_reported': instance.isReported,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_WorkoutComment _$WorkoutCommentFromJson(Map<String, dynamic> json) =>
    _WorkoutComment(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutCommentToJson(_WorkoutComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
