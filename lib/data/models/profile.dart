// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// Profile model representing the user profile data
@freezed
abstract class Profile with _$Profile {
  /// Creates a new Profile instance
  const factory Profile({
    required String id,
    required String email,
    String? displayName,
    String? profileImageUrl,
    double? currentVdot,
    @JsonKey(name: 'created_at', includeFromJson: true, includeToJson: false)
    DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeFromJson: true, includeToJson: false)
    DateTime? updatedAt,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
  }) = _Profile;

  /// Creates a Profile from JSON
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// Creates an empty Profile
  factory Profile.empty() => const Profile(id: '', email: '');
}
