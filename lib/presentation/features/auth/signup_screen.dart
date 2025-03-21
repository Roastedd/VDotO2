import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../domain/providers/auth_provider.dart';

/// Signup screen for new users
class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create controllers for the text fields
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final fullNameController = useTextEditingController();

    // State for password visibility and loading
    final isPasswordVisible = useState(false);
    final isLoading = useState(false);
    final errorMessage = useState<String?>(null);

    // Handle signup
    Future<void> handleSignup() async {
      // Validate inputs
      if (emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          fullNameController.text.isEmpty) {
        errorMessage.value = 'Please fill in all fields';
        return;
      }

      // Show loading indicator
      isLoading.value = true;
      errorMessage.value = null;

      try {
        // Call the signup method from the auth provider
        await ref.read(currentUserProvider.notifier).signUpWithEmailAndPassword(
              emailController.text.trim(),
              passwordController.text,
              fullNameController.text.trim(),
            );

        // Navigate to home on success
        if (context.mounted) {
          context.go('/home');
        }
      } catch (e) {
        // Show error message
        errorMessage.value = e.toString();
      } finally {
        // Hide loading indicator
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/onboarding'),
        ),
        title: const Text('Create account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full name field
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(hintText: 'Full Name'),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
            ),

            const SizedBox(height: 16),

            // Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            const SizedBox(height: 16),

            // Password field
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle password visibility
                    isPasswordVisible.value = !isPasswordVisible.value;
                  },
                ),
              ),
              obscureText: !isPasswordVisible.value,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => handleSignup(),
            ),

            const SizedBox(height: 8),

            // Error message
            if (errorMessage.value != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SelectableText.rich(
                  TextSpan(
                    text: errorMessage.value,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),

            // Sign up button
            ElevatedButton(
              onPressed: isLoading.value ? null : handleSignup,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: isLoading.value
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Sign up', style: TextStyle(fontSize: 18)),
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
                _SocialSignupButton(
                  icon: 'assets/images/google_icon.png',
                  onPressed: () {
                    // Implement Google signup
                  },
                ),
                _SocialSignupButton(
                  icon: 'assets/images/apple_icon.png',
                  onPressed: () {
                    // Implement Apple signup
                  },
                ),
                _SocialSignupButton(
                  icon: 'assets/images/facebook_icon.png',
                  onPressed: () {
                    // Implement Facebook signup
                  },
                ),
              ],
            ),

            const Spacer(),

            // Terms and privacy policy
            Text(
              'By continuing you agree to V.O2\'s Terms of Service and Privacy Policy',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Social signup button widget
class _SocialSignupButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const _SocialSignupButton({required this.icon, required this.onPressed});

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
        child: Center(
          child: Image.asset(
            icon,
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error_outline, size: 24);
            },
          ),
        ),
      ),
    );
  }
}
