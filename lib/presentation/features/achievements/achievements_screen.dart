import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vo2rpg/data/models/achievement.dart';
import 'package:vo2rpg/domain/services/achievement_service.dart';

/// Screen for displaying user achievements
class AchievementsScreen extends HookConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(achievementServiceProvider);

    return DefaultTabController(
      length: AchievementType.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Achievements')
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: 1.5.seconds,
                color: Theme.of(context).colorScheme.primary.withAlpha(77),
              ),
          bottom: TabBar(
            isScrollable: true,
            tabs: AchievementType.values.map((type) {
              return Tab(
                text: type.name.toUpperCase(),
                icon: _getAchievementTypeIcon(type),
              );
            }).toList(),
          ),
        ),
        body: achievements.when(
          data: (achievementsList) => TabBarView(
            children: AchievementType.values.map((type) {
              final typeAchievements = achievementsList
                  .where((a) => a.type == type)
                  .toList()
                ..sort((a, b) => a.requiredValue.compareTo(b.requiredValue));
              return _AchievementList(achievements: typeAchievements);
            }).toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }

  Icon _getAchievementTypeIcon(AchievementType type) {
    return switch (type) {
      AchievementType.distance => const Icon(Icons.straighten),
      AchievementType.streak => const Icon(Icons.calendar_today),
      AchievementType.speed => const Icon(Icons.speed),
      AchievementType.elevation => const Icon(Icons.terrain),
      AchievementType.workout => const Icon(Icons.fitness_center),
      AchievementType.vdot => const Icon(Icons.trending_up),
    };
  }
}

/// Widget for displaying a list of achievements
class _AchievementList extends StatelessWidget {
  final List<Achievement> achievements;

  const _AchievementList({required this.achievements});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return _AchievementCard(
          achievement: achievement,
          index: index,
        ).animate().fadeIn(
              duration: 400.ms,
              delay: (index * 100).ms,
            );
      },
    );
  }
}

/// Card displaying a single achievement
class _AchievementCard extends HookConsumerWidget {
  final Achievement achievement;
  final int index;

  const _AchievementCard({
    required this.achievement,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref
        .watch(achievementServiceProvider.notifier)
        .getProgress(achievement.id);
    final currentValue = progress?.currentValue ?? achievement.currentValue;
    final progressValue = currentValue / achievement.requiredValue.toDouble();

    return Card(
      child: InkWell(
        onTap: () => _showAchievementDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (achievement.iconName != null)
                    Icon(
                      _getAchievementIcon(achievement.iconName!),
                      color:
                          achievement.isCompleted ? Colors.amber : Colors.grey,
                      size: 24,
                    )
                        .animate(
                          onPlay: (controller) => achievement.isCompleted
                              ? controller.repeat()
                              : null,
                        )
                        .scale(
                          duration: 1.seconds,
                          begin: const Offset(1, 1),
                          end: const Offset(1.2, 1.2),
                        ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      achievement.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: achievement.isCompleted
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                    ),
                  ),
                  if (achievement.isCompleted)
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 24,
                    ).animate().scale(),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                achievement.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progressValue,
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withAlpha(26),
                valueColor: AlwaysStoppedAnimation<Color>(
                  achievement.isCompleted
                      ? Colors.green
                      : Theme.of(context).colorScheme.primary,
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    duration: 1.5.seconds,
                    color: Theme.of(context).colorScheme.primary.withAlpha(77),
                  ),
              const SizedBox(height: 4),
              Text(
                '$currentValue / ${achievement.requiredValue}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (achievement.completedAt != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Completed on ${_formatDate(achievement.completedAt!)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showAchievementDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(achievement.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(achievement.description),
            const SizedBox(height: 16),
            Text(
              'Progress: ${achievement.currentValue}/${achievement.requiredValue}',
            ),
            if (achievement.completedAt != null) ...[
              const SizedBox(height: 8),
              Text(
                'Completed on ${_formatDate(achievement.completedAt!)}',
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  IconData _getAchievementIcon(String iconName) {
    return switch (iconName) {
      String s when s.startsWith('distance_') => Icons.straighten,
      String s when s.startsWith('streak_') => Icons.calendar_today,
      String s when s.startsWith('speed_') => Icons.speed,
      String s when s.startsWith('vdot_') => Icons.trending_up,
      _ => Icons.emoji_events,
    };
  }
}
