import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Countdown timer display atom for QR code expiration
class CountdownTimer extends StatelessWidget {
  final Duration remainingTime;
  final TextStyle? textStyle;

  const CountdownTimer({
    super.key,
    required this.remainingTime,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$minutes:$seconds',
          style: textStyle ??
              const TextStyle(
                fontFamily: AppTypography.fontFamilyMono,
                fontSize: 64,
                fontWeight: FontWeight.w700,
                color: AppColors.primary500,
                letterSpacing: -2,
                height: 1.0,
                shadows: [
                  Shadow(
                    color: AppColors.primary500,
                    blurRadius: 20,
                  ),
                ],
              ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.timer,
              size: 14,
              color: AppColors.primary500,
            ),
            const SizedBox(width: 8),
            Text(
              'REMAINING',
              style: AppTypography.labelSm.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
