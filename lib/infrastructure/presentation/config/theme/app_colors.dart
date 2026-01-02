import 'package:flutter/material.dart';

/// Light mode color palette for GYMBRO app
/// Based on the GYMBRO Theme Properties Specification
class AppColors {
  AppColors._();

  // ============================================
  // PRIMARY COLORS - Energetic Blue
  // ============================================
  static const Color primary50 = Color(0xFFF2F7FF);
  static const Color primary100 = Color(0xFFE6F0FF);
  static const Color primary300 = Color(0xFF66A3FF);
  static const Color primary400 = Color(0xFF3384FF);
  static const Color primary500 = Color(0xFF0066FF); // Main brand color
  static const Color primary600 = Color(0xFF0052CC); // Hover states
  static const Color primary700 = Color(0xFF003D99); // Active states

  // ============================================
  // SECONDARY COLORS - Fitness Orange
  // ============================================
  static const Color secondary50 = Color(0xFFFFF5F2);
  static const Color secondary100 = Color(0xFFFFE8E0);
  static const Color secondary400 = Color(0xFFFF8559);
  static const Color secondary500 = Color(0xFFFF6B35); // Accent color
  static const Color secondary600 = Color(0xFFE65A2B); // Hover
  static const Color secondary700 = Color(0xFFCC4821); // Active

  // ============================================
  // SEMANTIC COLORS - Success (Green)
  // ============================================
  static const Color success50 = Color(0xFFECFDF5);
  static const Color success100 = Color(0xFFD1FAE5);
  static const Color success500 = Color(0xFF10B981); // Main
  static const Color success600 = Color(0xFF059669); // Hover
  static const Color success700 = Color(0xFF047857); // Active

  // ============================================
  // SEMANTIC COLORS - Warning (Amber)
  // ============================================
  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning500 = Color(0xFFF59E0B); // Main
  static const Color warning600 = Color(0xFFD97706); // Hover
  static const Color warning700 = Color(0xFFB45309); // Active

  // ============================================
  // SEMANTIC COLORS - Error (Red)
  // ============================================
  static const Color error50 = Color(0xFFFEF2F2);
  static const Color error100 = Color(0xFFFEE2E2);
  static const Color error500 = Color(0xFFEF4444); // Main
  static const Color error600 = Color(0xFFDC2626); // Hover
  static const Color error700 = Color(0xFFB91C1C); // Active

  // ============================================
  // SEMANTIC COLORS - Info (Cyan)
  // ============================================
  static const Color info50 = Color(0xFFECFEFF);
  static const Color info100 = Color(0xFFCFFAFE);
  static const Color info500 = Color(0xFF06B6D4); // Main
  static const Color info600 = Color(0xFF0891B2); // Hover
  static const Color info700 = Color(0xFF0E7490); // Active

  // ============================================
  // NEUTRAL COLORS (Grayscale)
  // ============================================
  static const Color neutral50 = Color(0xFFF9FAFB); // Background
  static const Color neutral100 = Color(0xFFF3F4F6); // Background alt
  static const Color neutral200 = Color(0xFFE5E7EB); // Light borders
  static const Color neutral300 = Color(0xFFD1D5DB); // Borders, dividers
  static const Color neutral400 = Color(0xFF9CA3AF); // Disabled text
  static const Color neutral500 = Color(0xFF6B7280); // Placeholder text
  static const Color neutral600 = Color(0xFF4B5563); // Muted text
  static const Color neutral700 = Color(0xFF374151); // Body text
  static const Color neutral800 = Color(0xFF1F2937); // Secondary headings
  static const Color neutral900 = Color(0xFF111827); // Headings, primary text

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ============================================
  // BACKGROUND COLORS (Light Mode)
  // ============================================
  static const Color backgroundPrimary = white;
  static const Color backgroundSecondary = neutral50;
  static const Color backgroundTertiary = neutral100;

  // ============================================
  // TEXT COLORS (Light Mode)
  // ============================================
  static const Color textPrimary = neutral900;
  static const Color textSecondary = neutral700;
  static const Color textMuted = neutral500;
  static const Color textDisabled = neutral400;

  // ============================================
  // BORDER COLORS (Light Mode)
  // ============================================
  static const Color borderDefault = neutral300;
  static const Color borderLight = neutral200;
}

/// Dark mode color palette for GYMBRO app
/// Follows Material Design dark theme guidelines:
/// - Dark grays instead of pure black
/// - Off-white instead of pure white
/// - Slightly reduced contrast for eye comfort
class DarkAppColors {
  DarkAppColors._();

  // ============================================
  // PRIMARY COLORS - Energetic Blue (adjusted for dark)
  // ============================================
  static const Color primary50 = Color(0xFF0A1929);
  static const Color primary100 = Color(0xFF0D2137);
  static const Color primary300 = Color(0xFF3384FF);
  static const Color primary400 = Color(0xFF4D94FF);
  static const Color primary500 = Color(0xFF66A3FF); // Lighter for dark mode
  static const Color primary600 = Color(0xFF3384FF);
  static const Color primary700 = Color(0xFF0066FF);

  // ============================================
  // SECONDARY COLORS - Fitness Orange (adjusted for dark)
  // ============================================
  static const Color secondary50 = Color(0xFF1A0F0A);
  static const Color secondary100 = Color(0xFF2D1810);
  static const Color secondary400 = Color(0xFFFF9D70);
  static const Color secondary500 = Color(0xFFFF8559);
  static const Color secondary600 = Color(0xFFFF6B35);
  static const Color secondary700 = Color(0xFFE65A2B);

  // ============================================
  // SEMANTIC COLORS - Success (Green) - adjusted for dark
  // ============================================
  static const Color success50 = Color(0xFF052E1C);
  static const Color success100 = Color(0xFF064E30);
  static const Color success500 = Color(0xFF34D399);
  static const Color success600 = Color(0xFF10B981);
  static const Color success700 = Color(0xFF059669);

  // ============================================
  // SEMANTIC COLORS - Warning (Amber) - adjusted for dark
  // ============================================
  static const Color warning50 = Color(0xFF1C1402);
  static const Color warning100 = Color(0xFF3D2C05);
  static const Color warning500 = Color(0xFFFBBF24);
  static const Color warning600 = Color(0xFFF59E0B);
  static const Color warning700 = Color(0xFFD97706);

  // ============================================
  // SEMANTIC COLORS - Error (Red) - adjusted for dark
  // ============================================
  static const Color error50 = Color(0xFF1F0A0A);
  static const Color error100 = Color(0xFF3B1414);
  static const Color error500 = Color(0xFFF87171);
  static const Color error600 = Color(0xFFEF4444);
  static const Color error700 = Color(0xFFDC2626);

  // ============================================
  // SEMANTIC COLORS - Info (Cyan) - adjusted for dark
  // ============================================
  static const Color info50 = Color(0xFF051E21);
  static const Color info100 = Color(0xFF083B40);
  static const Color info500 = Color(0xFF22D3EE);
  static const Color info600 = Color(0xFF06B6D4);
  static const Color info700 = Color(0xFF0891B2);

  // ============================================
  // NEUTRAL COLORS (Dark Mode Grayscale)
  // ============================================
  static const Color neutral50 = Color(0xFF111827); // Darkest background
  static const Color neutral100 = Color(0xFF1F2937);
  static const Color neutral200 = Color(0xFF374151);
  static const Color neutral300 = Color(0xFF4B5563);
  static const Color neutral400 = Color(0xFF6B7280);
  static const Color neutral500 = Color(0xFF9CA3AF);
  static const Color neutral600 = Color(0xFFD1D5DB);
  static const Color neutral700 = Color(0xFFE5E7EB);
  static const Color neutral800 = Color(0xFFF3F4F6);
  static const Color neutral900 = Color(0xFFF9FAFB); // Lightest text

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ============================================
  // BACKGROUND COLORS (Dark Mode)
  // ============================================
  static const Color backgroundPrimary = Color(0xFF111827); // Dark gray, not pure black
  static const Color backgroundSecondary = Color(0xFF1F2937);
  static const Color backgroundTertiary = Color(0xFF374151);

  // ============================================
  // SURFACE COLORS (Dark Mode) - For cards and elevated elements
  // ============================================
  static const Color surfaceElevated1 = Color(0xFF1F2937);
  static const Color surfaceElevated2 = Color(0xFF374151);
  static const Color surfaceElevated3 = Color(0xFF4B5563);

  // ============================================
  // TEXT COLORS (Dark Mode)
  // ============================================
  static const Color textPrimary = Color(0xFFF9FAFB); // Off-white, not pure white
  static const Color textSecondary = Color(0xFFE5E7EB);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFF6B7280);

  // ============================================
  // BORDER COLORS (Dark Mode)
  // ============================================
  static const Color borderDefault = Color(0xFF374151);
  static const Color borderLight = Color(0xFF4B5563);
}

/// Gradient definitions for GYMBRO app
class AppGradients {
  AppGradients._();

  /// Primary gradient for premium features, hero sections, special CTAs
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0066FF),
      Color(0xFF0052CC),
    ],
  );

  /// Success gradient for success confirmations, achievement badges
  static const LinearGradient success = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF10B981),
      Color(0xFF059669),
    ],
  );

  /// Energy gradient for promotional banners, featured gyms
  static const LinearGradient energy = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF6B35),
      Color(0xFF0066FF),
    ],
  );
}
