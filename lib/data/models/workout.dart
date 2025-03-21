import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

/// Types of workouts
@HiveType(typeId: 1)
enum WorkoutType {
  @HiveField(0)
  @JsonValue('interval')
  interval,

  @HiveField(1)
  @JsonValue('threshold')
  threshold,

  @HiveField(2)
  @JsonValue('easy')
  easy,

  @HiveField(3)
  @JsonValue('long_run')
  longRun,

  @HiveField(4)
  @JsonValue('rest')
  rest,
}

/// Status of a workout
@HiveType(typeId: 2)
enum WorkoutStatus {
  @HiveField(0)
  @JsonValue('pending')
  pending,

  @HiveField(1)
  @JsonValue('completed')
  completed,

  @HiveField(2)
  @JsonValue('skipped')
  skipped,
}

/// Workout model
@freezed
abstract class Workout with _$Workout {
  const factory Workout({
    @HiveField(0) required String id,
    @HiveField(1)
    @JsonKey(name: 'training_plan_id')
    required String trainingPlanId,
    @HiveField(2)
    @JsonKey(name: 'workout_type')
    required WorkoutType workoutType,
    @HiveField(3)
    @JsonKey(name: 'scheduled_date')
    required DateTime scheduledDate,
    @HiveField(4) @JsonKey(name: 'completed_date') DateTime? completedDate,
    @HiveField(5) @JsonKey(name: 'planned_distance') int? plannedDistance,
    @HiveField(6) @JsonKey(name: 'actual_distance') int? actualDistance,
    @HiveField(7) @JsonKey(name: 'planned_duration') int? plannedDuration,
    @HiveField(8) @JsonKey(name: 'actual_duration') int? actualDuration,
    @HiveField(9) String? notes,
    @HiveField(10) @Default(WorkoutStatus.pending) WorkoutStatus status,
    @HiveField(11) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(12) @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @HiveField(13) @Default(false) @JsonKey(name: 'is_deleted') bool isDeleted,
  }) = _Workout;

  /// Creates a Workout from JSON
  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

/// Hive adapter for Workout
class WorkoutAdapter extends TypeAdapter<Workout> {
  @override
  final int typeId = 4;

  @override
  Workout read(BinaryReader reader) {
    return Workout(
      id: reader.read(),
      trainingPlanId: reader.read(),
      workoutType: reader.read(),
      scheduledDate: reader.read(),
      completedDate: reader.read(),
      plannedDistance: reader.read(),
      actualDistance: reader.read(),
      plannedDuration: reader.read(),
      actualDuration: reader.read(),
      notes: reader.read(),
      status: reader.read(),
      createdAt: reader.read(),
      updatedAt: reader.read(),
      isDeleted: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer.write(obj.id);
    writer.write(obj.trainingPlanId);
    writer.write(obj.workoutType);
    writer.write(obj.scheduledDate);
    writer.write(obj.completedDate);
    writer.write(obj.plannedDistance);
    writer.write(obj.actualDistance);
    writer.write(obj.plannedDuration);
    writer.write(obj.actualDuration);
    writer.write(obj.notes);
    writer.write(obj.status);
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
    writer.write(obj.isDeleted);
  }
}

/// Hive adapter for WorkoutType enum
class WorkoutTypeAdapter extends TypeAdapter<WorkoutType> {
  @override
  final int typeId = 1;

  @override
  WorkoutType read(BinaryReader reader) {
    return WorkoutType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, WorkoutType obj) {
    writer.writeByte(obj.index);
  }
}

/// Hive adapter for WorkoutStatus enum
class WorkoutStatusAdapter extends TypeAdapter<WorkoutStatus> {
  @override
  final int typeId = 2;

  @override
  WorkoutStatus read(BinaryReader reader) {
    return WorkoutStatus.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, WorkoutStatus obj) {
    writer.writeByte(obj.index);
  }
}
