import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Divider with centered text atom
class AppDividerWithText extends StatelessWidget {
  final String text;
  final double verticalPadding;

  const AppDividerWithText({
    super.key,
    required this.text,
    this.verticalPadding = AppSpacing.spacing6,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final dividerColor = isDark ? DarkAppColors.borderDefault : AppColors.borderLight;
    final textColor = isDark ? DarkAppColors.textMuted : AppColors.textMuted;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
            child: Text(
              text,
              style: AppTypography.bodySm.copyWith(
                color: textColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
