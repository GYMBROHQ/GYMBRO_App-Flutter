import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Warning badge for expiring subscriptions
class WarningBadge extends StatelessWidget {
  final String text;
  final IconData? icon;

  const WarningBadge({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.warning500,
        borderRadius: BorderRadius.circular(AppRadius.full),
        boxShadow: [
          BoxShadow(
            color: AppColors.warning500.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: AppColors.neutral900,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTypography.labelXs.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
