import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Success card organism - for success confirmation screens
class SuccessCard extends StatelessWidget {
  final String title;
  final String message;
  final String? imagePath;
  final Widget? primaryAction;
  final Widget? secondaryAction;

  const SuccessCard({
    super.key,
    required this.title,
    required this.message,
    this.imagePath,
    this.primaryAction,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.spacing6),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        borderRadius: AppBorderRadius.xl,
        boxShadow: AppShadows.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Success background image or gradient
          if (imagePath != null)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                gradient: LinearGradient(
                  colors: [
                    AppColors.success500.withValues(alpha: 0.2),
                    AppColors.primary500.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.spacing4),
          // Success icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.success500,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing4),
          // Title
          Text(
            title,
            style: AppTypography.h2.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.spacing2),
          // Message
          Text(
            message,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
          if (primaryAction != null) ...[
            const SizedBox(height: AppSpacing.spacing6),
            primaryAction!,
          ],
          if (secondaryAction != null) ...[
            const SizedBox(height: AppSpacing.spacing3),
            secondaryAction!,
          ],
        ],
      ),
    );
  }
}
