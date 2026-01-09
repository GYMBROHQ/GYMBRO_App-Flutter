import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Auth footer link molecule - "Don't have an account? Sign Up"
class AuthFooterLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback? onLinkTap;

  const AuthFooterLink({
    super.key,
    required this.text,
    required this.linkText,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTypography.bodySm.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          ),
        ),
        const SizedBox(width: AppSpacing.spacing1),
        AppLinkText(
          text: linkText,
          onTap: onLinkTap,
        ),
      ],
    );
  }
}
