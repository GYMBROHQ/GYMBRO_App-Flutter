import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// User info card for QR code screen showing user details and validity
class QRUserCard extends StatelessWidget {
  final String userName;
  final String userInitials;
  final String? userAvatarUrl;
  final String validityText;
  final VoidCallback? onTap;

  const QRUserCard({
    super.key,
    required this.userName,
    required this.userInitials,
    required this.validityText,
    this.userAvatarUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated2.withValues(alpha: 0.3)
            : AppColors.neutral100.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          // User Avatar with gradient
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary500.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              userInitials,
              style: AppTypography.labelLg.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTypography.bodyMd.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  validityText,
                  style: AppTypography.bodyXs.copyWith(
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Verified icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified_user_rounded,
              size: 20,
              color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}
