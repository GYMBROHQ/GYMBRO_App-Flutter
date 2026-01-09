import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Feature list item showing plan features with checkmark
class FeatureListItem extends StatelessWidget {
  final String feature;
  final bool isIncluded;

  const FeatureListItem({
    super.key,
    required this.feature,
    this.isIncluded = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Icon(
            isIncluded ? Icons.check_circle : Icons.cancel,
            size: 20,
            color: isIncluded
                ? AppColors.primary500
                : (isDark ? DarkAppColors.textMuted : AppColors.neutral400),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: AppTypography.bodySm.copyWith(
                color: isDark
                    ? DarkAppColors.textSecondary
                    : AppColors.neutral800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
