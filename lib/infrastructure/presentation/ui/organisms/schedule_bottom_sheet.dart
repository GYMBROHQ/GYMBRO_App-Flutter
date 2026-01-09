import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Bottom sheet displaying the full weekly gym schedule
class ScheduleBottomSheet extends StatelessWidget {
  final Map<String, String> hours;

  const ScheduleBottomSheet({
    super.key,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final today = _getTodayName();

    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.backgroundPrimary : AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Schedule',
                    style: AppTypography.h4.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    color: isDark ? DarkAppColors.textSecondary : AppColors.neutral500,
                  ),
                ],
              ),
            ),

            // Schedule list
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: _buildScheduleList(isDark, today),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildScheduleList(bool isDark, String today) {
    final orderedDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return orderedDays.map((day) {
      final isToday = day == today;
      final hoursText = hours[day] ?? 'Closed';

      return _buildScheduleRow(isDark, day, hoursText, isToday);
    }).toList();
  }

  Widget _buildScheduleRow(bool isDark, String day, String hoursText, bool isToday) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isToday
            ? AppColors.primary500.withValues(alpha: 0.1)
            : (isDark ? DarkAppColors.surfaceElevated1 : AppColors.neutral50),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: isToday
            ? Border.all(color: AppColors.primary500.withValues(alpha: 0.3))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isToday) ...[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.primary500,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Text(
                day,
                style: AppTypography.bodyMd.copyWith(
                  color: isToday
                      ? AppColors.primary500
                      : (isDark ? DarkAppColors.textPrimary : AppColors.neutral900),
                  fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              if (isToday) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary500,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    'TODAY',
                    style: AppTypography.labelXs.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ],
          ),
          Text(
            hoursText,
            style: AppTypography.bodyMd.copyWith(
              color: hoursText.toLowerCase() == 'closed'
                  ? AppColors.error500
                  : (isDark ? DarkAppColors.textSecondary : AppColors.neutral600),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getTodayName() {
    final now = DateTime.now();
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    // DateTime.weekday returns 1 for Monday, 7 for Sunday
    return days[now.weekday - 1];
  }
}
