import 'package:freezed_annotation/freezed_annotation.dart';

part 'vdot_score.freezed.dart';
part 'vdot_score.g.dart';

/// VdotScore model representing a user's VDOT score from a race result
@freezed
abstract class VdotScore with _$VdotScore {
  /// Creates a new VdotScore instance
  const factory VdotScore({
    String? id,
    required String userId,
    required double score,
    @JsonKey(name: 'race_distance') required double raceDistance,
    @JsonKey(name: 'race_time') required double raceTime,
    @JsonKey(name: 'assessment_date') required DateTime assessmentDate,
    @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
    DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
    DateTime? updatedAt,
  }) = _VdotScore;

  /// Creates a VdotScore from JSON
  factory VdotScore.fromJson(Map<String, dynamic> json) =>
      _$VdotScoreFromJson(json);
}
