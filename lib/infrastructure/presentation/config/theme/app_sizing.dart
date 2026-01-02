/// Component sizing constants for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppSizing {
  AppSizing._();
}

/// Button size configurations
class AppButtonSizes {
  AppButtonSizes._();

  // ============================================
  // BUTTON HEIGHTS
  // ============================================

  /// XS: 28px height, 12px padding
  static const double heightXs = 28.0;
  static const double paddingXs = 12.0;

  /// SM: 36px height, 14px padding (Dense layouts, secondary actions)
  static const double heightSm = 36.0;
  static const double paddingSm = 14.0;

  /// MD: 44px height, 16px padding (Default - Standard mobile touch target)
  static const double heightMd = 44.0;
  static const double paddingMd = 16.0;

  /// LG: 52px height, 20px padding (Primary CTAs, prominent actions)
  static const double heightLg = 52.0;
  static const double paddingLg = 20.0;

  /// XL: 60px height, 24px padding
  static const double heightXl = 60.0;
  static const double paddingXl = 24.0;

  // ============================================
  // ICON BUTTON SIZES
  // ============================================

  /// Icon button: 44x44px (minimum touch target)
  static const double iconButton = 44.0;

  /// Icon button small: 36x36px
  static const double iconButtonSm = 36.0;

  /// Icon size inside buttons: 24px (md), 20px (sm)
  static const double buttonIconMd = 24.0;
  static const double buttonIconSm = 20.0;

  /// Gap between icon and text: 8px
  static const double iconTextGap = 8.0;
}

/// Input/form element size configurations
class AppInputSizes {
  AppInputSizes._();

  // ============================================
  // INPUT HEIGHTS
  // ============================================

  /// SM: 36px height
  static const double heightSm = 36.0;

  /// MD: 44px height (Default)
  static const double heightMd = 44.0;

  /// LG: 52px height
  static const double heightLg = 52.0;

  // ============================================
  // TEXTAREA
  // ============================================

  /// Minimum height for textarea: 88px (3 lines)
  static const double textareaMinHeight = 88.0;

  // ============================================
  // CHECKBOX & RADIO
  // ============================================

  /// Checkbox/Radio size: 20x20px
  static const double checkboxSize = 20.0;
  static const double radioSize = 20.0;

  /// Radio inner dot: 10px
  static const double radioInnerDot = 10.0;

  /// Label margin from checkbox/radio: 8px
  static const double labelMargin = 8.0;

  // ============================================
  // TOGGLE SWITCH
  // ============================================

  /// Toggle switch width: 44px
  static const double toggleWidth = 44.0;

  /// Toggle switch height: 24px
  static const double toggleHeight = 24.0;

  /// Toggle knob size: 20px
  static const double toggleKnob = 20.0;

  // ============================================
  // DROPDOWN
  // ============================================

  /// Dropdown panel max height: 320px
  static const double dropdownMaxHeight = 320.0;

  /// Dropdown option height: 44px
  static const double dropdownOptionHeight = 44.0;

  // ============================================
  // ICONS IN INPUTS
  // ============================================

  /// Leading/trailing icon size: 20px
  static const double inputIconSize = 20.0;

  /// Leading icon left padding: 44px (to account for icon + spacing)
  static const double leadingIconPadding = 44.0;

  /// Icon offset from edge: 12px
  static const double iconOffset = 12.0;
}

/// Avatar size configurations
class AppAvatarSizes {
  AppAvatarSizes._();

  /// XS: 24px
  static const double xs = 24.0;

  /// SM: 32px
  static const double sm = 32.0;

  /// MD: 40px (Default)
  static const double md = 40.0;

  /// LG: 48px
  static const double lg = 48.0;

  /// XL: 64px
  static const double xl = 64.0;

  /// 2XL: 96px
  static const double xxl = 96.0;
}

/// Icon size configurations
class AppIconSizes {
  AppIconSizes._();

  /// XS: 16px (Inline with small text)
  static const double xs = 16.0;

  /// SM: 20px (Inline with body text)
  static const double sm = 20.0;

  /// MD: 24px (Standard UI elements)
  static const double md = 24.0;

  /// LG: 32px (Section headers, empty states)
  static const double lg = 32.0;

  /// XL: 48px (Large empty states, features)
  static const double xl = 48.0;

  /// 2XL: 64px (Hero sections, major states)
  static const double xxl = 64.0;

  /// Default stroke width for icons: 2px
  static const double strokeWidth = 2.0;
}

/// Touch target and accessibility sizes
class AppTouchTargets {
  AppTouchTargets._();

  /// Minimum touch target: 44x44px (iOS HIG, WCAG 2.1 AAA)
  static const double minimum = 44.0;

  /// Recommended touch target: 48x48px (Material Design)
  static const double recommended = 48.0;

  /// Minimum spacing between touch targets: 8px
  static const double minimumSpacing = 8.0;
}

/// Navigation component sizes
class AppNavigationSizes {
  AppNavigationSizes._();

  // ============================================
  // MOBILE BOTTOM NAVIGATION
  // ============================================

  /// Bottom nav height (with safe area): 64px
  static const double bottomNavHeight = 64.0;

  /// Tab item icon size: 24px
  static const double bottomNavIcon = 24.0;

  /// Tab item label size: 12px (caption)
  static const double bottomNavLabel = 12.0;

  // ============================================
  // MOBILE TOP NAVIGATION (Header)
  // ============================================

  /// Header height (plus safe area): 56px
  static const double headerHeight = 56.0;

  /// Header button size: 44x44px
  static const double headerButtonSize = 44.0;

  // ============================================
  // SIDEBAR NAVIGATION (Desktop)
  // ============================================

  /// Sidebar expanded width: 240px
  static const double sidebarExpandedWidth = 240.0;

  /// Sidebar collapsed width: 64px
  static const double sidebarCollapsedWidth = 64.0;

  /// Sidebar item height: 44px
  static const double sidebarItemHeight = 44.0;
}

/// Modal and dialog sizes
class AppModalSizes {
  AppModalSizes._();

  /// Modal max width: 480px
  static const double maxWidth = 480.0;

  /// Modal mobile width: 90% of screen (handled dynamically)
  static const double mobileWidthFraction = 0.9;

  /// Bottom sheet handle width: 32px
  static const double bottomSheetHandleWidth = 32.0;

  /// Bottom sheet handle height: 4px
  static const double bottomSheetHandleHeight = 4.0;
}

/// Card component sizes
class AppCardSizes {
  AppCardSizes._();

  /// Gym card min height: 320px
  static const double gymCardMinHeight = 320.0;

  /// Gym card image aspect ratio: 16:9
  static const double gymCardImageAspectRatio = 16 / 9;
}

/// QR code display sizes
class AppQrCodeSizes {
  AppQrCodeSizes._();

  /// QR code max size: 400x400px
  static const double maxSize = 400.0;

  /// QR code as fraction of screen width: 70%
  static const double screenWidthFraction = 0.7;

  /// QR code border padding: 8px
  static const double borderPadding = 8.0;

  /// QR scanner viewfinder: 280x280px
  static const double scannerViewfinder = 280.0;

  /// QR scanner border width: 4px
  static const double scannerBorderWidth = 4.0;
}

/// Badge and tag sizes
class AppBadgeSizes {
  AppBadgeSizes._();

  /// Count badge diameter: 20px
  static const double countBadge = 20.0;

  /// Status badge padding: 4px vertical, 12px horizontal
  static const double statusBadgePaddingV = 4.0;
  static const double statusBadgePaddingH = 12.0;

  /// Feature badge padding: 2px vertical, 8px horizontal
  static const double featureBadgePaddingV = 2.0;
  static const double featureBadgePaddingH = 8.0;
}

/// List and table sizes
class AppListSizes {
  AppListSizes._();

  /// List item min height: 64px
  static const double listItemMinHeight = 64.0;

  /// List item leading element (icon/avatar): 40px
  static const double listItemLeading = 40.0;

  /// Table header height: 44px
  static const double tableHeaderHeight = 44.0;

  /// Table row height: 56px
  static const double tableRowHeight = 56.0;
}

/// Loading and feedback component sizes
class AppFeedbackSizes {
  AppFeedbackSizes._();

  /// Loading spinner inline: 20px
  static const double spinnerInline = 20.0;

  /// Loading spinner screen: 40px
  static const double spinnerScreen = 40.0;

  /// Loading spinner full page: 64px
  static const double spinnerFullPage = 64.0;

  /// Progress bar height: 8px
  static const double progressBarHeight = 8.0;

  /// Toast min width: 320px
  static const double toastMinWidth = 320.0;

  /// Toast max width: 480px
  static const double toastMaxWidth = 480.0;

  /// Empty state icon size: 64px
  static const double emptyStateIcon = 64.0;
}

/// Content container sizes
class AppContentSizes {
  AppContentSizes._();

  /// Max content width: 1440px
  static const double maxContentWidth = 1440.0;
}
