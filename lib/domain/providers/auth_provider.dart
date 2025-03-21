import 'package:riverpod_annotation/riverpod_annotation.dart'
    show riverpod, ProviderFor;
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user.dart';

part 'auth_provider.g.dart';

/// Provider for the Supabase client
@riverpod
Supabase supabase(Ref ref) {
  return Supabase.instance;
}

/// Provider for the Supabase client
@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return ref.watch(supabaseProvider).client;
}

/// Provider for the current auth state
@riverpod
Stream<AuthState> authStateChange(Ref ref) {
  return ref.watch(supabaseClientProvider).auth.onAuthStateChange;
}

/// Provider for the current user
@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    final authState = ref.watch(authStateChangeProvider).valueOrNull;
    final session = authState?.session;

    if (session == null) return null;

    final userData = session.user;

    return User(
      id: userData.id,
      email: userData.email ?? '',
      fullName: userData.userMetadata?['full_name'] as String?,
      createdAt: null, // We'll handle this separately if needed
      lastSignInAt: null, // We'll handle this separately if needed
    );
  }

  /// Signs in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = null;

    try {
      await ref
          .read(supabaseClientProvider)
          .auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Failed to sign in: ${e.toString()}');
    }
  }

  /// Signs up with email and password
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String fullName,
  ) async {
    state = null;

    try {
      await ref.read(supabaseClientProvider).auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );
    } catch (e) {
      throw Exception('Failed to sign up: ${e.toString()}');
    }
  }

  /// Signs out the current user
  Future<void> signOut() async {
    try {
      await ref.read(supabaseClientProvider).auth.signOut();
      state = null;
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }

  /// Resets the password for the given email
  Future<void> resetPassword(String email) async {
    try {
      await ref.read(supabaseClientProvider).auth.resetPasswordForEmail(email);
    } catch (e) {
      throw Exception('Failed to reset password: ${e.toString()}');
    }
  }
}
