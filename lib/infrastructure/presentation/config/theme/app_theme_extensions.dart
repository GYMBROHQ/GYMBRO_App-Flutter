import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Theme extensions for easier access to theme-aware colors
///
/// Usage:
/// ```dart
/// final theme = Theme.of(context);
/// Container(
///   color: theme.cardSurface,  // Automatically adapts to light/dark mode
///   child: Text(
///     'Hello',
///     style: TextStyle(color: theme.mutedText),
///   ),
/// )
/// ```
extension ThemeExtensions on ThemeData {
  /// Returns true if the current theme is dark mode
  bool get isDark => brightness == Brightness.dark;

  // ============================================
  // SURFACE COLORS
  // ============================================

  /// Standard card surface color
  /// - Light: White
  /// - Dark: surfaceElevated1 (slightly elevated from background)
  Color get cardSurface => isDark ? DarkAppColors.surfaceElevated1 : AppColors.white;

  /// Elevated card surface color (for cards within cards or emphasized elements)
  /// - Light: White
  /// - Dark: surfaceElevated2 (more elevated)
  Color get cardSurfaceElevated => isDark ? DarkAppColors.surfaceElevated2 : AppColors.white;

  // ============================================
  // TEXT COLORS
  // ============================================

  /// Muted text color for labels, captions, and secondary information
  /// - Light: neutral500 (medium gray)
  /// - Dark: textMuted (lighter gray for readability)
  Color get mutedText => isDark ? DarkAppColors.textMuted : AppColors.textMuted;

  /// Secondary text color for less important content
  /// - Light: neutral700
  /// - Dark: textSecondary
  Color get secondaryText => isDark ? DarkAppColors.textSecondary : AppColors.textSecondary;

  // ============================================
  // BORDER COLORS
  // ============================================

  /// Subtle border color for minimal visual separation
  /// - Light: neutral100 (very light gray)
  /// - Dark: borderDefault (darker gray)
  Color get subtleBorder => isDark ? DarkAppColors.borderDefault : AppColors.neutral100;

  /// Default border color for standard borders
  /// - Light: borderDefault (neutral300)
  /// - Dark: borderDefault (lighter in dark mode)
  Color get defaultBorder => isDark ? DarkAppColors.borderDefault : AppColors.borderDefault;

  // ============================================
  // ICON COLORS
  // ============================================

  /// Muted icon color for non-interactive or secondary icons
  /// - Light: neutral400 (light gray)
  /// - Dark: neutral500 (medium gray, lighter than light mode for visibility)
  Color get iconMuted => isDark ? DarkAppColors.neutral500 : AppColors.neutral400;

  /// Primary icon color that adapts to theme
  /// - Light: Primary brand color
  /// - Dark: Light text color for visibility
  Color get iconPrimary => isDark ? DarkAppColors.textPrimary : colorScheme.primary;
}
