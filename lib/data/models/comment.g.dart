// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userAvatarUrl: json['user_avatar_url'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_avatar_url': instance.userAvatarUrl,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
    };
