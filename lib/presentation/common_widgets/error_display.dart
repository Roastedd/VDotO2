import 'package:flutter/material.dart';

/// A reusable widget for displaying errors
class ErrorDisplay extends StatelessWidget {
  /// Creates an error display with the given error message and optional retry callback
  const ErrorDisplay({
    super.key,
    required this.message,
    this.onRetry,
  });

  /// The error message to display
  final String message;
  
  /// Optional callback for retry action
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.error,
              size: 48,
            ),
            const SizedBox(height: 16),
            SelectableText.rich(
              TextSpan(
                text: 'Error: ',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
                children: [
                  TextSpan(
                    text: message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}