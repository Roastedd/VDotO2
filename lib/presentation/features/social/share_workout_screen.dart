import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/domain/services/social_service.dart';
import 'package:vo2rpg/domain/providers/auth_provider.dart';

/// Screen for sharing a workout to the social feed
class ShareWorkoutScreen extends HookConsumerWidget {
  final Workout workout;

  const ShareWorkoutScreen({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captionController = useTextEditingController();
    final isPublic = useState(true);
    final isSharing = useState(false);
    final currentUser = ref.watch(currentUserProvider);

    // If not logged in, show error
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please sign in to share workouts'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Workout'),
        actions: [
          TextButton(
            onPressed: isSharing.value
                ? null
                : () async {
                    isSharing.value = true;
                    try {
                      final socialService =
                          ref.read(socialServiceProvider.notifier);
                      socialService.shareWorkout(
                        userId: currentUser.id,
                        workout: workout,
                        caption: captionController.text.trim(),
                      );
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error sharing workout: $e'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    } finally {
                      isSharing.value = false;
                    }
                  },
            child: isSharing.value
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Share'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Workout preview card
          Card(
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
                      Duration(seconds: workout.actualDuration ?? 0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _WorkoutSummaryRow(
                    icon: Icons.directions_run,
                    label: 'Distance',
                    value:
                        '${((workout.actualDistance ?? 0) / 1000).toStringAsFixed(2)} km',
                  ),
                  const SizedBox(height: 8),
                  _WorkoutSummaryRow(
                    icon: Icons.speed,
                    label: 'Average Pace',
                    value: _formatPace(
                      (workout.actualDistance ?? 0) / 1000,
                      Duration(seconds: workout.actualDuration ?? 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Caption input
          TextField(
            controller: captionController,
            decoration: const InputDecoration(
              hintText: 'Write a caption...',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            maxLength: 500,
          ),
          const SizedBox(height: 16),

          // Privacy settings
          SwitchListTile(
            title: const Text('Public'),
            subtitle: const Text(
              'When disabled, only your followers can see this workout',
            ),
            value: isPublic.value,
            onChanged: (value) => isPublic.value = value,
          ),

          // Share preview
          const SizedBox(height: 32),
          Text(
            'Preview',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(currentUser.fullName ?? 'Anonymous User'),
                  subtitle: const Text('Just now'),
                ),
                if (captionController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(captionController.text),
                  ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _WorkoutSummaryRow(
                            icon: Icons.timer,
                            label: 'Duration',
                            value: _formatDuration(
                              Duration(seconds: workout.actualDuration ?? 0),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _WorkoutSummaryRow(
                            icon: Icons.directions_run,
                            label: 'Distance',
                            value:
                                '${((workout.actualDistance ?? 0) / 1000).toStringAsFixed(2)} km',
                          ),
                          const SizedBox(height: 8),
                          _WorkoutSummaryRow(
                            icon: Icons.speed,
                            label: 'Average Pace',
                            value: _formatPace(
                              (workout.actualDistance ?? 0) / 1000,
                              Duration(seconds: workout.actualDuration ?? 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
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
