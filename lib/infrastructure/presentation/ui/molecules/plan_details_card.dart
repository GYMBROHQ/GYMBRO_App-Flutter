import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Plan details card showing subscription plan information
class PlanDetailsCard extends StatelessWidget {
  final String planName;
  final String price;
  final SubscriptionStatus status;
  final String startDate;
  final String renewalDate;
  final int daysRemaining;

  const PlanDetailsCard({
    super.key,
    required this.planName,
    required this.price,
    required this.status,
    required this.startDate,
    required this.renewalDate,
    required this.daysRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
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
          // Background icon
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.05,
              child: Icon(
                Icons.fitness_center,
                size: 120,
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CURRENT PLAN',
                          style: AppTypography.labelXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.neutral500,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          planName,
                          style: AppTypography.h4.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary
                                : AppColors.neutral900,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          price,
                          style: AppTypography.bodyMd.copyWith(
                            color: isDark
                                ? DarkAppColors.textSecondary
                                : AppColors.neutral700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SubscriptionStatusBadge(
                    status: status,
                    showPulse: status == SubscriptionStatus.active,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Divider
              Container(
                height: 1,
                color: Colors.white.withValues(alpha: 0.05),
              ),
              const SizedBox(height: 16),
              // Dates
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Started',
                          style: AppTypography.bodyXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.neutral500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          startDate,
                          style: AppTypography.bodySm.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary
                                : AppColors.neutral900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Renews',
                          style: AppTypography.bodyXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.neutral500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          renewalDate,
                          style: AppTypography.bodySm.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary
                                : AppColors.neutral900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Days remaining
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.backgroundPrimary.withValues(alpha: 0.5)
                      : AppColors.neutral100,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: AppColors.primary500,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Days remaining',
                        style: AppTypography.bodySm.copyWith(
                          color: isDark
                              ? DarkAppColors.textMuted
                              : AppColors.neutral600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '$daysRemaining Days',
                      style: AppTypography.bodySm.copyWith(
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : AppColors.neutral900,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
