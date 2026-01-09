import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/biometric_service.dart';
import '../../application/auth/ports/secure_storage_port.dart';
import 'core_providers.dart';

/// Provider for BiometricService
final biometricServiceProvider = Provider<BiometricService>((ref) {
  return BiometricService();
});

/// Provider for checking if biometrics are available
final biometricAvailableProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(biometricServiceProvider);
  return await service.isBiometricAvailable();
});

/// Provider for biometric preference state
final biometricEnabledProvider = StateNotifierProvider<BiometricEnabledNotifier, AsyncValue<bool>>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return BiometricEnabledNotifier(secureStorage);
});

class BiometricEnabledNotifier extends StateNotifier<AsyncValue<bool>> {
  final SecureStoragePort _secureStorage;

  BiometricEnabledNotifier(this._secureStorage) : super(const AsyncValue.loading()) {
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    try {
      final enabled = await _secureStorage.getBiometricEnabled();
      state = AsyncValue.data(enabled);
    } catch (e) {
      // On error, default to false (biometric disabled)
      state = const AsyncValue.data(false);
    }
  }

  Future<void> setEnabled(bool enabled) async {
    state = const AsyncValue.loading();
    try {
      await _secureStorage.saveBiometricEnabled(enabled);
      state = AsyncValue.data(enabled);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> disable() async {
    await setEnabled(false);
  }
}
