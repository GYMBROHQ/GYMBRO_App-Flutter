import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Card component for displaying subscription plan options
/// Design: mobile-first revision from GYMBRO_Docs
class PlanCard extends StatelessWidget {
  final String title;
  final double price;
  final String period;
  final List<String> features;
  final String? badge;
  final Color? badgeColor;
  final Color? titleColor;
  final bool isHighlighted;
  final bool isCurrentPlan;
  final VoidCallback? onSelect;
  final bool isDark;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.period,
    required this.features,
    this.badge,
    this.badgeColor,
    this.titleColor,
    this.isHighlighted = false,
    this.isCurrentPlan = false,
    this.onSelect,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark
                ? DarkAppColors.surfaceElevated1
                : AppColors.backgroundPrimary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHighlighted
                  ? AppColors.primary500
                  : (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault),
              width: isHighlighted ? 2 : 1,
            ),
            boxShadow: isHighlighted
                ? [
                    BoxShadow(
                      color: AppColors.primary500.withValues(alpha: 0.15),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
          padding: EdgeInsets.all(AppSpacing.spacing5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppTypography.labelSm.copyWith(
                      color: titleColor ??
                          (isHighlighted
                              ? AppColors.primary500
                              : (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary)),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(0)}',
                        style: AppTypography.displaySm.copyWith(
                          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                        ),
                      ),
                      SizedBox(width: AppSpacing.spacing1),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          '/$period',
                          style: AppTypography.bodyMd.copyWith(
                            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.spacing5),
              // Divider
              Container(
                height: 1,
                color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
              ),
              SizedBox(height: AppSpacing.spacing5),
              // Features list
              ...features.map((feature) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.spacing3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: AppColors.primary500,
                      ),
                      SizedBox(width: AppSpacing.spacing3),
                      Expanded(
                        child: Text(
                          feature,
                          style: AppTypography.bodyMd.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary.withValues(alpha: 0.9)
                                : AppColors.textPrimary.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              SizedBox(height: AppSpacing.spacing2),
              // Select button
              AppButton(
                text: isCurrentPlan ? 'Current Plan' : 'Select ${title.toLowerCase()}',
                onPressed: isCurrentPlan ? null : onSelect,
                isFullWidth: true,
                variant: isCurrentPlan
                    ? ButtonVariant.outlined
                    : (isHighlighted ? ButtonVariant.primary : ButtonVariant.outlined),
              ),
            ],
          ),
        ),
        // Badge positioned at top right - Current Plan takes priority
        if (isCurrentPlan || badge != null)
          Positioned(
            top: -12,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing3,
                vertical: AppSpacing.spacing1,
              ),
              decoration: BoxDecoration(
                color: isCurrentPlan
                    ? AppColors.success500
                    : (badgeColor ?? AppColors.primary500),
                borderRadius: BorderRadius.circular(100),
                border: (!isCurrentPlan && badgeColor != null)
                    ? Border.all(
                        color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                        width: 1,
                      )
                    : null,
              ),
              child: Text(
                isCurrentPlan ? 'Current Plan' : badge!,
                style: AppTypography.labelXs.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
