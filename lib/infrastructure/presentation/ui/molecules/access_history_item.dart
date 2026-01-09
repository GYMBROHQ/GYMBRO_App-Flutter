import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Access history item showing gym entry records
class AccessHistoryItem extends StatelessWidget {
  final String location;
  final String timestamp;
  final bool isSuccess;

  const AccessHistoryItem({
    super.key,
    required this.location,
    required this.timestamp,
    this.isSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.login,
              size: 16,
              color: isDark
                  ? DarkAppColors.textSecondary
                  : AppColors.neutral400,
            ),
          ),
          const SizedBox(width: 12),
          // Location and time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: AppTypography.bodySm.copyWith(
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.neutral900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  timestamp,
                  style: AppTypography.bodyXs.copyWith(
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          // Success indicator
          Icon(
            Icons.check,
            size: 18,
            color: AppColors.success500,
          ),
        ],
      ),
    );
  }
}
