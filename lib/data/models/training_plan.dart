import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vo2rpg/data/models/workout.dart';

part 'training_plan.freezed.dart';
part 'training_plan.g.dart';

/// Training plan types
@HiveType(typeId: 0)
enum PlanType {
  @HiveField(0)
  @JsonValue('base')
  base,

  @HiveField(1)
  @JsonValue('5k')
  fiveK,

  @HiveField(2)
  @JsonValue('10k')
  tenK,

  @HiveField(3)
  @JsonValue('half_marathon')
  halfMarathon,

  @HiveField(4)
  @JsonValue('marathon')
  marathon,
}

/// Training plan model
@freezed
abstract class TrainingPlan with _$TrainingPlan {
  const factory TrainingPlan({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required PlanType planType,
    @HiveField(3) required DateTime startDate,
    @HiveField(4) required DateTime endDate,
    @HiveField(5)
    @JsonKey(name: 'target_race_distance')
    required int targetRaceDistance,
    @HiveField(6) @JsonKey(name: 'target_race_date') DateTime? targetRaceDate,
    @HiveField(7) @JsonKey(name: 'current_week') required int currentWeek,
    @HiveField(8) @JsonKey(name: 'current_vdot') required double currentVdot,
    @HiveField(9) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(10) @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @HiveField(11) @Default(false) @JsonKey(name: 'is_deleted') bool isDeleted,
    @HiveField(12) @Default([]) List<Workout> workouts,
  }) = _TrainingPlan;

  /// Creates an empty training plan
  factory TrainingPlan.empty() => TrainingPlan(
        id: '',
        userId: '',
        planType: PlanType.base,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 56)), // 8 weeks
        targetRaceDistance: 0,
        currentVdot: 0,
        currentWeek: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  /// Creates a TrainingPlan from JSON
  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);
}

/// Hive adapter for TrainingPlan
class TrainingPlanAdapter extends TypeAdapter<TrainingPlan> {
  @override
  final int typeId = 1;

  @override
  TrainingPlan read(BinaryReader reader) {
    return TrainingPlan(
      id: reader.read(),
      userId: reader.read(),
      planType: reader.read(),
      startDate: reader.read(),
      endDate: reader.read(),
      targetRaceDistance: reader.read(),
      targetRaceDate: reader.read(),
      currentWeek: reader.read(),
      currentVdot: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
      isDeleted: reader.read(),
      workouts: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, TrainingPlan obj) {
    writer.write(obj.id);
    writer.write(obj.userId);
    writer.write(obj.planType);
    writer.write(obj.startDate);
    writer.write(obj.endDate);
    writer.write(obj.targetRaceDistance);
    writer.write(obj.targetRaceDate);
    writer.write(obj.currentWeek);
    writer.write(obj.currentVdot);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
    writer.write(obj.isDeleted);
    writer.write(obj.workouts);
  }
}

/// Hive adapter for PlanType enum
class PlanTypeAdapter extends TypeAdapter<PlanType> {
  @override
  final int typeId = 0;

  @override
  PlanType read(BinaryReader reader) {
    return PlanType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, PlanType obj) {
    writer.writeByte(obj.index);
  }
}
