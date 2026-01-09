import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// App logo atom - displays the GYMBRO branding
class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;
  final bool isLight;

  const AppLogo({
    super.key,
    this.size = 64,
    this.showText = false,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final iconColor = theme.colorScheme.primary;
    final bgColor = isDark || isLight
        ? AppColors.primary500.withValues(alpha: 0.2)
        : AppColors.primary100;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(size * 0.25),
          ),
          child: Icon(
            Icons.fitness_center,
            size: size * 0.5,
            color: iconColor,
          ),
        ),
        if (showText) ...[
          const SizedBox(height: AppSpacing.spacing3),
          Text(
            'GYMBRO',
            style: AppTypography.h4.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: AppTypography.weightBold,
            ),
          ),
        ],
      ],
    );
  }
}

/// App logo with text in a row - for headers
class AppLogoHorizontal extends StatelessWidget {
  final double iconSize;
  final double? textSize;

  const AppLogoHorizontal({
    super.key,
    this.iconSize = 28,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(iconSize * 0.2),
          ),
          child: Icon(
            Icons.fitness_center,
            size: iconSize * 0.6,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: AppSpacing.spacing2),
        Text(
          'GYMBRO',
          style: AppTypography.h5.copyWith(
            fontSize: textSize,
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            fontWeight: AppTypography.weightBold,
          ),
        ),
      ],
    );
  }
}
