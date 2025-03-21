import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_post.freezed.dart';
part 'social_post.g.dart';

/// Social post model
@freezed
abstract class SocialPost with _$SocialPost {
  const factory SocialPost({
    required String id,
    required String userId,
    required String userName,
    required String userAvatarUrl,
    required String workoutId,
    String? caption,
    @Default(0) int likes,
    @Default(false) bool isLiked,
    @Default(false) bool isReported,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) @JsonKey(name: 'is_deleted') bool isDeleted,
  }) = _SocialPost;

  /// Creates a SocialPost from JSON
  factory SocialPost.fromJson(Map<String, dynamic> json) =>
      _$SocialPostFromJson(json);
}
