import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/profile.dart';
import 'auth_provider.dart';

part 'profile_provider.g.dart';

/// Provider for the user profile
@riverpod
class UserProfile extends _$UserProfile {
  @override
  Future<Profile?> build() async {
    final user = ref.watch(currentUserProvider);

    if (user == null) return null;

    return _fetchProfile(user.id);
  }

  /// Fetches the user profile from Supabase
  Future<Profile?> _fetchProfile(String userId) async {
    try {
      final response =
          await ref
              .read(supabaseClientProvider)
              .from('profiles')
              .select()
              .eq('id', userId)
              .single();

      return Profile.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  /// Updates the user profile
  Future<void> updateProfile({
    String? displayName,
    String? profileImageUrl,
    double? currentVdot,
  }) async {
    final user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception('User not authenticated');
    }

    final currentProfile = await future;

    if (currentProfile == null) {
      throw Exception('Profile not found');
    }

    final updatedProfile = currentProfile.copyWith(
      displayName: displayName ?? currentProfile.displayName,
      profileImageUrl: profileImageUrl ?? currentProfile.profileImageUrl,
      currentVdot: currentVdot ?? currentProfile.currentVdot,
    );

    try {
      await ref
          .read(supabaseClientProvider)
          .from('profiles')
          .update(updatedProfile.toJson())
          .eq('id', user.id);

      state = AsyncData(updatedProfile);
    } catch (e) {
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }

  /// Uploads a profile image to Supabase storage
  Future<String> uploadProfileImage(
    List<int> fileBytes,
    String fileName,
  ) async {
    final user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception('User not authenticated');
    }

    try {
      final fileExt = fileName.split('.').last;
      final filePath = '${user.id}/profile.$fileExt';

      await ref
          .read(supabaseClientProvider)
          .storage
          .from('profile_images')
          .uploadBinary(filePath, Uint8List.fromList(fileBytes));

      final imageUrl = ref
          .read(supabaseClientProvider)
          .storage
          .from('profile_images')
          .getPublicUrl(filePath);

      await updateProfile(profileImageUrl: imageUrl);

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload profile image: ${e.toString()}');
    }
  }
}
