import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Alert banner component for displaying warnings, info, or success messages
class AlertBanner extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const AlertBanner({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
    super.key,
    this.subtitle,
    this.actionLabel,
    this.onActionPressed,
  });

  factory AlertBanner.warning({
    required String title,
    String? subtitle,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    return AlertBanner(
      title: title,
      subtitle: subtitle,
      icon: Icons.warning_rounded,
      backgroundColor: AppColors.secondary500.withValues(alpha: 0.1),
      borderColor: AppColors.secondary500.withValues(alpha: 0.2),
      iconColor: AppColors.secondary500,
      textColor: AppColors.secondary500,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
    );
  }

  factory AlertBanner.info({
    required String title,
    String? subtitle,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    return AlertBanner(
      title: title,
      subtitle: subtitle,
      icon: Icons.info_outline_rounded,
      backgroundColor: AppColors.info500.withValues(alpha: 0.1),
      borderColor: AppColors.info500.withValues(alpha: 0.2),
      iconColor: AppColors.info500,
      textColor: AppColors.info500,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
    );
  }

  factory AlertBanner.success({
    required String title,
    String? subtitle,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    return AlertBanner(
      title: title,
      subtitle: subtitle,
      icon: Icons.check_circle_outline_rounded,
      backgroundColor: AppColors.success500.withValues(alpha: 0.1),
      borderColor: AppColors.success500.withValues(alpha: 0.2),
      iconColor: AppColors.success500,
      textColor: AppColors.success500,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
    );
  }

  factory AlertBanner.error({
    required String title,
    String? subtitle,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    return AlertBanner(
      title: title,
      subtitle: subtitle,
      icon: Icons.error_outline_rounded,
      backgroundColor: AppColors.error500.withValues(alpha: 0.1),
      borderColor: AppColors.error500.withValues(alpha: 0.2),
      iconColor: AppColors.error500,
      textColor: AppColors.error500,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing3),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: AppBorderRadius.lg,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          SizedBox(width: AppSpacing.spacing2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.labelSm.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: AppTypography.labelXs.copyWith(
                      color: isDark
                          ? theme.mutedText.withValues(alpha: 0.7)
                          : AppColors.neutral600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (actionLabel != null && onActionPressed != null) ...[
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onActionPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: iconColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacing3,
                  vertical: 6,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                actionLabel!,
                style: AppTypography.labelSm.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
