import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/storage/app_preferences_service.dart';

/// StateNotifier for managing onboarding completion state
/// Returns true if onboarding has been completed, false otherwise
class OnboardingNotifier extends StateNotifier<bool> {
  final AppPreferencesService _preferencesService;

  OnboardingNotifier({required AppPreferencesService preferencesService})
      : _preferencesService = preferencesService,
        super(false) {
    // Load onboarding state on initialization
    _loadOnboardingState();
  }

  void _loadOnboardingState() {
    try {
      final hasCompleted = _preferencesService.hasCompletedOnboarding();
      state = hasCompleted;
    } catch (e) {
      // If there's an error, default to false (show onboarding)
      state = false;
    }
  }

  /// Mark onboarding as completed and update state
  Future<void> markAsCompleted() async {
    try {
      await _preferencesService.markOnboardingAsCompleted();
      state = true;
    } catch (e) {
      // Handle error silently - state won't update if save fails
    }
  }

  /// Reset onboarding state (for testing/debugging)
  Future<void> reset() async {
    try {
      await _preferencesService.clearOnboardingCompleted();
      state = false;
    } catch (e) {
      // Handle error silently
    }
  }
}
