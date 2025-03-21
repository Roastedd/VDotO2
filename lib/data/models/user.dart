import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User model representing the authenticated user
@freezed
abstract class User with _$User {
  /// Creates a new User instance
  const factory User({
    required String id,
    required String email,
    String? fullName,
    @JsonKey(includeFromJson: true, includeToJson: false) DateTime? createdAt,
    @JsonKey(includeFromJson: true, includeToJson: false)
    DateTime? lastSignInAt,
  }) = _User;

  /// Creates a User from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates an empty User
  factory User.empty() => const User(id: '', email: '');
}
