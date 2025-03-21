import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vo2rpg/data/models/social_post.dart';
import 'package:vo2rpg/data/models/comment.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';
import 'package:vo2rpg/domain/providers/profile_provider.dart';

part 'social_provider.g.dart';

/// Provider for social posts
@riverpod
Stream<List<SocialPost>> socialPosts(Ref ref) {
  final socialService = ref.watch(socialServiceProvider.notifier);
  return socialService.watchPosts();
}

/// Provider for post comments
@riverpod
Stream<List<Comment>> postComments(Ref ref, String postId) {
  final socialService = ref.watch(socialServiceProvider.notifier);
  return socialService.watchComments(postId);
}

/// Provider for social service
@riverpod
class SocialService extends _$SocialService {
  final _uuid = const Uuid();

  @override
  Stream<List<SocialPost>> build() async* {
    // Return all posts sorted by creation date
    yield _posts.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  final Map<String, SocialPost> _posts = {};
  final Map<String, List<Comment>> _comments = {};

  /// Watch posts stream
  Stream<List<SocialPost>> watchPosts() async* {
    // In a real app, this would be a stream from a backend service
    yield _posts.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Watch comments stream for a post
  Stream<List<Comment>> watchComments(String postId) async* {
    // In a real app, this would be a stream from a backend service
    yield _comments[postId] ?? [];
  }

  /// Report a post
  Future<void> reportPost(String postId) async {
    // In a real app, this would send the report to a backend service
    // For now, we'll just mark it as reported
    final post = _posts[postId];
    if (post != null) {
      _posts[postId] = post.copyWith(
        isReported: true,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Delete a post
  Future<void> deletePost(String postId) async {
    if (_posts.containsKey(postId)) {
      _posts.remove(postId);
      _comments.remove(postId);
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Like a post
  Future<void> likePost(String postId) async {
    final post = _posts[postId];
    if (post != null) {
      _posts[postId] = post.copyWith(
        likes: post.likes + 1,
        isLiked: true,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Unlike a post
  Future<void> unlikePost(String postId) async {
    final post = _posts[postId];
    if (post != null && post.isLiked) {
      _posts[postId] = post.copyWith(
        likes: post.likes - 1,
        isLiked: false,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Comment on a post
  Future<void> commentOnPost({
    required String postId,
    required String content,
  }) async {
    final post = _posts[postId];
    final currentUser = ref.read(currentUserProvider);
    final userProfile = await ref.read(userProfileProvider.future);

    if (post != null && currentUser != null && userProfile != null) {
      final comment = Comment(
        id: _uuid.v4(),
        postId: postId,
        userId: currentUser.id,
        userName: userProfile.displayName ?? currentUser.email,
        userAvatarUrl: userProfile.profileImageUrl ?? '',
        content: content,
        createdAt: DateTime.now(),
      );
      _comments.putIfAbsent(postId, () => []).add(comment);
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }
}
