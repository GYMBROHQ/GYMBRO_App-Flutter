import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/biometric_service.dart';
import 'app_lock_state.dart';
import 'biometric_providers.dart';
import 'auth_providers.dart';
import 'auth_state.dart';

final appLockProvider = StateNotifierProvider<AppLockNotifier, AppLockState>((ref) {
  final biometricService = ref.watch(biometricServiceProvider);
  final biometricEnabled = ref.watch(biometricEnabledProvider);
  final authState = ref.watch(authNotifierProvider);
  final isAuthenticated = authState is AuthAuthenticated;

  final notifier = AppLockNotifier(
    biometricService: biometricService,
    biometricEnabled: biometricEnabled.valueOrNull ?? false,
    isAuthenticated: isAuthenticated,
  );

  // Listen for auth state changes and reset lock when user logs out
  ref.listen(authNotifierProvider, (previous, next) {
    if (previous is AuthAuthenticated && next is! AuthAuthenticated) {
      // User logged out, reset lock state
      notifier.reset();
    }
  });

  // Listen for biometric preference changes and lock if it gets enabled
  ref.listen(biometricEnabledProvider, (previous, next) {
    if (next.valueOrNull == true && isAuthenticated) {
      // Biometric was just enabled or loaded as enabled, lock the app
      notifier.lockApp();
    }
  });

  return notifier;
});

class AppLockNotifier extends StateNotifier<AppLockState> {
  final BiometricService _biometricService;
  final bool _biometricEnabled;
  final bool _isAuthenticated;

  static const int maxFailedAttempts = 3;

  AppLockNotifier({
    required BiometricService biometricService,
    required bool biometricEnabled,
    required bool isAuthenticated,
  })  : _biometricService = biometricService,
        _biometricEnabled = biometricEnabled,
        _isAuthenticated = isAuthenticated,
        super(
          // Lock on startup if biometric is enabled and user is authenticated
          biometricEnabled && isAuthenticated
              ? AppLockState.locked
              : AppLockState.initial,
        );

  /// Check if app should be locked on resume
  bool shouldLockOnResume() {
    return _biometricEnabled && _isAuthenticated;
  }

  /// Lock the app (called on app pause/background)
  void lockApp() {
    if (shouldLockOnResume()) {
      state = AppLockState.locked;
    }
  }

  /// Attempt to unlock with biometrics
  Future<bool> attemptBiometricUnlock() async {
    if (!_biometricEnabled) {
      state = AppLockState.initial;
      return true;
    }

    state = state.copyWith(status: AppLockStatus.authenticating);

    final result = await _biometricService.authenticate(
      localizedReason: 'Verify your identity to unlock GYMBRO',
    );

    switch (result) {
      case BiometricAuthResult.success:
        state = AppLockState.initial;
        return true;
      case BiometricAuthResult.cancelled:
        state = state.copyWith(
          status: AppLockStatus.locked,
          errorMessage: 'Authentication cancelled',
        );
        return false;
      case BiometricAuthResult.failed:
        final newAttempts = state.failedAttempts + 1;
        state = state.copyWith(
          status: AppLockStatus.failed,
          failedAttempts: newAttempts,
          errorMessage: newAttempts >= maxFailedAttempts
              ? 'Too many failed attempts. Please login again.'
              : 'Authentication failed. Try again.',
        );
        return false;
      case BiometricAuthResult.lockedOut:
        state = state.copyWith(
          status: AppLockStatus.failed,
          errorMessage: 'Biometric authentication is locked. Please try again later.',
        );
        return false;
      default:
        state = state.copyWith(
          status: AppLockStatus.failed,
          errorMessage: 'Biometric authentication not available',
        );
        return false;
    }
  }

  /// Unlock without biometrics (fallback)
  void unlockWithoutBiometrics() {
    state = AppLockState.initial;
  }

  /// Reset lock state
  void reset() {
    state = AppLockState.initial;
  }

  /// Check if fallback to full login is required
  bool requiresFullLogin() {
    return state.failedAttempts >= maxFailedAttempts;
  }
}
