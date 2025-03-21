import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vo2rpg/data/models/social.dart';
import 'package:vo2rpg/domain/services/social_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';
import 'package:vo2rpg/domain/providers/workout_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Screen for displaying the social feed
class SocialFeedScreen extends HookConsumerWidget {
  const SocialFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(socialServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Feed')
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(
              duration: 1.5.seconds,
              color: Theme.of(context).colorScheme.primary.withAlpha(77),
            ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              context.push('/find-friends');
            },
          ),
        ],
      ),
      body: posts.when(
        data: (postsList) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(socialServiceProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: postsList.length,
            itemBuilder: (context, index) {
              final post = postsList[index];
              return _WorkoutPostCard(
                post: post,
                index: index,
              ).animate().fadeIn(
                    duration: 400.ms,
                    delay: (index * 100).ms,
                  );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/share-workout');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Card displaying a shared workout post
class _WorkoutPostCard extends HookConsumerWidget {
  final WorkoutPost post;
  final int index;

  const _WorkoutPostCard({
    required this.post,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialService = ref.watch(socialServiceProvider.notifier);
    final userProfile = socialService.getProfile(post.userId);
    final comments = socialService.getComments(post.id);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: userProfile?.avatarUrl != null
                  ? CachedNetworkImageProvider(userProfile!.avatarUrl!)
                  : null,
              child: userProfile?.avatarUrl == null
                  ? Text(userProfile?.displayName.characters.first ?? '')
                  : null,
            ),
            title: Text(
              userProfile?.displayName ?? 'Unknown User',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              _formatTimestamp(post.createdAt),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.report),
                          title: const Text('Report Post'),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Report Post'),
                                content: const Text(
                                    'Are you sure you want to report this post?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      try {
                                        await ref
                                            .read(
                                                socialServiceProvider.notifier)
                                            .reportPost(post.id);
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Post reported successfully'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Failed to report post: $e'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text('Report'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        if (post.userId == ref.read(currentUserProvider)?.id)
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text('Delete Post'),
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Post'),
                                  content: const Text(
                                      'Are you sure you want to delete this post?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        try {
                                          await ref
                                              .read(socialServiceProvider
                                                  .notifier)
                                              .deletePost(post.id);
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Post deleted successfully'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Failed to delete post: $e'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Workout details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post.caption != null) ...[
                  Text(
                    post.caption!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                ],
                Consumer(
                  builder: (context, ref, child) {
                    final workout = ref.watch(workoutProvider(post.workoutId));
                    return workout.when(
                      data: (workout) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Workout Summary',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              _WorkoutSummaryRow(
                                icon: Icons.timer,
                                label: 'Duration',
                                value: _formatDuration(
                                  Duration(
                                      seconds: workout?.actualDuration ?? 0),
                                ),
                              ),
                              const SizedBox(height: 8),
                              _WorkoutSummaryRow(
                                icon: Icons.directions_run,
                                label: 'Distance',
                                value:
                                    '${((workout?.actualDistance ?? 0) / 1000).toStringAsFixed(2)} km',
                              ),
                              const SizedBox(height: 8),
                              _WorkoutSummaryRow(
                                icon: Icons.speed,
                                label: 'Average Pace',
                                value: _formatPace(
                                  (workout?.actualDistance ?? 0) / 1000,
                                  Duration(
                                      seconds: workout?.actualDuration ?? 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stack) => Center(
                        child: Text('Error loading workout: $error'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Action buttons
          Row(
            children: [
              IconButton(
                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  if (post.isLiked) {
                    socialService.unlikePost(post.id);
                  } else {
                    socialService.likePost(post.id);
                  }
                },
              ),
              Text(
                '${post.likeCount}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {
                  _showComments(context, post, comments);
                },
              ),
              Text(
                '${post.commentCount}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.share_outlined),
                onPressed: () async {
                  final workout =
                      await ref.read(workoutProvider(post.workoutId).future);
                  if (workout == null) return;

                  final distance = (workout.actualDistance ?? 0) / 1000;
                  final duration =
                      Duration(seconds: workout.actualDuration ?? 0);
                  final pace = _formatPace(distance, duration);

                  final shareText = '''Check out my workout on VO2RPG! 🏃‍♂️
Distance: ${distance.toStringAsFixed(2)} km
Duration: ${_formatDuration(duration)}
Pace: $pace
${post.caption ?? ''}''';

                  await Share.share(shareText);
                },
              ),
            ],
          ),

          // Preview comments
          if (comments.isNotEmpty) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < comments.length.clamp(0, 2); i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: socialService
                                      .getProfile(comments[i].userId)
                                      ?.displayName ??
                                  'Unknown User',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: ' '),
                            TextSpan(text: comments[i].content),
                          ],
                        ),
                      ),
                    ),
                  if (comments.length > 2)
                    TextButton(
                      onPressed: () {
                        _showComments(context, post, comments);
                      },
                      child: Text(
                        'View all ${comments.length} comments',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showComments(
    BuildContext context,
    WorkoutPost post,
    List<WorkoutComment> comments,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => _CommentsSheet(
          post: post,
          comments: comments,
          scrollController: scrollController,
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

/// Bottom sheet for displaying and adding comments
class _CommentsSheet extends HookConsumerWidget {
  final WorkoutPost post;
  final List<WorkoutComment> comments;
  final ScrollController scrollController;

  const _CommentsSheet({
    required this.post,
    required this.comments,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialService = ref.watch(socialServiceProvider.notifier);
    final commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                final userProfile = socialService.getProfile(comment.userId);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: userProfile?.avatarUrl != null
                        ? CachedNetworkImageProvider(userProfile!.avatarUrl!)
                        : null,
                    child: userProfile?.avatarUrl == null
                        ? Text(userProfile?.displayName.characters.first ?? '')
                        : null,
                  ),
                  title: Text(userProfile?.displayName ?? 'Unknown User'),
                  subtitle: Text(comment.content),
                  trailing: Text(
                    _formatTimestamp(comment.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final content = commentController.text.trim();
                      if (content.isNotEmpty) {
                        final currentUser = ref.read(currentUserProvider);
                        if (currentUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('You must be logged in to comment'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        socialService.commentOnPost(
                          postId: post.id,
                          userId: currentUser.id,
                          content: content,
                        );
                        commentController.clear();
                      }
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

class _WorkoutSummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WorkoutSummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

String _formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  if (hours > 0) {
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  } else {
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

String _formatPace(double distanceKm, Duration duration) {
  if (distanceKm <= 0) return '--:--';
  final paceSeconds = duration.inSeconds ~/ distanceKm;
  final minutes = paceSeconds ~/ 60;
  final seconds = paceSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}/km';
}
