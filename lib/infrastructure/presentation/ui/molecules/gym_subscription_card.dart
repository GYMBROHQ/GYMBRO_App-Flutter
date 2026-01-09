import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Gym subscription card showing gym details and membership status
class GymSubscriptionCard extends StatelessWidget {
  final String gymName;
  final String? gymImageUrl;
  final String statusLabel;
  final bool isActive;
  final VoidCallback? onViewTap;

  const GymSubscriptionCard({
    super.key,
    required this.gymName,
    required this.statusLabel,
    this.gymImageUrl,
    this.isActive = true,
    this.onViewTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : AppColors.neutral900,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: isDark
              ? DarkAppColors.borderDefault
              : Colors.white.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Gym Image
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
              ),
              image: gymImageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(gymImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: isDark
                  ? DarkAppColors.surfaceElevated2
                  : AppColors.neutral800,
            ),
            child: gymImageUrl == null
                ? Icon(
                    Icons.fitness_center,
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral500,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          // Gym Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gymName,
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? AppColors.success500
                            : AppColors.error500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      statusLabel,
                      style: AppTypography.bodyXs.copyWith(
                        color: isDark
                            ? DarkAppColors.textMuted
                            : AppColors.neutral400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // View Button
          TextButton(
            onPressed: onViewTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'View',
              style: AppTypography.bodySm.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
