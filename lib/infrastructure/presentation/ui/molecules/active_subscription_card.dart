import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Active subscription card showing gym membership details
class ActiveSubscriptionCard extends StatelessWidget {
  final String gymName;
  final String? gymImageUrl;
  final String planType;
  final String expiryText;
  final SubscriptionStatus status;
  final String? warningText;
  final VoidCallback? onGenerateQR;
  final VoidCallback? onRenew;
  final VoidCallback? onViewDetails;
  final bool isExpiring;
  final bool showRenewButton;

  const ActiveSubscriptionCard({
    super.key,
    required this.gymName,
    required this.planType,
    required this.expiryText,
    required this.status,
    this.gymImageUrl,
    this.warningText,
    this.onGenerateQR,
    this.onRenew,
    this.onViewDetails,
    this.isExpiring = false,
    this.showRenewButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(
          color: isExpiring
              ? AppColors.warning500.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isExpiring) const SizedBox(height: 8),
                // Top row with image and info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gym image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        color: isDark
                            ? DarkAppColors.surfaceElevated2
                            : AppColors.neutral100,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                      child: gymImageUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(AppRadius.lg),
                              child: Image.network(
                                gymImageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                  Icons.fitness_center,
                                  color: isDark
                                      ? DarkAppColors.textMuted
                                      : AppColors.neutral400,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.fitness_center,
                              color: isDark
                                  ? DarkAppColors.textMuted
                                  : AppColors.neutral400,
                            ),
                    ),
                    const SizedBox(width: 16),
                    // Gym info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  gymName,
                                  style: AppTypography.h5.copyWith(
                                    color: isDark
                                        ? DarkAppColors.textPrimary
                                        : AppColors.neutral900,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SubscriptionStatusBadge(
                                status: status,
                                showPulse: status == SubscriptionStatus.active,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            planType,
                            style: AppTypography.bodySm.copyWith(
                              color: isDark
                                  ? DarkAppColors.textSecondary
                                  : AppColors.neutral600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                isExpiring
                                    ? Icons.event_busy
                                    : Icons.event,
                                size: 16,
                                color: isExpiring
                                    ? AppColors.warning500
                                    : (isDark
                                        ? DarkAppColors.textMuted
                                        : AppColors.neutral500),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                expiryText,
                                style: AppTypography.bodyXs.copyWith(
                                  color: isExpiring
                                      ? AppColors.warning500
                                      : (isDark
                                          ? DarkAppColors.textMuted
                                          : AppColors.neutral500),
                                  fontWeight: isExpiring
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Action buttons
                if (onGenerateQR != null || onRenew != null) ...[
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: showRenewButton ? onRenew : onGenerateQR,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: showRenewButton
                            ? AppColors.white
                            : AppColors.primary500,
                        foregroundColor: showRenewButton
                            ? AppColors.neutral900
                            : AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                        ),
                        shadowColor: showRenewButton
                            ? Colors.transparent
                            : AppColors.primary500.withValues(alpha: 0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            showRenewButton ? Icons.autorenew : Icons.qr_code_2,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            showRenewButton ? 'Renew Now' : 'Generate QR',
                            style: AppTypography.button.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                // View details link
                if (onViewDetails != null)
                  GestureDetector(
                    onTap: onViewDetails,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'View Details',
                          style: AppTypography.bodyXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textSecondary
                                : AppColors.neutral600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Warning badge (positioned absolutely)
          if (isExpiring && warningText != null)
            Positioned(
              top: -3,
              left: 16,
              child: WarningBadge(
                text: warningText!,
                icon: Icons.warning,
              ),
            ),
        ],
      ),
    );
  }
}
