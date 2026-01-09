import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Compact past subscription item for collapsible section
class PastSubscriptionItem extends StatelessWidget {
  final String gymName;
  final String? gymImageUrl;
  final String? planName;
  final String endedDate;
  final VoidCallback? onRenew;

  const PastSubscriptionItem({
    super.key,
    required this.gymName,
    required this.endedDate,
    this.gymImageUrl,
    this.planName,
    this.onRenew,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Opacity(
      opacity: 0.6,
      child: Row(
        children: [
          // Gym image (grayscale)
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.md),
              color: isDark
                  ? DarkAppColors.surfaceElevated2
                  : AppColors.neutral700,
            ),
            child: gymImageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.saturation,
                      ),
                      child: Image.network(
                        gymImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.fitness_center,
                          size: 20,
                          color: isDark
                              ? DarkAppColors.textMuted
                              : AppColors.neutral400,
                        ),
                      ),
                    ),
                  )
                : Icon(
                    Icons.fitness_center,
                    size: 20,
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral400,
                  ),
          ),
          const SizedBox(width: 12),
          // Gym info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gymName,
                  style: AppTypography.bodySm.copyWith(
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (planName != null && planName!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    planName!,
                    style: AppTypography.bodyXs.copyWith(
                      color: isDark
                          ? DarkAppColors.textSecondary
                          : AppColors.neutral400,
                    ),
                  ),
                ],
                const SizedBox(height: 2),
                Text(
                  endedDate,
                  style: AppTypography.bodyXs.copyWith(
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          // Renew button
          if (onRenew != null)
            GestureDetector(
              onTap: onRenew,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Renew',
                  style: AppTypography.bodyXs.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
