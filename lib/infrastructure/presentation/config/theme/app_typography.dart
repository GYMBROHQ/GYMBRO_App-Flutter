import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography system for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppTypography {
  AppTypography._();

  // ============================================
  // FONT FAMILIES
  // ============================================

  /// Primary font family with system fallbacks
  static const String fontFamily = 'Inter';

  /// Fallback font stack for system fonts
  static const List<String> fontFamilyFallback = [
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Monospace font for codes and data
  static const String fontFamilyMono = 'SF Mono';
  static const List<String> fontFamilyMonoFallback = [
    'Monaco',
    'Courier New',
    'monospace',
  ];

  // ============================================
  // FONT WEIGHTS
  // ============================================
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemibold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // ============================================
  // DISPLAY STYLES (Landing pages, success/error screens, empty states)
  // ============================================

  /// Display XL: 48px / 56px line-height, Bold
  static TextStyle get displayXl => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 48,
        height: 56 / 48, // 1.167
        fontWeight: weightBold,
        color: AppColors.textPrimary,
      );

  /// Display LG: 40px / 48px line-height, Bold
  static TextStyle get displayLg => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 40,
        height: 48 / 40, // 1.2
        fontWeight: weightBold,
        color: AppColors.textPrimary,
      );

  /// Display MD: 32px / 40px line-height, Bold
  static TextStyle get displayMd => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 32,
        height: 40 / 32, // 1.25
        fontWeight: weightBold,
        color: AppColors.textPrimary,
      );

  /// Display SM: 28px / 36px line-height, Semibold
  static TextStyle get displaySm => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 28,
        height: 36 / 28, // 1.286
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  // ============================================
  // HEADING STYLES
  // ============================================

  /// H1: 28px / 36px line-height, Bold
  static TextStyle get h1 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 28,
        height: 36 / 28, // 1.286
        fontWeight: weightBold,
        color: AppColors.textPrimary,
      );

  /// H2: 24px / 32px line-height, Semibold
  static TextStyle get h2 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 24,
        height: 32 / 24, // 1.333
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  /// H3: 20px / 28px line-height, Semibold
  static TextStyle get h3 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 20,
        height: 28 / 20, // 1.4
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  /// H4: 18px / 26px line-height, Semibold
  static TextStyle get h4 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 18,
        height: 26 / 18, // 1.444
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  /// H5: 16px / 24px line-height, Semibold
  static TextStyle get h5 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 16,
        height: 24 / 16, // 1.5
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  /// H6: 14px / 20px line-height, Semibold
  static TextStyle get h6 => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 14,
        height: 20 / 14, // 1.429
        fontWeight: weightSemibold,
        color: AppColors.textPrimary,
      );

  // ============================================
  // BODY STYLES
  // ============================================

  /// Body LG: 18px / 28px line-height, Regular
  static TextStyle get bodyLg => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 18,
        height: 28 / 18, // 1.556
        fontWeight: weightRegular,
        color: AppColors.textSecondary,
      );

  /// Body MD: 16px / 24px line-height, Regular (Default body text)
  static TextStyle get bodyMd => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 16,
        height: 24 / 16, // 1.5
        fontWeight: weightRegular,
        color: AppColors.textSecondary,
      );

  /// Body SM: 14px / 20px line-height, Regular
  static TextStyle get bodySm => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 14,
        height: 20 / 14, // 1.429
        fontWeight: weightRegular,
        color: AppColors.textSecondary,
      );

  /// Body XS: 12px / 18px line-height, Regular
  static TextStyle get bodyXs => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 12,
        height: 18 / 12, // 1.5
        fontWeight: weightRegular,
        color: AppColors.textSecondary,
      );

  // ============================================
  // LABEL STYLES (UI labels, form labels)
  // ============================================

  /// Label LG: 14px / 20px line-height, Medium
  static TextStyle get labelLg => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 14,
        height: 20 / 14, // 1.429
        fontWeight: weightMedium,
        color: AppColors.textPrimary,
      );

  /// Label MD: 13px / 18px line-height, Medium
  static TextStyle get labelMd => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 13,
        height: 18 / 13, // 1.385
        fontWeight: weightMedium,
        color: AppColors.textPrimary,
      );

  /// Label SM: 12px / 16px line-height, Medium
  static TextStyle get labelSm => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 12,
        height: 16 / 12, // 1.333
        fontWeight: weightMedium,
        color: AppColors.textPrimary,
      );

  /// Label XS: 11px / 16px line-height, Medium
  static TextStyle get labelXs => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 11,
        height: 16 / 11, // 1.455
        fontWeight: weightMedium,
        color: AppColors.textPrimary,
      );

  // ============================================
  // SPECIAL STYLES
  // ============================================

  /// Caption: 12px / 16px line-height, Regular (Muted text)
  static TextStyle get caption => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 12,
        height: 16 / 12, // 1.333
        fontWeight: weightRegular,
        color: AppColors.textMuted,
      );

  /// Overline: 12px / 16px line-height, Bold, Uppercase, Letter-spacing 0.08em
  static TextStyle get overline => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 12,
        height: 16 / 12, // 1.333
        fontWeight: weightBold,
        letterSpacing: 0.96, // 0.08em * 12px
        color: AppColors.textMuted,
      );

  // ============================================
  // MONOSPACE STYLE (for codes, data)
  // ============================================

  /// Monospace: 14px / 20px line-height, Regular
  static TextStyle get mono => const TextStyle(
        fontFamily: fontFamilyMono,
        fontFamilyFallback: fontFamilyMonoFallback,
        fontSize: 14,
        height: 20 / 14, // 1.429
        fontWeight: weightRegular,
        color: AppColors.textPrimary,
      );

  // ============================================
  // BUTTON TEXT STYLES
  // ============================================

  /// Button text: 16px, Semibold
  static TextStyle get button => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 16,
        height: 1.0,
        fontWeight: weightSemibold,
      );

  /// Button text small: 14px, Semibold
  static TextStyle get buttonSm => const TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 14,
        height: 1.0,
        fontWeight: weightSemibold,
      );
}

/// Dark mode typography adjustments
/// Uses DarkAppColors for text colors
class DarkAppTypography {
  DarkAppTypography._();

  static TextStyle get displayXl => AppTypography.displayXl.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get displayLg => AppTypography.displayLg.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get displayMd => AppTypography.displayMd.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get displaySm => AppTypography.displaySm.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h1 => AppTypography.h1.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h2 => AppTypography.h2.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h3 => AppTypography.h3.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h4 => AppTypography.h4.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h5 => AppTypography.h5.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get h6 => AppTypography.h6.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get bodyLg => AppTypography.bodyLg.copyWith(
        color: DarkAppColors.textSecondary,
      );

  static TextStyle get bodyMd => AppTypography.bodyMd.copyWith(
        color: DarkAppColors.textSecondary,
      );

  static TextStyle get bodySm => AppTypography.bodySm.copyWith(
        color: DarkAppColors.textSecondary,
      );

  static TextStyle get bodyXs => AppTypography.bodyXs.copyWith(
        color: DarkAppColors.textSecondary,
      );

  static TextStyle get labelLg => AppTypography.labelLg.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get labelMd => AppTypography.labelMd.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get labelSm => AppTypography.labelSm.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get labelXs => AppTypography.labelXs.copyWith(
        color: DarkAppColors.textPrimary,
      );

  static TextStyle get caption => AppTypography.caption.copyWith(
        color: DarkAppColors.textMuted,
      );

  static TextStyle get overline => AppTypography.overline.copyWith(
        color: DarkAppColors.textMuted,
      );

  static TextStyle get mono => AppTypography.mono.copyWith(
        color: DarkAppColors.textPrimary,
      );
}
