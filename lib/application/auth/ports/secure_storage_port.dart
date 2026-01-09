import '../../../domain/auth/auth.dart';

/// Port (interface) for secure storage operations
abstract class SecureStoragePort {
  /// Save auth tokens to secure storage
  Future<void> saveTokens(AuthTokens tokens);

  /// Get stored auth tokens
  Future<AuthTokens?> getTokens();

  /// Get access token only
  Future<String?> getAccessToken();

  /// Get refresh token only
  Future<String?> getRefreshToken();

  /// Clear all stored tokens
  Future<void> clearTokens();

  /// Save current user data
  Future<void> saveUser(User user);

  /// Get stored user data
  Future<User?> getUser();

  /// Clear stored user data
  Future<void> clearUser();

  /// Clear all auth-related data
  Future<void> clearAll();

  /// Save biometric authentication preference
  Future<void> saveBiometricEnabled(bool enabled);

  /// Get biometric authentication preference
  Future<bool> getBiometricEnabled();

  /// Clear biometric preference
  Future<void> clearBiometricPreference();
}
