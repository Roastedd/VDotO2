import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vo2rpg/data/models/workout.dart';
import 'package:vo2rpg/data/models/workout_metrics.dart' as workout_metrics;
import 'package:vo2rpg/domain/providers/workout_execution_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Screen for executing and tracking a workout
class WorkoutExecutionScreen extends HookConsumerWidget {
  final Workout workout;

  const WorkoutExecutionScreen({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutMetrics = ref.watch(workoutMetricsProvider);
    final controllerState = ref.watch(workoutExecutionControllerProvider);
    final isRunning = useState(false);

    // Start/stop workout
    void toggleWorkout() {
      if (isRunning.value) {
        ref.read(workoutExecutionControllerProvider.notifier).stopWorkout();
      } else {
        ref
            .read(workoutExecutionControllerProvider.notifier)
            .startWorkout(workout);
      }
      isRunning.value = !isRunning.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(workout.workoutType.name).animate().shimmer(
            duration: 1.5.seconds,
            color: Theme.of(context).colorScheme.primary.withAlpha(77)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              if (isRunning.value) {
                ref
                    .read(workoutExecutionControllerProvider.notifier)
                    .stopWorkout();
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Workout details card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target: ${workout.plannedDistance != null ? '${(workout.plannedDistance! / 1000).toStringAsFixed(1)}km' : 'No distance set'}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (workout.notes != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        workout.notes!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
            ).animate().fadeIn().slideY(begin: -0.2, end: 0),

            // Live metrics
            Expanded(
              child: workoutMetrics.when(
                data: (metrics) => _WorkoutMetrics(
                    metrics: metrics,
                    isRunning: isRunning.value),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Text('Error: $error'),
                ),
              ),
            ),

            // Start/Stop button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: controllerState.isLoading ? null : toggleWorkout,
                  child: Text(
                    isRunning.value ? 'Stop Workout' : 'Start Workout',
                    style: const TextStyle(fontSize: 18),
                  ),
                )
                    .animate(target: isRunning.value ? 1 : 0)
                    .scaleXY(end: 1.05, duration: 0.3.seconds)
                    .then()
                    .scaleXY(end: 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget displaying live workout metrics
class _WorkoutMetrics extends StatelessWidget {
  final workout_metrics.WorkoutMetrics metrics;
  final bool isRunning;

  const _WorkoutMetrics({required this.metrics, required this.isRunning});

  String _formatDuration(Duration? duration) {
    if (duration == null) return '--:--:--';
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String _formatPace(double? pace) {
    if (pace == null || pace == 0) return '--:--';
    final minutes = (pace / 60).floor();
    final seconds = (pace % 60).floor();
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String _formatDistance(double? distance) {
    if (distance == null) return '0.00';
    return (distance / 1000).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _MetricCard(
          title: 'Time',
          value: _formatDuration(metrics.duration),
          unit: '',
          icon: Icons.timer,
          color: Colors.blue,
          isRunning: isRunning,
        ),
        _MetricCard(
          title: 'Distance',
          value: _formatDistance(metrics.distance),
          unit: 'km',
          icon: Icons.straighten,
          color: Colors.green,
          isRunning: isRunning,
        ),
        _MetricCard(
          title: 'Current Pace',
          value: _formatPace(metrics.currentPace),
          unit: '/km',
          icon: Icons.speed,
          color: Colors.orange,
          isRunning: isRunning,
        ),
        _MetricCard(
          title: 'Heart Rate',
          value: metrics.heartRate?.toString() ?? '--',
          unit: 'bpm',
          icon: Icons.favorite,
          color: Colors.red,
          isRunning: isRunning,
        ),
        if (metrics.elevation != null)
          _MetricCard(
            title: 'Elevation',
            value: metrics.elevation!.toStringAsFixed(0),
            unit: 'm',
            icon: Icons.terrain,
            color: Colors.purple,
            isRunning: isRunning,
          ),
        if (metrics.averagePace != null)
          _MetricCard(
            title: 'Avg Pace',
            value: _formatPace(metrics.averagePace),
            unit: '/km',
            icon: Icons.av_timer,
            color: Colors.teal,
            isRunning: isRunning,
          ),
      ],
    );
  }
}

/// Card displaying a single metric
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;
  final bool isRunning;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            )
                .animate(
                  onPlay: (controller) =>
                      isRunning ? controller.repeat() : controller.stop(),
                )
                .scaleXY(
                  begin: 1,
                  end: 1.2,
                  duration: 1.seconds,
                )
                .then(duration: 1.seconds),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                )
                    .animate(target: isRunning ? 1 : 0)
                    .shimmer(duration: 1.seconds, color: color.withAlpha(77)),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Text(
                    unit,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn().scale();
  }
}
