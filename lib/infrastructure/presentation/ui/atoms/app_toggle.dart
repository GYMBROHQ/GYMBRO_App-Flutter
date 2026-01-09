import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// A custom toggle switch component that follows the app's design system
class AppToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  const AppToggle({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Switch(
      value: value,
      onChanged: enabled ? onChanged : null,
      activeThumbColor: Colors.white,
      activeTrackColor: theme.colorScheme.primary,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: isDark
          ? DarkAppColors.surfaceElevated2
          : AppColors.neutral200,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
