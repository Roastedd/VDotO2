import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/providers/profile_provider.dart';
import '../../../domain/providers/vdot_provider.dart';
import '../../common_widgets/index.dart';

/// Profile screen for viewing and editing user profile
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);
    final vdotScoresAsync = ref.watch(userVdotScoresProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              context.push('/settings');
            },
          ),
        ],
      ),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('Profile not found'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile header
                Center(
                  child: Column(
                    children: [
                      // Profile image
                      GestureDetector(
                        onTap: () {
                          // Show dialog to update profile image
                          _showUpdateProfileImageDialog(context, ref);
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(51),
                          backgroundImage:
                              profile.profileImageUrl != null
                                  ? NetworkImage(profile.profileImageUrl!)
                                  : null,
                          child:
                              profile.profileImageUrl == null
                                  ? Icon(
                                    Icons.person,
                                    size: 50,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                  : null,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Display name
                      Text(
                        profile.displayName ?? 'Runner',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      const SizedBox(height: 4),

                      // Email
                      Text(
                        profile.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(178),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Edit profile button
                      OutlinedButton.icon(
                        onPressed: () {
                          // Show dialog to edit profile
                          _showEditProfileDialog(context, ref, profile);
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Current VDOT score
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current VDOT',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Text(
                              profile.currentVdot?.toStringAsFixed(1) ??
                                  'Not set',
                              style: Theme.of(
                                context,
                              ).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),

                            const Spacer(),

                            TextButton(
                              onPressed: () {
                                // Navigate to VDOT calculator
                                context.push('/vdot-calculator');
                              },
                              child: const Text('Calculate'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // VDOT history
                Text(
                  'VDOT History',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 16),

                // VDOT scores list
                vdotScoresAsync.when(
                  data: (scores) {
                    if (scores.isEmpty) {
                      return const EmptyState(
                        message:
                            'No VDOT scores yet. Calculate your first VDOT score to track your progress.',
                        icon: Icons.timeline,
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: scores.length,
                      itemBuilder: (context, index) {
                        final score = scores[index];
                        return ListTile(
                          title: Text(
                            'VDOT: ${score.score.toStringAsFixed(1)}',
                          ),
                          subtitle: Text(
                            'Race: ${_formatDistance(score.raceDistance)} - ${_formatTime(score.raceTime)}',
                          ),
                          trailing: Text(
                            _formatDate(score.assessmentDate),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error:
                      (error, stackTrace) => ErrorDisplay(
                        message: error.toString(),
                        onRetry: () => ref.refresh(userVdotScoresProvider),
                      ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: ErrorDisplay(
                message: error.toString(),
                onRetry: () => ref.refresh(userProfileProvider),
              ),
            ),
      ),
    );
  }

  // Show dialog to edit profile
  void _showEditProfileDialog(BuildContext context, WidgetRef ref, profile) {
    final displayNameController = TextEditingController(
      text: profile.displayName,
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Edit Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: displayNameController,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                  textCapitalization: TextCapitalization.words,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await ref
                        .read(userProfileProvider.notifier)
                        .updateProfile(
                          displayName: displayNameController.text.trim(),
                        );

                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated')),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  // Show dialog to update profile image
  void _showUpdateProfileImageDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Update Profile Image'),
            content: const Text('This feature is not yet implemented.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  // Format distance in meters to a readable string
  String _formatDistance(double distanceMeters) {
    if (distanceMeters >= 1000) {
      return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
    } else {
      return '${distanceMeters.toStringAsFixed(0)} m';
    }
  }

  // Format time in seconds to a readable string
  String _formatTime(double timeSeconds) {
    final hours = (timeSeconds / 3600).floor();
    final minutes = ((timeSeconds % 3600) / 60).floor();
    final seconds = (timeSeconds % 60).round();

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
  }

  // Format date to a readable string
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
