import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/domain/providers/profile_provider.dart';
import 'package:vo2rpg/domain/providers/training_plan_provider.dart';
import 'package:vo2rpg/presentation/common_widgets/index.dart';

/// Home screen of the app
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);
    final plansAsync = ref.watch(userTrainingPlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('VO2RPG'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.push('/profile');
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
                // Welcome message
                Text(
                  'Welcome, ${profile.displayName ?? 'Runner'}!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 24),

                // VDOT card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your VDOT',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              profile.currentVdot?.toStringAsFixed(1) ??
                                  'Not set',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
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

                // Training plans section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Training Plans',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        context.push('/create-plan');
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('New Plan'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Training plans list
                plansAsync.when(
                  data: (plans) {
                    if (plans.isEmpty) {
                      return const EmptyState(
                        message:
                            'You don\'t have any active training plans yet.',
                        icon: Icons.directions_run,
                        actionLabel: 'Create Plan',
                      );
                    }

                    return Column(
                      children: plans
                          .map((plan) => _TrainingPlanCard(plan: plan))
                          .toList(),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => ErrorDisplay(
                    message: error.toString(),
                    onRetry: () => ref.refresh(userTrainingPlansProvider),
                  ),
                ),

                const SizedBox(height: 32),

                // Quick actions
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 16),

                // Quick action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _QuickActionButton(
                      icon: Icons.calculate,
                      label: 'VDOT',
                      onPressed: () {
                        context.push('/vdot-calculator');
                      },
                    ),
                    _QuickActionButton(
                      icon: Icons.add_chart,
                      label: 'New Plan',
                      onPressed: () {
                        context.push('/create-plan');
                      },
                    ),
                    _QuickActionButton(
                      icon: Icons.history,
                      label: 'History',
                      onPressed: () {
                        // Navigate to history screen
                      },
                    ),
                    _QuickActionButton(
                      icon: Icons.settings,
                      label: 'Settings',
                      onPressed: () {
                        context.push('/settings');
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: ErrorDisplay(
            message: error.toString(),
            onRetry: () => ref.refresh(userProfileProvider),
          ),
        ),
      ),
    );
  }
}

/// Training plan card widget
class _TrainingPlanCard extends StatelessWidget {
  final TrainingPlan plan;

  const _TrainingPlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final progress = plan.currentWeek / _getTotalWeeks(plan.planType);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/training-plan/${plan.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getPlanIcon(plan.planType),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getPlanTitle(plan.planType),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text(
                    'Week ${plan.currentWeek}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 8),
              Text(
                '${(progress * 100).round()}% Complete',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPlanTitle(PlanType type) {
    return switch (type) {
      PlanType.base => 'Base Training',
      PlanType.fiveK => '5K Training',
      PlanType.tenK => '10K Training',
      PlanType.halfMarathon => 'Half Marathon',
      PlanType.marathon => 'Marathon',
    };
  }

  IconData _getPlanIcon(PlanType type) {
    return switch (type) {
      PlanType.base => Icons.fitness_center,
      PlanType.fiveK => Icons.directions_run,
      PlanType.tenK => Icons.directions_run,
      PlanType.halfMarathon => Icons.timer,
      PlanType.marathon => Icons.flag,
    };
  }

  int _getTotalWeeks(PlanType type) {
    return switch (type) {
      PlanType.base => 8,
      PlanType.fiveK => 12,
      PlanType.tenK => 12,
      PlanType.halfMarathon => 12,
      PlanType.marathon => 18,
    };
  }
}

/// Quick action button widget
class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
