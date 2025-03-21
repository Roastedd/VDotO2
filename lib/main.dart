import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vo2rpg/core/router/app_router.dart';
import 'package:vo2rpg/data/services/local_storage_service.dart';
import 'package:vo2rpg/data/services/platform_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: '.env');

  // Initialize Supabase
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  // Initialize local storage
  await LocalStorageService.initialize();

  // Initialize platform-specific features
  await PlatformService.initialize();

  // Register web-specific error handler
  if (kIsWeb) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      // Log additional web-specific error information
      debugPrint('Web platform error: ${details.exception}');
    };
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the router from the provider
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'VO2RPG',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
