import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/vdot_calculator.dart';
import '../../data/models/vdot_score.dart';
import 'auth_provider.dart';
import 'profile_provider.dart';

part 'vdot_provider.g.dart';

/// Provider for the user's VDOT scores
@riverpod
class UserVdotScores extends _$UserVdotScores {
  @override
  Future<List<VdotScore>> build() async {
    final user = ref.watch(currentUserProvider);

    if (user == null) return [];

    return _fetchVdotScores(user.id);
  }

  /// Fetches the user's VDOT scores from Supabase
  Future<List<VdotScore>> _fetchVdotScores(String userId) async {
    try {
      final response = await ref
          .read(supabaseClientProvider)
          .from('vdot_scores')
          .select()
          .eq('user_id', userId)
          .order('assessment_date', ascending: false);

      return response
          .map<VdotScore>((json) => VdotScore.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Adds a new VDOT score
  Future<void> addVdotScore({
    required double distance,
    required Duration time,
    required DateTime assessmentDate,
  }) async {
    final user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception('User not authenticated');
    }

    final vdotScore = VdotCalculator.calculateVdot(
      distance: distance,
      time: time,
    );

    final newScore = VdotScore(
      userId: user.id,
      score: vdotScore,
      raceDistance: distance,
      raceTime: time.inSeconds.toDouble(),
      assessmentDate: assessmentDate,
    );

    try {
      await ref
          .read(supabaseClientProvider)
          .from('vdot_scores')
          .insert(newScore.toJson());

      // Update the user's current VDOT score
      await ref
          .read(userProfileProvider.notifier)
          .updateProfile(currentVdot: vdotScore);

      // Refresh the list
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('Failed to add VDOT score: ${e.toString()}');
    }
  }

  /// Deletes a VDOT score
  Future<void> deleteVdotScore(String scoreId) async {
    try {
      await ref
          .read(supabaseClientProvider)
          .from('vdot_scores')
          .delete()
          .eq('id', scoreId);

      // Refresh the list
      ref.invalidateSelf();
    } catch (e) {
      throw Exception('Failed to delete VDOT score: ${e.toString()}');
    }
  }
}

/// Provider for managing VDOT calculations and state
@riverpod
class Vdot extends _$Vdot {
  @override
  double? build() => null;

  void calculateVdot({required double distance, required Duration time}) {
    state = VdotCalculator.calculateVdot(distance: distance, time: time);
  }

  Map<String, double> getTrainingPaces() {
    if (state == null) return {};
    return VdotCalculator.getTrainingPaces(state!);
  }

  Map<String, Duration> getRacePredictions() {
    if (state == null) return {};
    return VdotCalculator.getEquivalentRaceTimes(state!);
  }

  String getVdotLevel() {
    if (state == null) return 'Not Calculated';
    return VdotCalculator.getVdotLevel(state!);
  }

  double adjustVdotForConditions({
    double? temperatureCelsius,
    double? altitudeMeters,
  }) {
    if (state == null) return 0.0;
    return VdotCalculator.adjustVdotForConditions(
      state!,
      temperatureCelsius ?? 20.0,
      altitudeMeters ?? 0.0,
    );
  }
}
