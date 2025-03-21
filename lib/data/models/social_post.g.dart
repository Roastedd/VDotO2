// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialPost _$SocialPostFromJson(Map<String, dynamic> json) => _SocialPost(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userAvatarUrl: json['user_avatar_url'] as String,
      workoutId: json['workout_id'] as String,
      caption: json['caption'] as String?,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      isReported: json['is_reported'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$SocialPostToJson(_SocialPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_avatar_url': instance.userAvatarUrl,
      'workout_id': instance.workoutId,
      'caption': instance.caption,
      'likes': instance.likes,
      'is_liked': instance.isLiked,
      'is_reported': instance.isReported,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
    };
