import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/providers/auth_provider.dart';
import '../../common_widgets/index.dart';

/// Settings screen for app settings and user preferences
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Account section
          _SettingsSection(
            title: 'Account',
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(
                  ref.read(currentUserProvider)?.email ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show dialog to change email
                  _showChangeEmailDialog(context, ref);
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Password'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show dialog to change password
                  _showChangePasswordDialog(context, ref);
                },
              ),
            ],
          ),

          // Preferences section
          _SettingsSection(
            title: 'Preferences',
            children: [
              ListTile(
                leading: const Icon(Icons.straighten),
                title: const Text('Units'),
                trailing: const Text('Metric'),
                onTap: () {
                  // Show dialog to change units
                  _showChangeUnitsDialog(context);
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                value: true,
                onChanged: (value) {
                  // Toggle notifications
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  // Toggle dark mode
                },
              ),
            ],
          ),

          // App section
          _SettingsSection(
            title: 'App',
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show about dialog
                  showAboutDialog(
                    context: context,
                    applicationName: 'VO2RPG',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2024 VO2RPG',
                    children: [
                      const Text(
                        'A running training app based on Jack Daniels\' VDOT methodology.',
                      ),
                    ],
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Support'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to help screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to privacy policy
                },
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to terms of service
                },
              ),
            ],
          ),

          // Sign out button
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppButton(
              label: 'Sign Out',
              onPressed: () async {
                isLoading.value = true;
                try {
                  await ref.read(currentUserProvider.notifier).signOut();
                  if (context.mounted) {
                    context.go('/onboarding');
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                } finally {
                  isLoading.value = false;
                }
              },
              isLoading: isLoading.value,
              type: AppButtonType.secondary,
              isFullWidth: true,
            ),
          ),

          // Delete account button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                // Show dialog to confirm account deletion
                _showDeleteAccountDialog(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Delete Account'),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // Show dialog to change email
  void _showChangeEmailDialog(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Change Email'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'New Email'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Implement email change
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This feature is not yet implemented'),
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  // Show dialog to change password
  void _showChangePasswordDialog(BuildContext context, WidgetRef ref) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Change Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: currentPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Current Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: newPasswordController,
                  decoration: const InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                  obscureText: true,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Implement password change
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This feature is not yet implemented'),
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  // Show dialog to change units
  void _showChangeUnitsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Units'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: const Text('Metric (km)'),
                  value: 'metric',
                  groupValue: 'metric',
                  onChanged: (value) {
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: const Text('Imperial (miles)'),
                  value: 'imperial',
                  groupValue: 'metric',
                  onChanged: (value) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('This feature is not yet implemented'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
    );
  }

  // Show dialog to confirm account deletion
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Account'),
            content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Implement account deletion
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This feature is not yet implemented'),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}

/// Settings section widget
class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
