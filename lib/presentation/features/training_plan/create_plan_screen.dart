import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vo2rpg/data/models/training_plan.dart';
import 'package:vo2rpg/domain/providers/training_plan_provider.dart';
import 'package:vo2rpg/domain/providers/profile_provider.dart';

/// Screen for creating a new training plan
class CreatePlanScreen extends HookConsumerWidget {
  const CreatePlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlanType = useState<PlanType>(PlanType.base);
    final startDate = useState<DateTime>(DateTime.now());
    final raceDate = useState<DateTime?>(null);
    final targetDistance = useState<double?>(null);
    final isLoading = useState(false);

    // Get current VDOT from profile
    final profileAsync = ref.watch(userProfileProvider);
    final currentVdot = profileAsync.valueOrNull?.currentVdot ?? 0.0;

    // Handle plan creation
    Future<void> createPlan() async {
      if (isLoading.value) return;

      isLoading.value = true;
      try {
        final plan =
            await ref.read(trainingPlanNotifierProvider.notifier).createPlan(
                  userId: ref.read(userProfileProvider).value?.id ?? '',
                  type: selectedPlanType.value,
                  currentVdot: currentVdot,
                  startDate: startDate.value,
                  raceDate: raceDate.value,
                  targetRaceDistance: targetDistance.value,
                );

        if (context.mounted) {
          context.go('/training-plan/${plan.id}');
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error creating plan: ${e.toString()}')),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Training Plan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Plan type selection
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan Type',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  SegmentedButton<PlanType>(
                    segments: const [
                      ButtonSegment(
                        value: PlanType.base,
                        label: Text('Base'),
                      ),
                      ButtonSegment(
                        value: PlanType.fiveK,
                        label: Text('5K'),
                      ),
                      ButtonSegment(
                        value: PlanType.tenK,
                        label: Text('10K'),
                      ),
                    ],
                    selected: {selectedPlanType.value},
                    onSelectionChanged: (Set<PlanType> selected) {
                      selectedPlanType.value = selected.first;
                    },
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<PlanType>(
                    segments: const [
                      ButtonSegment(
                        value: PlanType.halfMarathon,
                        label: Text('Half'),
                      ),
                      ButtonSegment(
                        value: PlanType.marathon,
                        label: Text('Marathon'),
                      ),
                    ],
                    selected: {selectedPlanType.value},
                    onSelectionChanged: (Set<PlanType> selected) {
                      selectedPlanType.value = selected.first;
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Start date selection
          Card(
            child: ListTile(
              title: const Text('Start Date'),
              subtitle: Text(
                '${startDate.value.day}/${startDate.value.month}/${startDate.value.year}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: startDate.value,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) {
                  startDate.value = picked;
                }
              },
            ),
          ),

          const SizedBox(height: 16),

          // Race details (optional)
          if (selectedPlanType.value != PlanType.base) ...[
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Race Date (Optional)'),
                    subtitle: raceDate.value != null
                        ? Text(
                            '${raceDate.value!.day}/${raceDate.value!.month}/${raceDate.value!.year}',
                          )
                        : const Text('Not set'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: raceDate.value ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (picked != null) {
                        raceDate.value = picked;
                      }
                    },
                  ),
                  if (selectedPlanType.value != PlanType.fiveK &&
                      selectedPlanType.value != PlanType.tenK)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Target Race Distance (km)',
                          hintText: 'Enter distance in kilometers',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          targetDistance.value =
                              double.tryParse(value)?.clamp(0, 100);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 32),

          // Create plan button
          FilledButton(
            onPressed: isLoading.value ? null : createPlan,
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
            ),
            child: isLoading.value
                ? const CircularProgressIndicator()
                : const Text(
                    'Create Plan',
                    style: TextStyle(fontSize: 18),
                  ),
          ),
        ],
      ),
    );
  }
}
