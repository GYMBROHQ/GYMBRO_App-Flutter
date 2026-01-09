import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme/theme.dart';

/// Back button atom - for navigation
class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Color? color;

  const AppBackButton({
    super.key,
    this.onPressed,
    this.label = 'Back',
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final buttonColor = color ??
        (isDark ? DarkAppColors.textMuted : AppColors.textMuted);

    return InkWell(
      onTap: onPressed ?? () { if (context.canPop()) context.pop(); },
      borderRadius: AppBorderRadius.md,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing2,
          vertical: AppSpacing.spacing1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back,
              size: AppIconSizes.sm,
              color: buttonColor,
            ),
            if (label != null) ...[
              const SizedBox(width: AppSpacing.spacing2),
              Text(
                label!,
                style: AppTypography.labelMd.copyWith(
                  color: buttonColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
