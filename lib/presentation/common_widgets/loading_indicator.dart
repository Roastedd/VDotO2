import 'package:flutter/material.dart';

/// A reusable loading indicator widget
class LoadingIndicator extends StatelessWidget {
  /// Creates a loading indicator with optional text
  const LoadingIndicator({
    super.key,
    this.text,
    this.color,
    this.size = 36.0,
  });

  /// Optional text to display below the loading indicator
  final String? text;
  
  /// Optional color for the loading indicator
  final Color? color;
  
  /// Size of the loading indicator
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.colorScheme.primary;
    
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
          ),
          if (text != null) ...[
            const SizedBox(height: 16),
            Text(
              text!,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}