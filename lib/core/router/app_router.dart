import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../presentation/features/auth/login_screen.dart';
import '../../presentation/features/auth/signup_screen.dart';
import '../../presentation/features/home/home_screen.dart';
import '../../presentation/features/onboarding/onboarding_screen.dart';
import '../../presentation/features/profile/profile_screen.dart';
import '../../presentation/features/profile/settings_screen.dart';
import '../../presentation/features/training_plan/create_plan_screen.dart';
import '../../presentation/features/training_plan/training_plan_screen.dart';
import '../../presentation/features/vdot_calculator/vdot_calculator_screen.dart';

/// Provider for the app router
final appRouterProvider = Provider<GoRouter>((ref) {
  // Check if the user is authenticated
  final supabase = Supabase.instance.client;
  final isAuthenticated = supabase.auth.currentSession != null;

  return GoRouter(
    initialLocation: '/onboarding',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Check if the user is going to an auth screen
      final isGoingToAuth = state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup' ||
          state.matchedLocation == '/onboarding';

      // If the user is not authenticated and not going to an auth screen,
      // redirect to onboarding
      if (!isAuthenticated && !isGoingToAuth) {
        return '/onboarding';
      }

      // If the user is authenticated and going to an auth screen,
      // redirect to home
      if (isAuthenticated && isGoingToAuth) {
        return '/home';
      }

      // No redirection needed
      return null;
    },
    refreshListenable: GoRouterRefreshStream(supabase.auth.onAuthStateChange),
    routes: [
      // Onboarding flow
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Authentication
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),

      // Main app screens
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/vdot-calculator',
        name: 'vdot-calculator',
        builder: (context, state) => const VdotCalculatorScreen(),
      ),
      GoRoute(
        path: '/create-plan',
        name: 'create-plan',
        builder: (context, state) => const CreatePlanScreen(),
      ),
      GoRoute(
        path: '/training-plan/:id',
        name: 'training-plan',
        builder: (context, state) {
          final planId = state.pathParameters['id']!;
          return TrainingPlanScreen(planId: planId);
        },
      ),

      // Profile and settings
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],

    // Error handling
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(child: Text('No route defined for ${state.uri.path}')),
    ),
  );
});

/// A [Listenable] implementation that refreshes when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AuthState> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
