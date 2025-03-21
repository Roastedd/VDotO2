import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/domain/providers/training_plan_provider.dart';
import 'package:vo2rpg/domain/services/adaptive_training_service.dart';
import 'package:vo2rpg/presentation/features/workout/workout_execution_screen.dart';

/// Training plan screen showing details of a specific training plan
class TrainingPlanScreen extends ConsumerWidget {
  final String planId;

  const TrainingPlanScreen({
    super.key,
    required this.planId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(trainingPlanProvider(planId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Plan'),
      ),
      body: planAsync.when(
        data: (plan) => _TrainingPlanView(plan: plan),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: planAsync.valueOrNull != null
          ? FloatingActionButton.extended(
              onPressed: () =>
                  _analyzeAndAdjust(context, ref, planAsync.valueOrNull!),
              icon: const Icon(Icons.auto_graph),
              label: const Text('Analyze Performance'),
            )
          : null,
    );
  }

  Future<void> _analyzeAndAdjust(
      BuildContext context, WidgetRef ref, TrainingPlan plan) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Analyzing your workout performance...'),
          ],
        ),
      ),
    );

    try {
      // Get adaptive training service and adjust the plan
      final service = ref.read(adaptiveTrainingServiceProvider);
      final updatedPlan = await service.adjustTrainingPlan(plan);

      // Close loading dialog
      if (context.mounted) Navigator.of(context).pop();

      // Refresh the training plan data
      ref.invalidate(trainingPlanProvider(planId));

      // Show success message with VDOT adjustment if applicable
      if (context.mounted) {
        final vdotChange = updatedPlan.currentVdot - plan.currentVdot;
        if (vdotChange != 0) {
          final changeText = vdotChange > 0
              ? '+${vdotChange.toStringAsFixed(1)}'
              : vdotChange.toStringAsFixed(1);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Your VDOT has been updated to ${updatedPlan.currentVdot.toStringAsFixed(1)} ($changeText)',
              ),
              backgroundColor: vdotChange > 0 ? Colors.green : Colors.orange,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No adjustment needed at this time.'),
            ),
          );
        }
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) Navigator.of(context).pop();

      // Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adjusting training plan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

/// Main view for the training plan
class _TrainingPlanView extends StatelessWidget {
  final TrainingPlan plan;

  const _TrainingPlanView({required this.plan});

  @override
  Widget build(BuildContext context) {
    final progress = plan.currentWeek / _getTotalWeeks(plan.planType);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Plan details
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getPlanTitle(plan.planType),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Week ${plan.currentWeek} of ${_getTotalWeeks(plan.planType)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(value: progress),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // VDOT Information
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.speed, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Current VDOT',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    plan.currentVdot.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Complete your workouts to adapt your training plan',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Weekly workouts
          _WeeklyWorkouts(workouts: plan.workouts),
        ],
      ),
    );
  }

  String _getPlanTitle(PlanType type) {
    return switch (type) {
      PlanType.base => 'Base Training Plan',
      PlanType.fiveK => '5K Training Plan',
      PlanType.tenK => '10K Training Plan',
      PlanType.halfMarathon => 'Half Marathon Plan',
      PlanType.marathon => 'Marathon Plan',
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

/// Widget showing weekly workouts
class _WeeklyWorkouts extends StatelessWidget {
  final List<Workout> workouts;

  const _WeeklyWorkouts({required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Workouts', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        ...workouts.map(
          (workout) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _WorkoutCard(workout: workout),
          ),
        ),
      ],
    );
  }
}

/// Card showing a single workout
class _WorkoutCard extends StatelessWidget {
  final Workout workout;

  const _WorkoutCard({required this.workout});

  @override
  Widget build(BuildContext context) {
    // Determine icon and color based on workout type
    IconData icon;
    Color color;

    switch (workout.workoutType) {
      case WorkoutType.interval:
        icon = Icons.timer;
        color = Colors.red;
        break;
      case WorkoutType.threshold:
        icon = Icons.trending_up;
        color = Colors.orange;
        break;
      case WorkoutType.easy:
        icon = Icons.directions_walk;
        color = Colors.green;
        break;
      case WorkoutType.longRun:
        icon = Icons.directions_run;
        color = Colors.blue;
        break;
      case WorkoutType.rest:
        icon = Icons.hotel;
        color = Colors.purple;
        break;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withAlpha(51),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getDayName(workout.scheduledDate),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${workout.workoutType.name}: ${workout.notes ?? ''}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            if (workout.status == WorkoutStatus.completed)
              const Icon(Icons.check_circle, color: Colors.green)
            else
              IconButton(
                icon: const Icon(Icons.play_circle_fill),
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WorkoutExecutionScreen(
                        workout: workout,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  String _getDayName(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final workoutDate = DateTime(date.year, date.month, date.day);

    if (workoutDate == today) {
      return 'Today';
    } else if (workoutDate == today.add(const Duration(days: 1))) {
      return 'Tomorrow';
    } else {
      return switch (date.weekday) {
        DateTime.monday => 'Monday',
        DateTime.tuesday => 'Tuesday',
        DateTime.wednesday => 'Wednesday',
        DateTime.thursday => 'Thursday',
        DateTime.friday => 'Friday',
        DateTime.saturday => 'Saturday',
        DateTime.sunday => 'Sunday',
        _ => '',
      };
    }
  }
}
