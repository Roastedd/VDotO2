import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vo2rpg/data/models/social.dart';
import 'package:vo2rpg/domain/services/social_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

/// Screen for finding and following other users
class FindUsersScreen extends HookConsumerWidget {
  const FindUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();
    final isSearching = useState(false);
    final searchResults = useState<List<UserProfile>>([]);
    final currentUser = ref.watch(currentUserProvider);

    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please sign in to find users'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isSearching.value
              ? TextField(
                  key: const ValueKey('search_field'),
                  controller: searchController,
                  focusNode: searchFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Search users...',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        searchController.clear();
                        searchResults.value = [];
                        isSearching.value = false;
                      },
                    ),
                  ),
                  onSubmitted: (query) {
                    if (query.trim().isEmpty) {
                      searchResults.value = [];
                      return;
                    }
                    final socialService =
                        ref.read(socialServiceProvider.notifier);
                    searchResults.value =
                        socialService.searchUsers(query.trim());
                  },
                )
              : const Text(
                  'Find Users',
                  key: ValueKey('title'),
                ),
        ),
        actions: [
          if (!isSearching.value)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                isSearching.value = true;
                searchFocusNode.requestFocus();
              },
            ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (isSearching.value && searchResults.value.isNotEmpty)
            SliverList.builder(
              itemCount: searchResults.value.length,
              itemBuilder: (context, index) {
                final user = searchResults.value[index];
                return _UserListTile(
                  user: user,
                  currentUserId: currentUser.id,
                  onFollow: (userId) {
                    final socialService =
                        ref.read(socialServiceProvider.notifier);
                    socialService.followUser(currentUser.id, userId);
                  },
                );
              },
            )
          else ...[
            // Suggested users section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Suggested Users',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _SuggestedUsersList(
              currentUserId: currentUser.id,
              onFollow: (userId) {
                final socialService = ref.read(socialServiceProvider.notifier);
                socialService.followUser(currentUser.id, userId);
              },
            ),

            // Divider
            const SliverToBoxAdapter(
              child: Divider(height: 32),
            ),

            // Popular users section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Popular Users',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _PopularUsersList(
              currentUserId: currentUser.id,
              onFollow: (userId) {
                final socialService = ref.read(socialServiceProvider.notifier);
                socialService.followUser(currentUser.id, userId);
              },
            ),
          ],
        ],
      ),
    );
  }
}

/// List of suggested users to follow
class _SuggestedUsersList extends HookConsumerWidget {
  final String currentUserId;
  final void Function(String userId) onFollow;

  const _SuggestedUsersList({
    required this.currentUserId,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialService = ref.watch(socialServiceProvider.notifier);
    final suggestedUsers = socialService.getSuggestedUsers(currentUserId);

    return SliverList.builder(
      itemCount: suggestedUsers.length,
      itemBuilder: (context, index) {
        final user = suggestedUsers[index];
        return _UserListTile(
          user: user,
          currentUserId: currentUserId,
          onFollow: onFollow,
        );
      },
    );
  }
}

/// List of popular users to follow
class _PopularUsersList extends HookConsumerWidget {
  final String currentUserId;
  final void Function(String userId) onFollow;

  const _PopularUsersList({
    required this.currentUserId,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialService = ref.watch(socialServiceProvider.notifier);
    final popularUsers = socialService.getPopularUsers();

    return SliverList.builder(
      itemCount: popularUsers.length,
      itemBuilder: (context, index) {
        final user = popularUsers[index];
        return _UserListTile(
          user: user,
          currentUserId: currentUserId,
          onFollow: onFollow,
        );
      },
    );
  }
}

/// User list tile with follow button
class _UserListTile extends HookConsumerWidget {
  final UserProfile user;
  final String currentUserId;
  final void Function(String userId) onFollow;

  const _UserListTile({
    required this.user,
    required this.currentUserId,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialService = ref.watch(socialServiceProvider.notifier);
    final isFollowing = socialService.isFollowing(currentUserId, user.id);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: user.avatarUrl != null
            ? CachedNetworkImageProvider(user.avatarUrl!)
            : null,
        child: user.avatarUrl == null
            ? Text(user.displayName.characters.first)
            : null,
      ),
      title: Text(user.displayName),
      subtitle: Text(
        '${user.totalWorkouts} workouts · ${(user.totalDistance / 1000).toStringAsFixed(1)}km total',
      ),
      trailing: TextButton(
        onPressed: () => onFollow(user.id),
        child: Text(isFollowing ? 'Following' : 'Follow'),
      ),
      onTap: () {
        context.push('/profile/${user.id}');
      },
    );
  }
}
