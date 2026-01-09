import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Type of trailing widget for settings items
enum SettingsItemType {
  navigation, // Shows chevron_right icon
  toggle, // Shows a toggle switch
  externalLink, // Shows open_in_new icon
  valueWithNavigation, // Shows a value text and chevron_right
}

/// A list item component for settings pages with support for various trailing widgets
class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final SettingsItemType type;
  final VoidCallback? onTap;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggleChanged;
  final String? valueText;

  const SettingsListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.type = SettingsItemType.navigation,
    this.onTap,
    this.toggleValue,
    this.onToggleChanged,
    this.valueText,
  }) : assert(
          type != SettingsItemType.toggle ||
              (toggleValue != null && onToggleChanged != null),
          'toggleValue and onToggleChanged must be provided for toggle type',
        ),
        assert(
          type != SettingsItemType.valueWithNavigation || valueText != null,
          'valueText must be provided for valueWithNavigation type',
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final content = Container(
      padding: EdgeInsets.all(AppSpacing.spacing3),
      decoration: BoxDecoration(
        color: theme.cardSurface,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDark
                  ? DarkAppColors.surfaceElevated2
                  : AppColors.primary50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 20,
              color: isDark ? Colors.white : theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 14),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: AppTypography.labelSm.copyWith(
                      color: theme.mutedText,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Trailing widget based on type
          _buildTrailing(context, theme, isDark),
        ],
      ),
    );

    // Only wrap with gesture detector for non-toggle items
    if (type == SettingsItemType.toggle) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppBorderRadius.lg,
        child: content,
      ),
    );
  }

  Widget _buildTrailing(BuildContext context, ThemeData theme, bool isDark) {
    switch (type) {
      case SettingsItemType.navigation:
        return Icon(
          Icons.chevron_right,
          size: 20,
          color: theme.iconMuted,
        );
      case SettingsItemType.toggle:
        return AppToggle(
          value: toggleValue!,
          onChanged: onToggleChanged,
        );
      case SettingsItemType.externalLink:
        return Icon(
          Icons.open_in_new,
          size: 20,
          color: theme.iconMuted,
        );
      case SettingsItemType.valueWithNavigation:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              valueText!,
              style: AppTypography.labelSm.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.mutedText,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: theme.iconMuted,
            ),
          ],
        );
    }
  }
}
