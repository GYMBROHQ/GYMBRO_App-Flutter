import 'package:flutter/material.dart';

/// Spacing system for GYMBRO app
/// Based on a 4px base unit for consistency
/// All spacing values are multiples of 4px
class AppSpacing {
  AppSpacing._();

  /// Base spacing unit: 4px
  static const double base = 4.0;

  // ============================================
  // SPACING SCALE
  // ============================================

  /// 4px (0.25rem)
  static const double spacing1 = 4.0;

  /// 8px (0.5rem)
  static const double spacing2 = 8.0;

  /// 12px (0.75rem)
  static const double spacing3 = 12.0;

  /// 16px (1rem)
  static const double spacing4 = 16.0;

  /// 20px (1.25rem)
  static const double spacing5 = 20.0;

  /// 24px (1.5rem)
  static const double spacing6 = 24.0;

  /// 32px (2rem)
  static const double spacing8 = 32.0;

  /// 40px (2.5rem)
  static const double spacing10 = 40.0;

  /// 48px (3rem)
  static const double spacing12 = 48.0;

  /// 64px (4rem)
  static const double spacing16 = 64.0;

  /// 80px (5rem)
  static const double spacing20 = 80.0;

  /// 96px (6rem)
  static const double spacing24 = 96.0;

  // ============================================
  // SEMANTIC SPACING (Common use cases)
  // ============================================

  /// Inline elements gap: 8px
  static const double gapInline = spacing2;

  /// Form fields gap: 16px
  static const double gapFormField = spacing4;

  /// Card grid gap: 16-24px
  static const double gapCardGrid = spacing4;

  /// List item spacing: 16px
  static const double gapListItem = spacing4;

  /// Content block spacing: 32px
  static const double gapContentBlock = spacing8;

  /// Section spacing: 48-64px
  static const double gapSection = spacing12;

  // ============================================
  // COMPONENT PADDING
  // ============================================

  /// Button padding vertical: 12px
  static const double paddingButtonVertical = spacing3;

  /// Button padding horizontal: 24px
  static const double paddingButtonHorizontal = spacing6;

  /// Card padding: 16-24px
  static const double paddingCard = spacing4;

  /// Card padding large: 24px
  static const double paddingCardLg = spacing6;

  /// Modal padding: 24-32px
  static const double paddingModal = spacing6;

  /// Modal padding large: 32px
  static const double paddingModalLg = spacing8;

  /// Input padding: 12px vertical, 16px horizontal
  static const double paddingInputVertical = spacing3;
  static const double paddingInputHorizontal = spacing4;

  // ============================================
  // LAYOUT MARGINS
  // ============================================

  /// Mobile screen margin: 16px
  static const double marginScreenMobile = spacing4;

  /// Tablet screen margin: 24px
  static const double marginScreenTablet = spacing6;

  /// Desktop screen margin: 32px
  static const double marginScreenDesktop = spacing8;

  // ============================================
  // EDGEINSETS HELPERS
  // ============================================

  /// All sides: 4px
  static const EdgeInsets all1 = EdgeInsets.all(spacing1);

  /// All sides: 8px
  static const EdgeInsets all2 = EdgeInsets.all(spacing2);

  /// All sides: 12px
  static const EdgeInsets all3 = EdgeInsets.all(spacing3);

  /// All sides: 16px
  static const EdgeInsets all4 = EdgeInsets.all(spacing4);

  /// All sides: 20px
  static const EdgeInsets all5 = EdgeInsets.all(spacing5);

  /// All sides: 24px
  static const EdgeInsets all6 = EdgeInsets.all(spacing6);

  /// All sides: 32px
  static const EdgeInsets all8 = EdgeInsets.all(spacing8);

  /// Horizontal: 16px
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: spacing4);

  /// Horizontal: 24px
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: spacing6);

  /// Vertical: 16px
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: spacing4);

  /// Vertical: 24px
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: spacing6);

  /// Button padding: 12px vertical, 24px horizontal
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: paddingButtonVertical,
    horizontal: paddingButtonHorizontal,
  );

  /// Card padding: 16px
  static const EdgeInsets cardPadding = EdgeInsets.all(paddingCard);

  /// Card padding large: 24px
  static const EdgeInsets cardPaddingLg = EdgeInsets.all(paddingCardLg);

  /// Modal padding: 24px
  static const EdgeInsets modalPadding = EdgeInsets.all(paddingModal);

  /// Input padding: 12px vertical, 16px horizontal
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    vertical: paddingInputVertical,
    horizontal: paddingInputHorizontal,
  );

  /// Screen padding mobile: 16px horizontal
  static const EdgeInsets screenPaddingMobile = EdgeInsets.symmetric(
    horizontal: marginScreenMobile,
  );

  /// Screen padding tablet: 24px horizontal
  static const EdgeInsets screenPaddingTablet = EdgeInsets.symmetric(
    horizontal: marginScreenTablet,
  );

  /// Screen padding desktop: 32px horizontal
  static const EdgeInsets screenPaddingDesktop = EdgeInsets.symmetric(
    horizontal: marginScreenDesktop,
  );
}
