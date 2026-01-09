import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing app-level user preferences
/// Uses SharedPreferences for simple, non-sensitive data persistence
class AppPreferencesService {
  static const String _themeKey = 'app_theme_mode';
  static const String _onboardingCompletedKey = 'app_onboarding_completed';

  static SharedPreferences? _preferences;

  /// Initialize SharedPreferences
  /// Must be called in main() before runApp()
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Get the saved theme mode
  /// Returns ThemeMode.system as default if not set
  ThemeMode getThemeMode() {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    final themeModeString = _preferences!.getString(_themeKey);

    switch (themeModeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  /// Save the theme mode preference
  Future<void> saveThemeMode(ThemeMode mode) async {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    String themeModeString;
    switch (mode) {
      case ThemeMode.light:
        themeModeString = 'light';
        break;
      case ThemeMode.dark:
        themeModeString = 'dark';
        break;
      case ThemeMode.system:
        themeModeString = 'system';
        break;
    }

    await _preferences!.setString(_themeKey, themeModeString);
  }

  /// Clear the theme mode preference
  Future<void> clearThemeMode() async {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    await _preferences!.remove(_themeKey);
  }

  /// Check if user has completed onboarding
  /// Returns false as default if not set
  bool hasCompletedOnboarding() {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    return _preferences!.getBool(_onboardingCompletedKey) ?? false;
  }

  /// Mark onboarding as completed
  Future<void> markOnboardingAsCompleted() async {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    await _preferences!.setBool(_onboardingCompletedKey, true);
  }

  /// Clear onboarding completion (for testing/data clearing)
  Future<void> clearOnboardingCompleted() async {
    if (_preferences == null) {
      throw StateError('AppPreferencesService not initialized. Call init() in main()');
    }

    await _preferences!.remove(_onboardingCompletedKey);
  }
}
