import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Gym information header showing gym name and location
class GymInfoHeader extends StatelessWidget {
  final String gymName;
  final String location;

  const GymInfoHeader({
    super.key,
    required this.gymName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          gymName,
          style: AppTypography.h2.copyWith(
            color: isDark ? DarkAppColors.textPrimary : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
              size: 18,
              color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
            ),
            const SizedBox(width: 6),
            Text(
              location,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
