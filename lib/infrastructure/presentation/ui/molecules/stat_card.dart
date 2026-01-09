import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// A card component that displays a statistic with a label and value
class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing3),
      decoration: BoxDecoration(
        color: theme.cardSurfaceElevated,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: theme.subtleBorder,
        ),
        boxShadow: AppShadows.xs,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTypography.labelSm.copyWith(
              color: theme.mutedText,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.h2.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
