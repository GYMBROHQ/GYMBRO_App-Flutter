import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';
import 'app_radius.dart';
import 'app_sizing.dart';

/// Main theme configuration for GYMBRO app
/// Provides complete ThemeData for light and dark modes
class AppTheme {
  AppTheme._();

  // ============================================
  // LIGHT THEME
  // ============================================

  /// Complete light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: _lightColorScheme,

      // Scaffold
      scaffoldBackgroundColor: AppColors.backgroundPrimary,

      // AppBar
      appBarTheme: _lightAppBarTheme,

      // Typography
      textTheme: _lightTextTheme,
      fontFamily: AppTypography.fontFamily,

      // Buttons
      elevatedButtonTheme: _lightElevatedButtonTheme,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
      textButtonTheme: _lightTextButtonTheme,
      iconButtonTheme: _lightIconButtonTheme,

      // Inputs
      inputDecorationTheme: _lightInputDecorationTheme,

      // Cards
      cardTheme: _lightCardTheme,

      // Dialogs
      dialogTheme: _lightDialogTheme,

      // Bottom Sheet
      bottomSheetTheme: _lightBottomSheetTheme,

      // Snackbar
      snackBarTheme: _lightSnackBarTheme,

      // Divider
      dividerTheme: _lightDividerTheme,

      // Checkbox
      checkboxTheme: _lightCheckboxTheme,

      // Radio
      radioTheme: _lightRadioTheme,

      // Switch
      switchTheme: _lightSwitchTheme,

      // BottomNavigationBar
      bottomNavigationBarTheme: _lightBottomNavigationBarTheme,

      // NavigationBar (Material 3)
      navigationBarTheme: _lightNavigationBarTheme,

      // Progress Indicators
      progressIndicatorTheme: _lightProgressIndicatorTheme,

      // Chip
      chipTheme: _lightChipTheme,

      // Tooltip
      tooltipTheme: _lightTooltipTheme,

      // Page transitions
      pageTransitionsTheme: _pageTransitionsTheme,

      // Visual density
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Splash and highlight
      splashColor: AppColors.primary100,
      highlightColor: AppColors.primary50,
    );
  }

  // ============================================
  // DARK THEME
  // ============================================

  /// Complete dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: _darkColorScheme,

      // Scaffold
      scaffoldBackgroundColor: DarkAppColors.backgroundPrimary,

      // AppBar
      appBarTheme: _darkAppBarTheme,

      // Typography
      textTheme: _darkTextTheme,
      fontFamily: AppTypography.fontFamily,

      // Buttons
      elevatedButtonTheme: _darkElevatedButtonTheme,
      outlinedButtonTheme: _darkOutlinedButtonTheme,
      textButtonTheme: _darkTextButtonTheme,
      iconButtonTheme: _darkIconButtonTheme,

      // Inputs
      inputDecorationTheme: _darkInputDecorationTheme,

      // Cards
      cardTheme: _darkCardTheme,

      // Dialogs
      dialogTheme: _darkDialogTheme,

      // Bottom Sheet
      bottomSheetTheme: _darkBottomSheetTheme,

      // Snackbar
      snackBarTheme: _darkSnackBarTheme,

      // Divider
      dividerTheme: _darkDividerTheme,

      // Checkbox
      checkboxTheme: _darkCheckboxTheme,

      // Radio
      radioTheme: _darkRadioTheme,

      // Switch
      switchTheme: _darkSwitchTheme,

      // BottomNavigationBar
      bottomNavigationBarTheme: _darkBottomNavigationBarTheme,

      // NavigationBar (Material 3)
      navigationBarTheme: _darkNavigationBarTheme,

      // Progress Indicators
      progressIndicatorTheme: _darkProgressIndicatorTheme,

      // Chip
      chipTheme: _darkChipTheme,

      // Tooltip
      tooltipTheme: _darkTooltipTheme,

      // Page transitions
      pageTransitionsTheme: _pageTransitionsTheme,

      // Visual density
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Splash and highlight
      splashColor: DarkAppColors.primary100,
      highlightColor: DarkAppColors.primary50,
    );
  }

  // ============================================
  // COLOR SCHEMES
  // ============================================

  static ColorScheme get _lightColorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary500,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primary100,
        onPrimaryContainer: AppColors.primary700,
        secondary: AppColors.secondary500,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.secondary100,
        onSecondaryContainer: AppColors.secondary700,
        tertiary: AppColors.info500,
        onTertiary: AppColors.white,
        tertiaryContainer: AppColors.info100,
        onTertiaryContainer: AppColors.info700,
        error: AppColors.error500,
        onError: AppColors.white,
        errorContainer: AppColors.error100,
        onErrorContainer: AppColors.error700,
        surface: AppColors.white,
        onSurface: AppColors.neutral900,
        surfaceContainerHighest: AppColors.neutral100,
        onSurfaceVariant: AppColors.neutral600,
        outline: AppColors.neutral300,
        outlineVariant: AppColors.neutral200,
        shadow: AppColors.black,
        scrim: AppColors.black,
        inverseSurface: AppColors.neutral900,
        onInverseSurface: AppColors.neutral50,
        inversePrimary: AppColors.primary300,
      );

  static ColorScheme get _darkColorScheme => ColorScheme(
        brightness: Brightness.dark,
        primary: DarkAppColors.primary500,
        onPrimary: DarkAppColors.backgroundPrimary,
        primaryContainer: DarkAppColors.primary100,
        onPrimaryContainer: DarkAppColors.primary500,
        secondary: DarkAppColors.secondary500,
        onSecondary: DarkAppColors.backgroundPrimary,
        secondaryContainer: DarkAppColors.secondary100,
        onSecondaryContainer: DarkAppColors.secondary500,
        tertiary: DarkAppColors.info500,
        onTertiary: DarkAppColors.backgroundPrimary,
        tertiaryContainer: DarkAppColors.info100,
        onTertiaryContainer: DarkAppColors.info500,
        error: DarkAppColors.error500,
        onError: DarkAppColors.backgroundPrimary,
        errorContainer: DarkAppColors.error100,
        onErrorContainer: DarkAppColors.error500,
        surface: DarkAppColors.surfaceElevated1,
        onSurface: DarkAppColors.textPrimary,
        surfaceContainerHighest: DarkAppColors.surfaceElevated2,
        onSurfaceVariant: DarkAppColors.textSecondary,
        outline: DarkAppColors.borderDefault,
        outlineVariant: DarkAppColors.borderLight,
        shadow: DarkAppColors.black,
        scrim: DarkAppColors.black,
        inverseSurface: DarkAppColors.neutral900,
        onInverseSurface: DarkAppColors.neutral50,
        inversePrimary: DarkAppColors.primary700,
      );

  // ============================================
  // APPBAR THEMES
  // ============================================

  static AppBarTheme get _lightAppBarTheme => AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.neutral900,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: AppColors.black.withValues(alpha: 0.1),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: AppTypography.h5.copyWith(
          color: AppColors.neutral900,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.neutral900,
          size: AppIconSizes.md,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.neutral700,
          size: AppIconSizes.md,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );

  static AppBarTheme get _darkAppBarTheme => AppBarTheme(
        backgroundColor: DarkAppColors.backgroundPrimary,
        foregroundColor: DarkAppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: DarkAppColors.black.withValues(alpha: 0.3),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: AppTypography.h5.copyWith(
          color: DarkAppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: DarkAppColors.textPrimary,
          size: AppIconSizes.md,
        ),
        actionsIconTheme: const IconThemeData(
          color: DarkAppColors.textSecondary,
          size: AppIconSizes.md,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      );

  // ============================================
  // TEXT THEMES
  // ============================================

  static TextTheme get _lightTextTheme => TextTheme(
        displayLarge: AppTypography.displayXl,
        displayMedium: AppTypography.displayLg,
        displaySmall: AppTypography.displayMd,
        headlineLarge: AppTypography.h1,
        headlineMedium: AppTypography.h2,
        headlineSmall: AppTypography.h3,
        titleLarge: AppTypography.h4,
        titleMedium: AppTypography.h5,
        titleSmall: AppTypography.h6,
        bodyLarge: AppTypography.bodyLg,
        bodyMedium: AppTypography.bodyMd,
        bodySmall: AppTypography.bodySm,
        labelLarge: AppTypography.labelLg,
        labelMedium: AppTypography.labelMd,
        labelSmall: AppTypography.labelSm,
      );

  static TextTheme get _darkTextTheme => TextTheme(
        displayLarge: DarkAppTypography.displayXl,
        displayMedium: DarkAppTypography.displayLg,
        displaySmall: DarkAppTypography.displayMd,
        headlineLarge: DarkAppTypography.h1,
        headlineMedium: DarkAppTypography.h2,
        headlineSmall: DarkAppTypography.h3,
        titleLarge: DarkAppTypography.h4,
        titleMedium: DarkAppTypography.h5,
        titleSmall: DarkAppTypography.h6,
        bodyLarge: DarkAppTypography.bodyLg,
        bodyMedium: DarkAppTypography.bodyMd,
        bodySmall: DarkAppTypography.bodySm,
        labelLarge: DarkAppTypography.labelLg,
        labelMedium: DarkAppTypography.labelMd,
        labelSmall: DarkAppTypography.labelSm,
      );

  // ============================================
  // BUTTON THEMES
  // ============================================

  static ElevatedButtonThemeData get _lightElevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.neutral300,
          disabledForegroundColor: AppColors.neutral500,
          elevation: 1,
          shadowColor: AppColors.black.withValues(alpha: 0.1),
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static ElevatedButtonThemeData get _darkElevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkAppColors.primary500,
          foregroundColor: DarkAppColors.backgroundPrimary,
          disabledBackgroundColor: DarkAppColors.neutral300,
          disabledForegroundColor: DarkAppColors.neutral500,
          elevation: 1,
          shadowColor: DarkAppColors.black.withValues(alpha: 0.3),
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static OutlinedButtonThemeData get _lightOutlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary500,
          disabledForegroundColor: AppColors.neutral400,
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          side: const BorderSide(
            color: AppColors.primary500,
            width: 1.5,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static OutlinedButtonThemeData get _darkOutlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DarkAppColors.primary500,
          disabledForegroundColor: DarkAppColors.neutral400,
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          side: const BorderSide(
            color: DarkAppColors.primary500,
            width: 1.5,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static TextButtonThemeData get _lightTextButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary500,
          disabledForegroundColor: AppColors.neutral400,
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static TextButtonThemeData get _darkTextButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: DarkAppColors.primary500,
          disabledForegroundColor: DarkAppColors.neutral400,
          padding: AppSpacing.buttonPadding,
          minimumSize: const Size(0, AppButtonSizes.heightMd),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.button,
          ),
          textStyle: AppTypography.button,
        ),
      );

  static IconButtonThemeData get _lightIconButtonTheme => IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.neutral700,
          disabledForegroundColor: AppColors.neutral400,
          minimumSize: const Size(AppButtonSizes.iconButton, AppButtonSizes.iconButton),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.md,
          ),
        ),
      );

  static IconButtonThemeData get _darkIconButtonTheme => IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: DarkAppColors.textSecondary,
          disabledForegroundColor: DarkAppColors.neutral400,
          minimumSize: const Size(AppButtonSizes.iconButton, AppButtonSizes.iconButton),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.md,
          ),
        ),
      );

  // ============================================
  // INPUT DECORATION THEMES
  // ============================================

  static InputDecorationTheme get _lightInputDecorationTheme =>
      InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: AppSpacing.inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.neutral300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.neutral300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.primary500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.error500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.error500, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: AppColors.neutral200),
        ),
        labelStyle: AppTypography.labelMd.copyWith(color: AppColors.neutral700),
        hintStyle: AppTypography.bodyMd.copyWith(color: AppColors.neutral500),
        errorStyle: AppTypography.bodyXs.copyWith(color: AppColors.error500),
        helperStyle: AppTypography.bodyXs.copyWith(color: AppColors.neutral600),
        prefixIconColor: AppColors.neutral500,
        suffixIconColor: AppColors.neutral500,
      );

  static InputDecorationTheme get _darkInputDecorationTheme =>
      InputDecorationTheme(
        filled: true,
        fillColor: DarkAppColors.surfaceElevated1,
        contentPadding: AppSpacing.inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.primary500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.error500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.error500, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.input,
          borderSide: const BorderSide(color: DarkAppColors.neutral200),
        ),
        labelStyle: AppTypography.labelMd.copyWith(color: DarkAppColors.textSecondary),
        hintStyle: AppTypography.bodyMd.copyWith(color: DarkAppColors.textMuted),
        errorStyle: AppTypography.bodyXs.copyWith(color: DarkAppColors.error500),
        helperStyle: AppTypography.bodyXs.copyWith(color: DarkAppColors.textMuted),
        prefixIconColor: DarkAppColors.textMuted,
        suffixIconColor: DarkAppColors.textMuted,
      );

  // ============================================
  // CARD THEMES
  // ============================================

  static CardThemeData get _lightCardTheme => CardThemeData(
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: AppColors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.card,
        ),
        margin: EdgeInsets.zero,
      );

  static CardThemeData get _darkCardTheme => CardThemeData(
        color: DarkAppColors.surfaceElevated1,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: DarkAppColors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.card,
        ),
        margin: EdgeInsets.zero,
      );

  // ============================================
  // DIALOG THEMES
  // ============================================

  static DialogThemeData get _lightDialogTheme => DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shadowColor: AppColors.black.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.modal,
        ),
        titleTextStyle: AppTypography.h3,
        contentTextStyle: AppTypography.bodyMd,
      );

  static DialogThemeData get _darkDialogTheme => DialogThemeData(
        backgroundColor: DarkAppColors.surfaceElevated2,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shadowColor: DarkAppColors.black.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.modal,
        ),
        titleTextStyle: DarkAppTypography.h3,
        contentTextStyle: DarkAppTypography.bodyMd,
      );

  // ============================================
  // BOTTOM SHEET THEMES
  // ============================================

  static BottomSheetThemeData get _lightBottomSheetTheme =>
      BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 16,
        shadowColor: AppColors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.bottomSheet,
        ),
        dragHandleColor: AppColors.neutral300,
        dragHandleSize: const Size(
          AppModalSizes.bottomSheetHandleWidth,
          AppModalSizes.bottomSheetHandleHeight,
        ),
      );

  static BottomSheetThemeData get _darkBottomSheetTheme =>
      BottomSheetThemeData(
        backgroundColor: DarkAppColors.surfaceElevated2,
        surfaceTintColor: Colors.transparent,
        elevation: 16,
        shadowColor: DarkAppColors.black.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.bottomSheet,
        ),
        dragHandleColor: DarkAppColors.neutral400,
        dragHandleSize: const Size(
          AppModalSizes.bottomSheetHandleWidth,
          AppModalSizes.bottomSheetHandleHeight,
        ),
      );

  // ============================================
  // SNACKBAR THEMES
  // ============================================

  static SnackBarThemeData get _lightSnackBarTheme => SnackBarThemeData(
        backgroundColor: AppColors.neutral900,
        contentTextStyle: AppTypography.bodyMd.copyWith(color: AppColors.white),
        actionTextColor: AppColors.primary300,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.lg,
        ),
        elevation: 6,
      );

  static SnackBarThemeData get _darkSnackBarTheme => SnackBarThemeData(
        backgroundColor: DarkAppColors.surfaceElevated3,
        contentTextStyle: AppTypography.bodyMd.copyWith(color: DarkAppColors.textPrimary),
        actionTextColor: DarkAppColors.primary500,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.lg,
        ),
        elevation: 6,
      );

  // ============================================
  // DIVIDER THEMES
  // ============================================

  static DividerThemeData get _lightDividerTheme => const DividerThemeData(
        color: AppColors.neutral200,
        thickness: 1,
        space: 1,
      );

  static DividerThemeData get _darkDividerTheme => const DividerThemeData(
        color: DarkAppColors.borderDefault,
        thickness: 1,
        space: 1,
      );

  // ============================================
  // CHECKBOX THEMES
  // ============================================

  static CheckboxThemeData get _lightCheckboxTheme => CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary500;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: const BorderSide(color: AppColors.neutral400, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      );

  static CheckboxThemeData get _darkCheckboxTheme => CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DarkAppColors.primary500;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(DarkAppColors.backgroundPrimary),
        side: const BorderSide(color: DarkAppColors.neutral400, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      );

  // ============================================
  // RADIO THEMES
  // ============================================

  static RadioThemeData get _lightRadioTheme => RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary500;
          }
          return AppColors.neutral400;
        }),
      );

  static RadioThemeData get _darkRadioTheme => RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DarkAppColors.primary500;
          }
          return DarkAppColors.neutral400;
        }),
      );

  // ============================================
  // SWITCH THEMES
  // ============================================

  static SwitchThemeData get _lightSwitchTheme => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary500;
          }
          return AppColors.neutral300;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      );

  static SwitchThemeData get _darkSwitchTheme => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DarkAppColors.backgroundPrimary;
          }
          return DarkAppColors.textPrimary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DarkAppColors.primary500;
          }
          return DarkAppColors.neutral300;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      );

  // ============================================
  // BOTTOM NAVIGATION BAR THEMES
  // ============================================

  static BottomNavigationBarThemeData get _lightBottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary500,
        unselectedItemColor: AppColors.neutral600,
        selectedLabelStyle: AppTypography.caption.copyWith(
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: AppTypography.caption,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static BottomNavigationBarThemeData get _darkBottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: DarkAppColors.surfaceElevated1,
        selectedItemColor: DarkAppColors.primary500,
        unselectedItemColor: DarkAppColors.textMuted,
        selectedLabelStyle: AppTypography.caption.copyWith(
          fontWeight: FontWeight.w500,
          color: DarkAppColors.primary500,
        ),
        unselectedLabelStyle: AppTypography.caption.copyWith(
          color: DarkAppColors.textMuted,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  // ============================================
  // NAVIGATION BAR THEMES (Material 3)
  // ============================================

  static NavigationBarThemeData get _lightNavigationBarTheme =>
      NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.primary100,
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        height: AppNavigationSizes.bottomNavHeight,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.caption.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w500,
            );
          }
          return AppTypography.caption.copyWith(
            color: AppColors.neutral600,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: AppColors.primary500,
              size: AppNavigationSizes.bottomNavIcon,
            );
          }
          return const IconThemeData(
            color: AppColors.neutral600,
            size: AppNavigationSizes.bottomNavIcon,
          );
        }),
      );

  static NavigationBarThemeData get _darkNavigationBarTheme =>
      NavigationBarThemeData(
        backgroundColor: DarkAppColors.surfaceElevated1,
        indicatorColor: DarkAppColors.primary100,
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        height: AppNavigationSizes.bottomNavHeight,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.caption.copyWith(
              color: DarkAppColors.primary500,
              fontWeight: FontWeight.w500,
            );
          }
          return AppTypography.caption.copyWith(
            color: DarkAppColors.textMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: DarkAppColors.primary500,
              size: AppNavigationSizes.bottomNavIcon,
            );
          }
          return const IconThemeData(
            color: DarkAppColors.textMuted,
            size: AppNavigationSizes.bottomNavIcon,
          );
        }),
      );

  // ============================================
  // PROGRESS INDICATOR THEMES
  // ============================================

  static ProgressIndicatorThemeData get _lightProgressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: AppColors.primary500,
        linearTrackColor: AppColors.neutral200,
        circularTrackColor: AppColors.neutral200,
      );

  static ProgressIndicatorThemeData get _darkProgressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: DarkAppColors.primary500,
        linearTrackColor: DarkAppColors.neutral200,
        circularTrackColor: DarkAppColors.neutral200,
      );

  // ============================================
  // CHIP THEMES
  // ============================================

  static ChipThemeData get _lightChipTheme => ChipThemeData(
        backgroundColor: AppColors.neutral100,
        selectedColor: AppColors.primary100,
        disabledColor: AppColors.neutral100,
        labelStyle: AppTypography.labelSm,
        secondaryLabelStyle: AppTypography.labelSm,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing3,
          vertical: AppSpacing.spacing1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.full,
        ),
        side: BorderSide.none,
      );

  static ChipThemeData get _darkChipTheme => ChipThemeData(
        backgroundColor: DarkAppColors.surfaceElevated2,
        selectedColor: DarkAppColors.primary100,
        disabledColor: DarkAppColors.neutral100,
        labelStyle: AppTypography.labelSm.copyWith(color: DarkAppColors.textPrimary),
        secondaryLabelStyle: AppTypography.labelSm.copyWith(color: DarkAppColors.textSecondary),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing3,
          vertical: AppSpacing.spacing1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.full,
        ),
        side: BorderSide.none,
      );

  // ============================================
  // TOOLTIP THEMES
  // ============================================

  static TooltipThemeData get _lightTooltipTheme => TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.neutral900,
          borderRadius: AppBorderRadius.sm,
        ),
        textStyle: AppTypography.bodyXs.copyWith(color: AppColors.white),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing3,
          vertical: AppSpacing.spacing2,
        ),
        waitDuration: const Duration(milliseconds: 500),
      );

  static TooltipThemeData get _darkTooltipTheme => TooltipThemeData(
        decoration: BoxDecoration(
          color: DarkAppColors.surfaceElevated3,
          borderRadius: AppBorderRadius.sm,
        ),
        textStyle: AppTypography.bodyXs.copyWith(color: DarkAppColors.textPrimary),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing3,
          vertical: AppSpacing.spacing2,
        ),
        waitDuration: const Duration(milliseconds: 500),
      );

  // ============================================
  // PAGE TRANSITIONS
  // ============================================

  static PageTransitionsTheme get _pageTransitionsTheme =>
      const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      );
}
