import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Payment method card showing credit/debit card info
class PaymentMethodCard extends StatelessWidget {
  final String lastFourDigits;
  final String? expiryDate;
  final String? cardBrand;
  final VoidCallback? onUpdate;

  const PaymentMethodCard({
    super.key,
    required this.lastFourDigits,
    this.expiryDate,
    this.cardBrand,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          // Card icon/logo
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                cardBrand ?? 'CARD',
                style: AppTypography.labelXs.copyWith(
                  color: AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Card details
          Expanded(
            child: Text(
              '•••• $lastFourDigits',
              style: AppTypography.bodySm.copyWith(
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Update button
          if (onUpdate != null)
            GestureDetector(
              onTap: onUpdate,
              child: Text(
                'Update',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
