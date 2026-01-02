import 'package:flutter/material.dart';

/// Animation durations and curves for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppDurations {
  AppDurations._();

  // ============================================
  // DURATION CONSTANTS
  // ============================================

  /// Fast: 150ms - Small interactions (button press, icon change)
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal: 200ms - Standard transitions (hover states, focus)
  static const Duration normal = Duration(milliseconds: 200);

  /// Slow: 300ms - Page transitions, modals
  static const Duration slow = Duration(milliseconds: 300);

  /// Slower: 500ms - Complex animations
  static const Duration slower = Duration(milliseconds: 500);

  // ============================================
  // SPECIFIC USE CASES
  // ============================================

  /// Button press feedback
  static const Duration buttonPress = fast;

  /// Hover state transition
  static const Duration hover = normal;

  /// Modal entry/exit
  static const Duration modal = slow;

  /// Page transition
  static const Duration pageTransition = slow;

  /// Loading spinner rotation
  static const Duration spinner = Duration(milliseconds: 800);

  /// Toast notification slide
  static const Duration toast = slow;

  /// Toast auto-dismiss delay
  static const Duration toastAutoDismiss = Duration(seconds: 5);

  /// Success confirmation display
  static const Duration successDisplay = Duration(seconds: 3);

  /// Skeleton shimmer animation
  static const Duration shimmer = Duration(milliseconds: 1500);

  /// Pull to refresh trigger
  static const Duration pullToRefresh = normal;

  /// Stagger delay for list items
  static const Duration staggerDelay = Duration(milliseconds: 50);

  /// Debounce delay for search input
  static const Duration debounceSearch = slow;
}

/// Animation curves for GYMBRO app
/// Standard easing functions for smooth, natural motion
class AppCurves {
  AppCurves._();

  // ============================================
  // STANDARD CURVES
  // ============================================

  /// Standard ease - Most transitions
  /// cubic-bezier(0.4, 0.0, 0.2, 1)
  static const Curve standard = Curves.easeInOut;

  /// Ease out - Entering elements
  /// cubic-bezier(0.0, 0.0, 0.2, 1)
  static const Curve easeOut = Curves.easeOut;

  /// Ease in - Exiting elements
  /// cubic-bezier(0.4, 0.0, 1, 1)
  static const Curve easeIn = Curves.easeIn;

  /// Bounce - Success states, playful interactions
  /// cubic-bezier(0.68, -0.55, 0.265, 1.55)
  static const Curve bounce = Curves.elasticOut;

  /// Decelerate - For elements entering view
  static const Curve decelerate = Curves.decelerate;

  /// Fast out slow in - Material Design standard
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  // ============================================
  // SPECIFIC USE CASES
  // ============================================

  /// Button press animation
  static const Curve buttonPress = easeOut;

  /// Modal fade in
  static const Curve modalIn = easeOut;

  /// Modal fade out
  static const Curve modalOut = easeIn;

  /// Page slide in
  static const Curve pageIn = fastOutSlowIn;

  /// Page slide out
  static const Curve pageOut = easeIn;

  /// Card hover lift
  static const Curve cardHover = easeOut;

  /// Toast slide in
  static const Curve toastIn = easeOut;

  /// Toast slide out
  static const Curve toastOut = easeIn;

  /// Success checkmark draw
  static const Curve successDraw = easeOut;

  /// Error shake
  static const Curve errorShake = Curves.elasticIn;

  /// Pull to refresh
  static const Curve pullRefresh = easeOut;

  /// List item stagger
  static const Curve listStagger = decelerate;
}

/// Animation presets combining duration and curve
class AppAnimations {
  AppAnimations._();

  // ============================================
  // PRESET ANIMATIONS
  // ============================================

  /// Button press feedback
  static const AnimationPreset buttonPress = AnimationPreset(
    duration: AppDurations.buttonPress,
    curve: AppCurves.buttonPress,
  );

  /// Hover state transition
  static const AnimationPreset hover = AnimationPreset(
    duration: AppDurations.hover,
    curve: AppCurves.standard,
  );

  /// Modal entry
  static const AnimationPreset modalEntry = AnimationPreset(
    duration: AppDurations.modal,
    curve: AppCurves.modalIn,
  );

  /// Modal exit
  static const AnimationPreset modalExit = AnimationPreset(
    duration: AppDurations.modal,
    curve: AppCurves.modalOut,
  );

  /// Page transition forward
  static const AnimationPreset pageForward = AnimationPreset(
    duration: AppDurations.pageTransition,
    curve: AppCurves.pageIn,
  );

  /// Page transition back
  static const AnimationPreset pageBack = AnimationPreset(
    duration: AppDurations.pageTransition,
    curve: AppCurves.pageOut,
  );

  /// Card hover lift
  static const AnimationPreset cardHover = AnimationPreset(
    duration: AppDurations.hover,
    curve: AppCurves.cardHover,
  );

  /// Toast notification
  static const AnimationPreset toast = AnimationPreset(
    duration: AppDurations.toast,
    curve: AppCurves.toastIn,
  );

  /// Fade content
  static const AnimationPreset fade = AnimationPreset(
    duration: AppDurations.normal,
    curve: AppCurves.standard,
  );
}

/// Animation preset combining duration and curve
class AnimationPreset {
  final Duration duration;
  final Curve curve;

  const AnimationPreset({
    required this.duration,
    required this.curve,
  });
}
