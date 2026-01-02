import 'package:flutter/material.dart';

/// Border radius constants for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppRadius {
  AppRadius._();

  // ============================================
  // RADIUS VALUES
  // ============================================

  /// No rounding: 0px (Sharp corners)
  static const double none = 0.0;

  /// Small: 4px (Subtle rounding - tags, badges)
  static const double sm = 4.0;

  /// Medium: 8px (Standard - buttons, inputs, cards)
  static const double md = 8.0;

  /// Large: 12px (Prominent - modals, large cards)
  static const double lg = 12.0;

  /// Extra Large: 16px (Extra prominent - featured elements)
  static const double xl = 16.0;

  /// 2XL: 24px (Hero sections, special components)
  static const double xxl = 24.0;

  /// Full: 9999px (Pills, avatars, rounded buttons)
  static const double full = 9999.0;

  // ============================================
  // COMMON USE CASES
  // ============================================

  /// Button radius: 8px
  static const double button = md;

  /// Input field radius: 8px
  static const double input = md;

  /// Card radius: 12px
  static const double card = lg;

  /// Modal radius: 16px
  static const double modal = xl;

  /// Avatar radius: Full circle
  static const double avatar = full;

  /// Badge radius: Full (pill shape) or small
  static const double badgePill = full;
  static const double badgeSquare = sm;

  /// Bottom sheet radius (top corners only): 16px
  static const double bottomSheet = xl;
}

/// BorderRadius helper class for common shapes
class AppBorderRadius {
  AppBorderRadius._();

  // ============================================
  // ALL CORNERS
  // ============================================

  /// No rounding
  static BorderRadius get none => BorderRadius.zero;

  /// Small: 4px all corners
  static BorderRadius get sm => BorderRadius.circular(AppRadius.sm);

  /// Medium: 8px all corners
  static BorderRadius get md => BorderRadius.circular(AppRadius.md);

  /// Large: 12px all corners
  static BorderRadius get lg => BorderRadius.circular(AppRadius.lg);

  /// Extra Large: 16px all corners
  static BorderRadius get xl => BorderRadius.circular(AppRadius.xl);

  /// 2XL: 24px all corners
  static BorderRadius get xxl => BorderRadius.circular(AppRadius.xxl);

  /// Full: Circular (for pills, avatars)
  static BorderRadius get full => BorderRadius.circular(AppRadius.full);

  // ============================================
  // COMPONENT-SPECIFIC
  // ============================================

  /// Button: 8px all corners
  static BorderRadius get button => BorderRadius.circular(AppRadius.button);

  /// Input: 8px all corners
  static BorderRadius get input => BorderRadius.circular(AppRadius.input);

  /// Card: 12px all corners
  static BorderRadius get card => BorderRadius.circular(AppRadius.card);

  /// Modal: 16px all corners
  static BorderRadius get modal => BorderRadius.circular(AppRadius.modal);

  /// Avatar: Circular
  static BorderRadius get avatar => BorderRadius.circular(AppRadius.avatar);

  /// Badge pill: Circular
  static BorderRadius get badgePill => BorderRadius.circular(AppRadius.badgePill);

  /// Badge square: 4px all corners
  static BorderRadius get badgeSquare => BorderRadius.circular(AppRadius.badgeSquare);

  // ============================================
  // PARTIAL CORNERS
  // ============================================

  /// Bottom sheet: 16px top corners only
  static BorderRadius get bottomSheet => const BorderRadius.only(
        topLeft: Radius.circular(AppRadius.bottomSheet),
        topRight: Radius.circular(AppRadius.bottomSheet),
      );

  /// Card with image at top: 12px top corners only
  static BorderRadius get cardTop => const BorderRadius.only(
        topLeft: Radius.circular(AppRadius.card),
        topRight: Radius.circular(AppRadius.card),
      );

  /// Card with image at bottom: 12px bottom corners only
  static BorderRadius get cardBottom => const BorderRadius.only(
        bottomLeft: Radius.circular(AppRadius.card),
        bottomRight: Radius.circular(AppRadius.card),
      );
}
