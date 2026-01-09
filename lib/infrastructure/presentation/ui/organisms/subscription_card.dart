import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../../config/theme/theme.dart';

/// Card component for displaying active gym subscription details
class SubscriptionCard extends StatelessWidget {
  final String gymName;
  final String expiryDate;
  final String? imageUrl;
  final bool isActive;
  final VoidCallback? onShowQRCode;

  const SubscriptionCard({
    required this.gymName,
    required this.expiryDate,
    super.key,
    this.imageUrl,
    this.isActive = true,
    this.onShowQRCode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : Colors.white,
        borderRadius: AppBorderRadius.xl,
        border: isDark
            ? null
            : Border.all(color: AppColors.borderLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gym image
          Container(
            height: 112,
            decoration: BoxDecoration(
              color: isDark ? DarkAppColors.surfaceElevated2 : AppColors.neutral200,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (imageUrl != null)
                  Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                // Status badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: isActive
                      ? const AppBadge.active()
                      : const AppBadge.expired(),
                ),
              ],
            ),
          ),
          // Card content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gymName,
                            style: AppTypography.h5.copyWith(
                              color: isDark
                                  ? DarkAppColors.textPrimary
                                  : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.event_rounded,
                                size: 12,
                                color: isDark
                                    ? DarkAppColors.textMuted
                                    : AppColors.textMuted,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Expires $expiryDate',
                                style: AppTypography.labelXs.copyWith(
                                  color: isDark
                                      ? DarkAppColors.textMuted
                                      : AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary500.withValues(alpha: 0.1),
                        borderRadius: AppBorderRadius.md,
                      ),
                      child: Icon(
                        Icons.fitness_center_rounded,
                        size: 18,
                        color: AppColors.primary500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // QR Code button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onShowQRCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.qr_code_2_rounded, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Show QR Code',
                          style: AppTypography.labelLg.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
