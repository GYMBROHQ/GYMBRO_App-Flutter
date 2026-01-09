import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/storage/app_preferences_service.dart';
import 'theme_notifier.dart';

/// Provider for app preferences service
final appPreferencesProvider = Provider<AppPreferencesService>((ref) {
  return AppPreferencesService();
});

/// StateNotifierProvider for theme management
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final preferencesService = ref.watch(appPreferencesProvider);
  return ThemeNotifier(preferencesService: preferencesService);
});
