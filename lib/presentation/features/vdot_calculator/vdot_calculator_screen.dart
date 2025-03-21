import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/vdot_provider.dart';

/// VDOT Calculator screen for calculating VDOT scores and training paces
class VdotCalculatorScreen extends ConsumerWidget {
  const VdotCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vdotNotifier = ref.read(vdotProvider.notifier);
    ref.watch(vdotProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('VDOT Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildVdotCalculator(context, vdotNotifier),
          ],
        ),
      ),
    );
  }

  Widget _buildVdotCalculator(BuildContext context, Vdot vdotNotifier) {
    final distanceController = TextEditingController();
    final hoursController = TextEditingController();
    final minutesController = TextEditingController();
    final secondsController = TextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: distanceController,
              decoration: const InputDecoration(
                labelText: 'Distance (meters)',
                hintText: 'Enter distance in meters (e.g. 5000 for 5K)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: hoursController,
                    decoration: const InputDecoration(labelText: 'Hours'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: minutesController,
                    decoration: const InputDecoration(labelText: 'Minutes'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: secondsController,
                    decoration: const InputDecoration(labelText: 'Seconds'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final distance = double.tryParse(distanceController.text);
                final hours = int.tryParse(hoursController.text) ?? 0;
                final minutes = int.tryParse(minutesController.text) ?? 0;
                final seconds = int.tryParse(secondsController.text) ?? 0;

                if (distance != null) {
                  final time = Duration(
                    hours: hours,
                    minutes: minutes,
                    seconds: seconds,
                  );
                  vdotNotifier.calculateVdot(distance: distance, time: time);
                }
              },
              child: const Text('Calculate VDOT'),
            ),
          ],
        ),
      ),
    );
  }
}
