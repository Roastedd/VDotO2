import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_provider.g.dart';

/// Provider for the Supabase client instance
@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}
