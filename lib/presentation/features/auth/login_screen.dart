import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Login screen for existing users
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/onboarding'),
        ),
        title: const Text('Log in'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email field
            const TextField(
              decoration: InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            const SizedBox(height: 16),

            // Password field
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {
                    // Toggle password visibility
                  },
                ),
              ),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),

            const SizedBox(height: 32),

            // Login button
            ElevatedButton(
              onPressed: () {
                // Implement login logic
                context.go('/home');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text('Log in', style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 24),

            // Divider with "or continue with" text
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or continue with',
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(153),
                    ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 24),

            // Social login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SocialLoginButton(
                  icon: 'assets/images/google_icon.png',
                  onPressed: () {
                    // Implement Google login
                  },
                ),
                _SocialLoginButton(
                  icon: 'assets/images/apple_icon.png',
                  onPressed: () {
                    // Implement Apple login
                  },
                ),
                _SocialLoginButton(
                  icon: 'assets/images/facebook_icon.png',
                  onPressed: () {
                    // Implement Facebook login
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Social login button widget
class _SocialLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const _SocialLoginButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Center(child: Image.asset(icon, width: 24, height: 24)),
      ),
    );
  }
}
