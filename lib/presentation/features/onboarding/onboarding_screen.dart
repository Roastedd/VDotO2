import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Onboarding screen that introduces the app to new users
class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PageController for the onboarding carousel
    final pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          // Onboarding carousel
          PageView(
            controller: pageController,
            children: const [
              _OnboardingPage(
                image: 'assets/images/onboarding1.png',
                title: 'Achieve your running goals',
                description:
                    'With our scientifically-based training plans you get the right training for any running goal that you set out to achieve.',
                pageIndex: 0,
              ),
              _OnboardingPage(
                image: 'assets/images/onboarding2.png',
                title: 'Training plans that adapt with you',
                description:
                    'Our training plans adapt based on your progress. This way you always get the max benefit from every workout.',
                pageIndex: 1,
              ),
              _OnboardingPage(
                image: 'assets/images/onboarding3.png',
                title: 'Create a personalized training plan',
                description:
                    'Get the best training available for you, so you can reach any running goal or race time.',
                pageIndex: 2,
              ),
            ],
          ),

          // Bottom buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Column(
              children: [
                // Get started button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: () => context.go('/signup'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                // Already have an account link
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text(
                    'Already have an account? Log in',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Single page in the onboarding carousel
class _OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int pageIndex;

  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Image takes up top 60% of screen
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Content takes up bottom 40% of screen
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Page indicator dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == pageIndex ? 12 : 8,
                        height: index == pageIndex ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              index == pageIndex
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(76),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
