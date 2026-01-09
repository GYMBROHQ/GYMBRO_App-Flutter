import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// A reusable component that displays an icon with an optional badge overlay
/// Used across MFA setup screens for consistent icon+badge pattern
class IconWithBadge extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showBadge;
  final IconData badgeIcon;
  final Color badgeColor;
  final double badgeSize;

  const IconWithBadge({
    super.key,
    required this.icon,
    this.iconSize = 80,
    this.iconColor,
    this.backgroundColor,
    this.showBadge = true,
    this.badgeIcon = Icons.check,
    this.badgeColor = AppColors.success500,
    this.badgeSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final effectiveBackgroundColor = backgroundColor ??
        (isDark ? DarkAppColors.surfaceElevated1 : AppColors.primary100);

    final effectiveIconColor =
        iconColor ?? theme.colorScheme.primary;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main icon container
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: AppBorderRadius.xl,
          ),
          child: Icon(
            icon,
            size: iconSize * 0.5,
            color: effectiveIconColor,
          ),
        ),

        // Badge overlay
        if (showBadge)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? DarkAppColors.backgroundPrimary
                      : AppColors.white,
                  width: 2,
                ),
              ),
              child: Icon(
                badgeIcon,
                size: badgeSize * 0.6,
                color: AppColors.white,
              ),
            ),
          ),
      ],
    );
  }
}
