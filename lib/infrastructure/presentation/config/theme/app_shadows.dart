import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Shadow/elevation system for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppShadows {
  AppShadows._();

  // ============================================
  // ELEVATION SHADOWS
  // ============================================

  /// XS (Subtle): For inputs, small buttons
  /// box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05)
  static List<BoxShadow> get xs => [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: AppColors.black.withValues(alpha: 0.05),
        ),
      ];

  /// SM (Light): For cards at rest, dropdowns
  /// box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06)
  static List<BoxShadow> get sm => [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 3,
          color: AppColors.black.withValues(alpha: 0.1),
        ),
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: AppColors.black.withValues(alpha: 0.06),
        ),
      ];

  /// MD (Medium): For elevated cards, hover states
  /// box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07), 0 2px 4px rgba(0, 0, 0, 0.06)
  static List<BoxShadow> get md => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          color: AppColors.black.withValues(alpha: 0.07),
        ),
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 4,
          color: AppColors.black.withValues(alpha: 0.06),
        ),
      ];

  /// LG (Large): For modals, popovers, sticky headers
  /// box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05)
  static List<BoxShadow> get lg => [
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 15,
          color: AppColors.black.withValues(alpha: 0.1),
        ),
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          color: AppColors.black.withValues(alpha: 0.05),
        ),
      ];

  /// XL (Extra Large): For overlays, prominent dialogs
  /// box-shadow: 0 20px 25px rgba(0, 0, 0, 0.1), 0 10px 10px rgba(0, 0, 0, 0.04)
  static List<BoxShadow> get xl => [
        BoxShadow(
          offset: const Offset(0, 20),
          blurRadius: 25,
          color: AppColors.black.withValues(alpha: 0.1),
        ),
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 10,
          color: AppColors.black.withValues(alpha: 0.04),
        ),
      ];

  /// 2XL (Maximum): For full-screen modals, critical alerts
  /// box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15)
  static List<BoxShadow> get xxl => [
        BoxShadow(
          offset: const Offset(0, 25),
          blurRadius: 50,
          color: AppColors.black.withValues(alpha: 0.15),
        ),
      ];

  /// Inner shadow: For pressed states, inset elements
  /// Note: Flutter doesn't support inset shadows directly.
  /// Use with Container decoration or custom paint for inset effect.
  /// CSS equivalent: box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.06)
  static List<BoxShadow> get inner => [
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 4,
          color: AppColors.black.withValues(alpha: 0.06),
        ),
      ];

  // ============================================
  // FOCUS RING SHADOWS
  // ============================================

  /// Primary focus ring: Blue
  /// box-shadow: 0 0 0 3px rgba(0, 102, 255, 0.2)
  static List<BoxShadow> get focusPrimary => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: AppColors.primary500.withValues(alpha: 0.2),
        ),
      ];

  /// Error focus ring: Red
  /// box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.2)
  static List<BoxShadow> get focusError => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: AppColors.error500.withValues(alpha: 0.2),
        ),
      ];

  /// Success focus ring: Green
  /// box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2)
  static List<BoxShadow> get focusSuccess => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: AppColors.success500.withValues(alpha: 0.2),
        ),
      ];

  // ============================================
  // COMPONENT-SPECIFIC SHADOWS
  // ============================================

  /// Card shadow at rest
  static List<BoxShadow> get card => sm;

  /// Card shadow on hover
  static List<BoxShadow> get cardHover => md;

  /// Modal shadow
  static List<BoxShadow> get modal => xxl;

  /// Dropdown shadow
  static List<BoxShadow> get dropdown => lg;

  /// Button shadow
  static List<BoxShadow> get button => sm;

  /// Bottom navigation shadow (upward)
  static List<BoxShadow> get bottomNav => [
        BoxShadow(
          offset: const Offset(0, -10),
          blurRadius: 15,
          color: AppColors.black.withValues(alpha: 0.1),
        ),
        BoxShadow(
          offset: const Offset(0, -4),
          blurRadius: 6,
          color: AppColors.black.withValues(alpha: 0.05),
        ),
      ];

  /// Toast notification shadow
  static List<BoxShadow> get toast => xl;
}

/// Dark mode shadow adjustments
/// Shadows in dark mode use slightly different opacities
class DarkAppShadows {
  DarkAppShadows._();

  static List<BoxShadow> get xs => [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: DarkAppColors.black.withValues(alpha: 0.2),
        ),
      ];

  static List<BoxShadow> get sm => [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 3,
          color: DarkAppColors.black.withValues(alpha: 0.3),
        ),
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          color: DarkAppColors.black.withValues(alpha: 0.2),
        ),
      ];

  static List<BoxShadow> get md => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          color: DarkAppColors.black.withValues(alpha: 0.25),
        ),
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 4,
          color: DarkAppColors.black.withValues(alpha: 0.2),
        ),
      ];

  static List<BoxShadow> get lg => [
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 15,
          color: DarkAppColors.black.withValues(alpha: 0.3),
        ),
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 6,
          color: DarkAppColors.black.withValues(alpha: 0.2),
        ),
      ];

  static List<BoxShadow> get xl => [
        BoxShadow(
          offset: const Offset(0, 20),
          blurRadius: 25,
          color: DarkAppColors.black.withValues(alpha: 0.35),
        ),
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 10,
          color: DarkAppColors.black.withValues(alpha: 0.2),
        ),
      ];

  static List<BoxShadow> get xxl => [
        BoxShadow(
          offset: const Offset(0, 25),
          blurRadius: 50,
          color: DarkAppColors.black.withValues(alpha: 0.4),
        ),
      ];

  /// Focus rings use the dark mode primary colors
  static List<BoxShadow> get focusPrimary => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: DarkAppColors.primary500.withValues(alpha: 0.3),
        ),
      ];

  static List<BoxShadow> get focusError => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: DarkAppColors.error500.withValues(alpha: 0.3),
        ),
      ];

  static List<BoxShadow> get focusSuccess => [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 0,
          spreadRadius: 3,
          color: DarkAppColors.success500.withValues(alpha: 0.3),
        ),
      ];
}
