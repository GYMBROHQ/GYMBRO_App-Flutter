import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Status badge for subscription states (Active, Expiring, Expired, Canceled)
class SubscriptionStatusBadge extends StatelessWidget {
  final SubscriptionStatus status;
  final bool showPulse;

  const SubscriptionStatusBadge({
    super.key,
    required this.status,
    this.showPulse = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _getBackgroundColor(isDark),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(
          color: _getBorderColor(),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showPulse) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: _getDotColor(),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            _getLabel(),
            style: AppTypography.labelXs.copyWith(
              color: _getTextColor(),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(bool isDark) {
    switch (status) {
      case SubscriptionStatus.active:
        return AppColors.success500.withValues(alpha: 0.1);
      case SubscriptionStatus.expiring:
        return AppColors.warning500.withValues(alpha: 0.1);
      case SubscriptionStatus.expired:
        return AppColors.neutral600.withValues(alpha: 0.1);
      case SubscriptionStatus.canceled:
        return AppColors.error500.withValues(alpha: 0.1);
      case SubscriptionStatus.pending:
        return AppColors.warning500.withValues(alpha: 0.1);
    }
  }

  Color _getBorderColor() {
    switch (status) {
      case SubscriptionStatus.active:
        return AppColors.success500.withValues(alpha: 0.2);
      case SubscriptionStatus.expiring:
        return AppColors.warning500.withValues(alpha: 0.2);
      case SubscriptionStatus.expired:
        return AppColors.neutral500.withValues(alpha: 0.2);
      case SubscriptionStatus.canceled:
        return AppColors.error500.withValues(alpha: 0.2);
      case SubscriptionStatus.pending:
        return AppColors.warning500.withValues(alpha: 0.2);
    }
  }

  Color _getTextColor() {
    switch (status) {
      case SubscriptionStatus.active:
        return AppColors.success500;
      case SubscriptionStatus.expiring:
        return AppColors.warning500;
      case SubscriptionStatus.expired:
        return AppColors.neutral400;
      case SubscriptionStatus.canceled:
        return AppColors.error500;
      case SubscriptionStatus.pending:
        return AppColors.warning500;
    }
  }

  Color _getDotColor() {
    switch (status) {
      case SubscriptionStatus.active:
        return AppColors.success500;
      case SubscriptionStatus.expiring:
        return AppColors.warning500;
      case SubscriptionStatus.expired:
        return AppColors.neutral500;
      case SubscriptionStatus.canceled:
        return AppColors.error500;
      case SubscriptionStatus.pending:
        return AppColors.warning500;
    }
  }

  String _getLabel() {
    switch (status) {
      case SubscriptionStatus.active:
        return 'ACTIVE';
      case SubscriptionStatus.expiring:
        return 'EXPIRING SOON';
      case SubscriptionStatus.expired:
        return 'EXPIRED';
      case SubscriptionStatus.canceled:
        return 'CANCELED';
      case SubscriptionStatus.pending:
        return 'PENDING APPROVAL';
    }
  }
}

enum SubscriptionStatus {
  active,
  expiring,
  expired,
  canceled,
  pending,
}
