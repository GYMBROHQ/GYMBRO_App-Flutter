import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/storage/app_preferences_service.dart';

/// StateNotifier for managing theme mode
/// Follows the AuthNotifier pattern from the app
class ThemeNotifier extends StateNotifier<ThemeMode> {
  final AppPreferencesService _preferencesService;

  ThemeNotifier({required AppPreferencesService preferencesService})
      : _preferencesService = preferencesService,
        super(ThemeMode.system) {
    // Load saved theme mode on initialization
    _loadThemeMode();
  }

  void _loadThemeMode() {
    try {
      final savedTheme = _preferencesService.getThemeMode();
      state = savedTheme;
    } catch (e) {
      // If there's an error, default to system theme
      state = ThemeMode.system;
    }
  }

  /// Set the theme mode and persist it
  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      await _preferencesService.saveThemeMode(mode);
      state = mode;
    } catch (e) {
      // Handle error silently - state won't update if save fails
    }
  }

  /// Toggle between light and dark mode
  /// Does not include system mode in the toggle
  Future<void> toggleDarkMode() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(newMode);
  }
}
