import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:vo2rpg/data/models/social_post.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';
import 'package:vo2rpg/domain/providers/workout_provider.dart';
import 'package:vo2rpg/domain/providers/social_provider.dart';

class SocialFeedScreen extends ConsumerWidget {
  const SocialFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(socialPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Feed'),
      ),
      body: postsAsync.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => _WorkoutPostCard(
            post: posts[index],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class _WorkoutPostCard extends ConsumerWidget {
  const _WorkoutPostCard({
    required this.post,
  });

  final SocialPost post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutAsync = ref.watch(workoutProvider(post.workoutId));
    final socialService = ref.watch(socialServiceProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.userAvatarUrl),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.userName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        timeago.format(post.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    switch (value) {
                      case 'report':
                        final shouldReport = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Report Post'),
                            content: const Text(
                                'Are you sure you want to report this post?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Report'),
                              ),
                            ],
                          ),
                        );

                        if (shouldReport == true && context.mounted) {
                          try {
                            await socialService.reportPost(post.id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Post reported successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Failed to report post: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                        break;
                      case 'delete':
                        final shouldDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Post'),
                            content: const Text(
                                'Are you sure you want to delete this post? This action cannot be undone.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (shouldDelete == true && context.mounted) {
                          try {
                            await socialService.deletePost(post.id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Post deleted successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Failed to delete post: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                        break;
                    }
                  },
                  itemBuilder: (context) {
                    final isOwner = currentUser?.id == post.userId;

                    return [
                      if (!isOwner)
                        const PopupMenuItem(
                          value: 'report',
                          child: Text('Report'),
                        ),
                      if (isOwner)
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                    ];
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            workoutAsync.when(
              data: (workout) {
                if (workout == null) {
                  return const Text('Workout not found');
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Workout Details',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _WorkoutStat(
                          icon: Icons.timer,
                          value: workout.actualDuration != null
                              ? '${(workout.actualDuration! / 60).round()} min'
                              : '--',
                          label: 'Duration',
                        ),
                        _WorkoutStat(
                          icon: Icons.directions_run,
                          value: workout.actualDistance != null
                              ? '${(workout.actualDistance! / 1000).toStringAsFixed(2)} km'
                              : '--',
                          label: 'Distance',
                        ),
                        _WorkoutStat(
                          icon: Icons.speed,
                          value: (workout.actualDistance != null &&
                                  workout.actualDuration != null)
                              ? '${(workout.actualDuration! / 60 / (workout.actualDistance! / 1000)).toStringAsFixed(2)} min/km'
                              : '--',
                          label: 'Pace',
                        ),
                      ],
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
            ),
            if (post.caption != null) ...[
              const SizedBox(height: 16),
              Text(post.caption!),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        post.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: post.isLiked ? Colors.red : null,
                      ),
                      onPressed: () async {
                        if (currentUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('You must be logged in to like posts'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        try {
                          if (post.isLiked) {
                            await socialService.unlikePost(post.id);
                          } else {
                            await socialService.likePost(post.id);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Failed to ${post.isLiked ? 'unlike' : 'like'} post: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    ),
                    Text('${post.likes} likes'),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        minChildSize: 0.5,
                        maxChildSize: 0.9,
                        builder: (context, scrollController) => _CommentsSheet(
                          post: post,
                          scrollController: scrollController,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentsSheet extends ConsumerStatefulWidget {
  const _CommentsSheet({
    required this.post,
    required this.scrollController,
  });

  final SocialPost post;
  final ScrollController scrollController;

  @override
  ConsumerState<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends ConsumerState<_CommentsSheet> {
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentsAsync = ref.watch(postCommentsProvider(widget.post.id));
    final socialService = ref.watch(socialServiceProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: commentsAsync.when(
              data: (comments) => ListView.builder(
                controller: widget.scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(comment.userAvatarUrl),
                    ),
                    title: Text(comment.userName),
                    subtitle: Text(comment.content),
                    trailing: Text(
                      timeago.format(comment.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
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
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final content = _commentController.text.trim();
                      if (content.isEmpty) return;

                      if (currentUser == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You must be logged in to comment'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      try {
                        await socialService.commentOnPost(
                          postId: widget.post.id,
                          content: content,
                        );
                        _commentController.clear();
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to post comment: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
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
}

class _WorkoutStat extends StatelessWidget {
  const _WorkoutStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
