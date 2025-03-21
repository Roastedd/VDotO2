// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseHash() => r'1a05608b1ab101db13557e285fad9b4efac95d41';

/// Provider for the Supabase client
///
/// Copied from [supabase].
@ProviderFor(supabase)
final supabaseProvider = AutoDisposeProvider<Supabase>.internal(
  supabase,
  name: r'supabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseRef = AutoDisposeProviderRef<Supabase>;
String _$supabaseClientHash() => r'b4746d9e1f1f23fdc13ad1831fbaefea239eda4f';

/// Provider for the Supabase client
///
/// Copied from [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$authStateChangeHash() => r'f061b5f4216702e255de406e1267a564e41d3ae5';

/// Provider for the current auth state
///
/// Copied from [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = AutoDisposeStreamProvider<AuthState>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangeRef = AutoDisposeStreamProviderRef<AuthState>;
String _$currentUserHash() => r'4efeddee758f0c5fe19db8221fd0750b8c7563b2';

/// Provider for the current user
///
/// Copied from [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider =
    AutoDisposeNotifierProvider<CurrentUser, User?>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = AutoDisposeNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
