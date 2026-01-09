import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Auth header molecule - logo + title + subtitle
class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showLogo;
  final double logoSize;
  final CrossAxisAlignment alignment;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showLogo = true,
    this.logoSize = 64,
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLogo) ...[
          AppLogo(size: logoSize),
          const SizedBox(height: AppSpacing.spacing6),
        ],
        Text(
          title,
          style: AppTypography.h1.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
          textAlign: alignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.spacing2),
          Text(
            subtitle!,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}

/// Page header molecule - title + subtitle without logo
class PageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTypography.h1.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
          textAlign: alignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.spacing2),
          Text(
            subtitle!,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
