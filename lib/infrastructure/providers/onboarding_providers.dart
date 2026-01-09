import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'onboarding_notifier.dart';
import 'theme_providers.dart';

/// Provider for onboarding completion state
/// Returns true if user has completed onboarding, false otherwise
final onboardingNotifierProvider = StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  final preferencesService = ref.watch(appPreferencesProvider);
  return OnboardingNotifier(preferencesService: preferencesService);
});
