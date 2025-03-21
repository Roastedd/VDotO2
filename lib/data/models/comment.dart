import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

/// Comment model for social posts
@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String postId,
    required String userId,
    required String userName,
    required String userAvatarUrl,
    required String content,
    required DateTime createdAt,
    @Default(false) @JsonKey(name: 'is_deleted') bool isDeleted,
  }) = _Comment;

  /// Creates a Comment from JSON
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
