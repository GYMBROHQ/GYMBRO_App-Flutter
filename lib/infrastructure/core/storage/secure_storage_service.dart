import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../application/auth/ports/secure_storage_port.dart';
import '../../../domain/auth/auth.dart';

/// Implementation of SecureStoragePort using flutter_secure_storage
class SecureStorageService implements SecureStoragePort {
  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'auth_access_token';
  static const String _refreshTokenKey = 'auth_refresh_token';
  static const String _tokenExpiresAtKey = 'auth_token_expires_at';
  static const String _userKey = 'auth_user';
  static const String _biometricEnabledKey = 'biometric_enabled';

  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock_this_device,
              ),
            );

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: tokens.accessToken),
      _storage.write(key: _refreshTokenKey, value: tokens.refreshToken),
      if (tokens.expiresAt != null)
        _storage.write(
          key: _tokenExpiresAtKey,
          value: tokens.expiresAt!.toIso8601String(),
        ),
    ]);
  }

  @override
  Future<AuthTokens?> getTokens() async {
    final accessToken = await _storage.read(key: _accessTokenKey);
    final refreshToken = await _storage.read(key: _refreshTokenKey);

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    final expiresAtStr = await _storage.read(key: _tokenExpiresAtKey);
    DateTime? expiresAt;
    if (expiresAtStr != null) {
      expiresAt = DateTime.tryParse(expiresAtStr);
    }

    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _tokenExpiresAtKey),
    ]);
  }

  @override
  Future<void> saveUser(User user) async {
    final userJson = jsonEncode({
      'id': user.id,
      'email': user.email.value,
      'emailVerified': user.emailVerified,
      'isMfaEnabled': user.isMfaEnabled,
      'fullName': user.fullName,
      'dateOfBirth': user.dateOfBirth?.toIso8601String(),
      'phoneNumber': user.phoneNumber,
      'avatarUrl': user.avatarUrl,
      'createdAt': user.createdAt?.toIso8601String(),
      'updatedAt': user.updatedAt?.toIso8601String(),
    });
    await _storage.write(key: _userKey, value: userJson);
  }

  @override
  Future<User?> getUser() async {
    final userJson = await _storage.read(key: _userKey);
    if (userJson == null) return null;

    try {
      final data = jsonDecode(userJson) as Map<String, dynamic>;
      return UserFactory.create(
        id: data['id'] as String,
        email: data['email'] as String,
        emailVerified: data['emailVerified'] as bool,
        isMfaEnabled: data['isMfaEnabled'] as bool,
        fullName: data['fullName'] as String?,
        dateOfBirth: data['dateOfBirth'] != null
            ? DateTime.parse(data['dateOfBirth'] as String)
            : null,
        phoneNumber: data['phoneNumber'] as String?,
        avatarUrl: data['avatarUrl'] as String?,
        createdAt: data['createdAt'] != null
            ? DateTime.parse(data['createdAt'] as String)
            : null,
        updatedAt: data['updatedAt'] != null
            ? DateTime.parse(data['updatedAt'] as String)
            : null,
      );
    } catch (e) {
      // Invalid cached data, clear it
      await _storage.delete(key: _userKey);
      return null;
    }
  }

  @override
  Future<void> clearUser() async {
    await _storage.delete(key: _userKey);
  }

  @override
  Future<void> clearAll() async {
    await Future.wait([
      clearTokens(),
      clearUser(),
    ]);
  }

  @override
  Future<void> saveBiometricEnabled(bool enabled) async {
    await _storage.write(key: _biometricEnabledKey, value: enabled.toString());
  }

  @override
  Future<bool> getBiometricEnabled() async {
    try {
      final value = await _storage.read(key: _biometricEnabledKey);
      return value == 'true';
    } catch (e) {
      // If there's an error reading, default to false
      return false;
    }
  }

  @override
  Future<void> clearBiometricPreference() async {
    await _storage.delete(key: _biometricEnabledKey);
  }
}
