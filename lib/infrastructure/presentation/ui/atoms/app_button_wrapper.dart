import 'package:flutter/material.dart';
import 'app_button.dart';

/// Button variant enum
enum ButtonVariant {
  primary,
  outlined,
  text,
}

/// Unified button wrapper that supports different variants
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? icon;
  final double? height;
  final ButtonVariant variant;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
    this.height,
    this.variant = ButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return AppPrimaryButton(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          isFullWidth: isFullWidth,
          icon: icon,
          height: height,
        );
      case ButtonVariant.outlined:
        return AppSecondaryButton(
          text: text,
          onPressed: onPressed,
          isLoading: isLoading,
          isFullWidth: isFullWidth,
          icon: icon,
          height: height,
        );
      case ButtonVariant.text:
        return AppTextButton(
          text: text,
          onPressed: onPressed,
          isFullWidth: isFullWidth,
          icon: icon,
        );
    }
  }
}
