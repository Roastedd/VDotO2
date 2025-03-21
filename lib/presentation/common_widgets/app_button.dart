import 'package:flutter/material.dart';

/// Button types for the AppButton
enum AppButtonType {
  /// Primary filled button with accent color
  primary,
  
  /// Secondary outlined button
  secondary,
  
  /// Text-only button
  text,
}

/// A reusable button widget with consistent styling
class AppButton extends StatelessWidget {
  /// Creates a button with the app's styling
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isDisabled = false,
  });

  /// The text to display on the button
  final String label;
  
  /// Callback when the button is pressed
  final VoidCallback? onPressed;
  
  /// The type of button to display
  final AppButtonType type;
  
  /// Optional icon to display before the label
  final IconData? icon;
  
  /// Whether the button is in a loading state
  final bool isLoading;
  
  /// Whether the button should take up the full width
  final bool isFullWidth;
  
  /// Whether the button is disabled
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Determine the button style based on the type
    ButtonStyle buttonStyle;
    Widget labelWidget;
    
    switch (type) {
      case AppButtonType.primary:
        buttonStyle = theme.elevatedButtonTheme.style!;
        break;
      case AppButtonType.secondary:
        buttonStyle = theme.outlinedButtonTheme.style!;
        break;
      case AppButtonType.text:
        buttonStyle = theme.textButtonTheme.style!;
        break;
    }
    
    // Create the label widget with or without an icon
    if (isLoading) {
      labelWidget = SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AppButtonType.primary
                ? Colors.white
                : theme.colorScheme.primary,
          ),
        ),
      );
    } else if (icon != null) {
      labelWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    } else {
      labelWidget = Text(label);
    }
    
    // Create the button based on the type
    Widget button;
    switch (type) {
      case AppButtonType.primary:
        button = ElevatedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: buttonStyle,
          child: labelWidget,
        );
        break;
      case AppButtonType.secondary:
        button = OutlinedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: buttonStyle,
          child: labelWidget,
        );
        break;
      case AppButtonType.text:
        button = TextButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: buttonStyle,
          child: labelWidget,
        );
        break;
    }
    
    // Apply full width if needed
    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }
    
    return button;
  }
}