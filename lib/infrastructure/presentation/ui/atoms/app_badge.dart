import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Status badge component for showing status like "Active", "Expired", etc.
class AppBadge extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hasIndicator;
  final Color? indicatorColor;
  final EdgeInsetsGeometry? padding;

  const AppBadge({
    required this.label,
    super.key,
    this.backgroundColor,
    this.textColor,
    this.hasIndicator = false,
    this.indicatorColor,
    this.padding,
  });

  const AppBadge.active({
    super.key,
    this.padding,
  })  : label = 'Active',
        backgroundColor = null,
        textColor = null,
        hasIndicator = true,
        indicatorColor = AppColors.success500;

  const AppBadge.expired({
    super.key,
    this.padding,
  })  : label = 'Expired',
        backgroundColor = null,
        textColor = null,
        hasIndicator = true,
        indicatorColor = AppColors.error500;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bgColor = backgroundColor ??
        (isDark
            ? Colors.black.withValues(alpha: 0.6)
            : Colors.white.withValues(alpha: 0.9));

    final txtColor = textColor ??
        (isDark ? DarkAppColors.textPrimary : AppColors.textPrimary);

    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppBorderRadius.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIndicator) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: indicatorColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTypography.labelXs.copyWith(
              color: txtColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
