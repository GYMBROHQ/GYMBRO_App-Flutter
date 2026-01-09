import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

/// Result of biometric authentication attempt
enum BiometricAuthResult {
  success,
  failed,
  cancelled,
  notAvailable,
  notEnrolled,
  lockedOut,
  error,
}

/// Service for handling biometric authentication
class BiometricService {
  final LocalAuthentication _localAuth;

  BiometricService({LocalAuthentication? localAuth})
      : _localAuth = localAuth ?? LocalAuthentication();

  /// Check if device supports biometric authentication
  Future<bool> isBiometricAvailable() async {
    try {
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      return canCheckBiometrics && isDeviceSupported;
    } on PlatformException {
      return false;
    }
  }

  /// Get list of available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  /// Check if biometrics are enrolled on the device
  Future<bool> hasBiometricsEnrolled() async {
    final biometrics = await getAvailableBiometrics();
    return biometrics.isNotEmpty;
  }

  /// Authenticate user with biometrics
  Future<BiometricAuthResult> authenticate({
    String localizedReason = 'Verify your identity to unlock GYMBRO',
    bool biometricOnly = true,
  }) async {
    try {
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return BiometricAuthResult.notAvailable;
      }

      final hasEnrolled = await hasBiometricsEnrolled();
      if (!hasEnrolled) {
        return BiometricAuthResult.notEnrolled;
      }

      final authenticated = await _localAuth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );

      return authenticated
          ? BiometricAuthResult.success
          : BiometricAuthResult.failed;
    } on PlatformException catch (e) {
      if (e.code == 'NotAvailable') {
        return BiometricAuthResult.notAvailable;
      } else if (e.code == 'NotEnrolled') {
        return BiometricAuthResult.notEnrolled;
      } else if (e.code == 'LockedOut' || e.code == 'PermanentlyLockedOut') {
        return BiometricAuthResult.lockedOut;
      } else if (e.code == 'PasscodeNotSet') {
        return BiometricAuthResult.notAvailable;
      }
      return BiometricAuthResult.error;
    }
  }

  /// Cancel ongoing authentication
  Future<bool> cancelAuthentication() async {
    return await _localAuth.stopAuthentication();
  }
}
