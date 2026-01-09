import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Password strength level
enum PasswordStrength {
  weak,
  fair,
  medium,
  good,
  strong,
}

/// Password requirement model
class PasswordRequirement {
  final String label;
  final bool isMet;

  const PasswordRequirement({
    required this.label,
    required this.isMet,
  });
}

/// Password strength indicator molecule
class PasswordStrengthIndicator extends StatelessWidget {
  final PasswordStrength strength;
  final List<PasswordRequirement>? requirements;
  final bool showLabel;

  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
    this.requirements,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final inactiveColor = isDark ? DarkAppColors.borderDefault : AppColors.neutral200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Strength meter
        Row(
          children: [
            if (showLabel) ...[
              Text(
                'STRENGTH',
                style: AppTypography.labelXs.copyWith(
                  color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              Text(
                _strengthLabel,
                style: AppTypography.labelSm.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                ),
              ),
            ],
          ],
        ),
        if (showLabel) const SizedBox(height: AppSpacing.spacing2),
        Row(
          children: [
            for (int i = 0; i < 5; i++) ...[
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: AppBorderRadius.full,
                    color: i < _strengthLevel ? _strengthColor : inactiveColor,
                  ),
                ),
              ),
              if (i < 4) const SizedBox(width: AppSpacing.spacing1),
            ],
          ],
        ),
        // Requirements checklist
        if (requirements != null && requirements!.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.spacing4),
          _buildRequirementsCard(context, isDark),
        ],
      ],
    );
  }

  Widget _buildRequirementsCard(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.neutral50,
        borderRadius: AppBorderRadius.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password Requirements',
            style: AppTypography.labelMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3),
          ...requirements!.map((req) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.spacing2),
                child: _RequirementItem(requirement: req),
              )),
        ],
      ),
    );
  }

  int get _strengthLevel {
    switch (strength) {
      case PasswordStrength.weak:
        return 1;
      case PasswordStrength.fair:
        return 2;
      case PasswordStrength.medium:
        return 3;
      case PasswordStrength.good:
        return 4;
      case PasswordStrength.strong:
        return 5;
    }
  }

  String get _strengthLabel {
    switch (strength) {
      case PasswordStrength.weak:
        return 'Weak';
      case PasswordStrength.fair:
        return 'Fair';
      case PasswordStrength.medium:
        return 'Medium';
      case PasswordStrength.good:
        return 'Good';
      case PasswordStrength.strong:
        return 'Strong';
    }
  }

  Color get _strengthColor {
    switch (strength) {
      case PasswordStrength.weak:
        return AppColors.error500;
      case PasswordStrength.fair:
        return AppColors.warning500;
      case PasswordStrength.medium:
        return AppColors.warning500;
      case PasswordStrength.good:
        return AppColors.info500;
      case PasswordStrength.strong:
        return AppColors.success500;
    }
  }
}

class _RequirementItem extends StatelessWidget {
  final PasswordRequirement requirement;

  const _RequirementItem({required this.requirement});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final metColor = AppColors.success500;
    final unmetColor = isDark ? DarkAppColors.textMuted : AppColors.textMuted;

    return Row(
      children: [
        if (requirement.isMet)
          Icon(
            Icons.check_circle,
            size: 18,
            color: metColor,
          )
        else
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: unmetColor, width: 1.5),
            ),
          ),
        const SizedBox(width: AppSpacing.spacing2),
        Text(
          requirement.label,
          style: AppTypography.bodySm.copyWith(
            color: requirement.isMet ? metColor : unmetColor,
          ),
        ),
      ],
    );
  }
}

/// Simple password strength bar (inline version)
class PasswordStrengthBar extends StatelessWidget {
  final PasswordStrength strength;

  const PasswordStrengthBar({
    super.key,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final inactiveColor = isDark ? DarkAppColors.borderDefault : AppColors.neutral200;

    final int level = switch (strength) {
      PasswordStrength.weak => 1,
      PasswordStrength.fair => 2,
      PasswordStrength.medium => 3,
      PasswordStrength.good => 4,
      PasswordStrength.strong => 5,
    };

    final Color activeColor = switch (strength) {
      PasswordStrength.weak => AppColors.error500,
      PasswordStrength.fair => AppColors.warning500,
      PasswordStrength.medium => AppColors.warning500,
      PasswordStrength.good => AppColors.info500,
      PasswordStrength.strong => AppColors.success500,
    };

    return Row(
      children: [
        Text(
          'Password Strength',
          style: AppTypography.labelXs.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          ),
        ),
        const SizedBox(width: AppSpacing.spacing2),
        Expanded(
          child: Row(
            children: [
              for (int i = 0; i < 5; i++) ...[
                Expanded(
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: AppBorderRadius.full,
                      color: i < level ? activeColor : inactiveColor,
                    ),
                  ),
                ),
                if (i < 4) const SizedBox(width: AppSpacing.spacing1),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
