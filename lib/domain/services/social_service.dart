import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:vo2rpg/data/models/social.dart';
import 'package:vo2rpg/data/models/workout.dart';

part 'social_service.g.dart';

/// Service for managing social features
@riverpod
class SocialService extends _$SocialService {
  final _uuid = const Uuid();
  final Map<String, UserProfile> _profiles = {};
  final Map<String, List<UserConnection>> _connections = {};
  final Map<String, WorkoutPost> _posts = {};
  final Map<String, List<WorkoutComment>> _comments = {};

  @override
  Stream<List<WorkoutPost>> build() async* {
    // Return all posts sorted by creation date
    yield _posts.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Get a user's profile
  UserProfile? getProfile(String userId) => _profiles[userId];

  /// Update a user's profile
  void updateProfile(UserProfile profile) {
    _profiles[profile.id] = profile;
  }

  /// Follow a user
  void followUser(String currentUserId, String targetUserId) {
    final connection = UserConnection(
      id: _uuid.v4(),
      followerId: currentUserId,
      followingId: targetUserId,
      createdAt: DateTime.now(),
    );
    _connections.putIfAbsent(currentUserId, () => []).add(connection);
  }

  /// Unfollow a user
  void unfollowUser(String currentUserId, String targetUserId) {
    final connections = _connections[currentUserId];
    if (connections != null) {
      connections.removeWhere((c) => c.followingId == targetUserId);
    }
  }

  /// Check if a user is following another user
  bool isFollowing(String currentUserId, String targetUserId) {
    final connections = _connections[currentUserId];
    if (connections == null) return false;
    return connections.any((c) => c.followingId == targetUserId);
  }

  /// Get users followed by a user
  List<String> getFollowing(String userId) {
    final connections = _connections[userId];
    if (connections == null) return [];
    return connections.map((c) => c.followingId).toList();
  }

  /// Get users following a user
  List<String> getFollowers(String userId) {
    final followers = <String>[];
    for (final entry in _connections.entries) {
      if (entry.value.any((c) => c.followingId == userId)) {
        followers.add(entry.key);
      }
    }
    return followers;
  }

  /// Share a workout
  WorkoutPost shareWorkout({
    required String userId,
    required Workout workout,
    String? caption,
  }) {
    final post = WorkoutPost(
      id: _uuid.v4(),
      userId: userId,
      workoutId: workout.id,
      caption: caption,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _posts[post.id] = post;
    state = AsyncValue.data(_posts.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    return post;
  }

  /// Like a workout post
  void likePost(String postId) {
    final post = _posts[postId];
    if (post != null) {
      _posts[postId] = post.copyWith(
        likeCount: post.likeCount + 1,
        isLiked: true,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Unlike a workout post
  void unlikePost(String postId) {
    final post = _posts[postId];
    if (post != null && post.isLiked) {
      _posts[postId] = post.copyWith(
        likeCount: post.likeCount - 1,
        isLiked: false,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }
  }

  /// Comment on a workout post
  WorkoutComment commentOnPost({
    required String postId,
    required String userId,
    required String content,
  }) {
    final comment = WorkoutComment(
      id: _uuid.v4(),
      postId: postId,
      userId: userId,
      content: content,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _comments.putIfAbsent(postId, () => []).add(comment);

    final post = _posts[postId];
    if (post != null) {
      _posts[postId] = post.copyWith(
        commentCount: post.commentCount + 1,
        updatedAt: DateTime.now(),
      );
      state = AsyncValue.data(_posts.values.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
    }

    return comment;
  }

  /// Get comments for a post
  List<WorkoutComment> getComments(String postId) {
    return _comments[postId] ?? [];
  }

  /// Get posts by a user
  List<WorkoutPost> getUserPosts(String userId) {
    return _posts.values.where((p) => p.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Get feed for a user (posts from followed users)
  List<WorkoutPost> getUserFeed(String userId) {
    final following = getFollowing(userId);
    return _posts.values.where((p) => following.contains(p.userId)).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Get suggested users for a user to follow
  List<UserProfile> getSuggestedUsers(String userId) {
    final following = getFollowing(userId);
    return _profiles.values
        .where((p) => p.id != userId && !following.contains(p.id))
        .toList()
      ..sort((a, b) => b.totalWorkouts.compareTo(a.totalWorkouts));
  }

  /// Get popular users based on follower count
  List<UserProfile> getPopularUsers() {
    final followerCounts = <String, int>{};
    for (final userId in _profiles.keys) {
      followerCounts[userId] = getFollowers(userId).length;
    }
    return _profiles.values.toList()
      ..sort((a, b) =>
          (followerCounts[b.id] ?? 0).compareTo(followerCounts[a.id] ?? 0));
  }

  /// Report a post for inappropriate content
  Future<void> reportPost(String postId) async {
    final post = _posts[postId];
    if (post != null) {
      // In a real app, this would send the report to a backend service
      // For now, we'll just mark it as reported
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

  /// Search for users by name
  List<UserProfile> searchUsers(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _profiles.values
        .where((profile) =>
            profile.displayName.toLowerCase().contains(lowercaseQuery) ||
            (profile.bio?.toLowerCase().contains(lowercaseQuery) ?? false))
        .toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));
  }
}
