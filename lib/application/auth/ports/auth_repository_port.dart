import '../../../domain/auth/auth.dart';

/// Result type for auth operations
sealed class AuthResult<T> {
  const AuthResult();
}

class AuthSuccess<T> extends AuthResult<T> {
  final T data;
  const AuthSuccess(this.data);
}

class AuthFailure<T> extends AuthResult<T> {
  final String message;
  final String? code;
  const AuthFailure(this.message, {this.code});
}

/// Login result that can be either tokens or MFA challenge
sealed class LoginResult {
  const LoginResult();
}

class LoginSuccessResult extends LoginResult {
  final AuthTokens tokens;
  final User user;
  const LoginSuccessResult({required this.tokens, required this.user});
}

class LoginMfaRequiredResult extends LoginResult {
  final MfaChallenge challenge;
  const LoginMfaRequiredResult({required this.challenge});
}

/// Port (interface) for auth repository operations
abstract class AuthRepositoryPort {
  /// Register a new user
  Future<AuthResult<LoginSuccessResult>> register({
    required String fullName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
    required DateTime termsAcceptedAt,
    required String ipAddress,
    required String userAgent,
  });

  /// Login with email and password
  Future<AuthResult<LoginResult>> login({
    required String email,
    required String password,
    required String ipAddress,
    required String userAgent,
    String? deviceId,
  });

  /// Logout current session
  Future<AuthResult<void>> logout({
    required String sessionId,
    required bool allDevices,
  });

  /// Refresh access token
  Future<AuthResult<AuthTokens>> refreshTokens({
    required String refreshToken,
    required String ipAddress,
    required String userAgent,
  });

  /// Get current user info
  Future<AuthResult<User>> getCurrentUser();

  /// Initiate MFA setup
  Future<AuthResult<MfaSetup>> initiateMfaSetup();

  /// Complete MFA setup with TOTP code
  Future<AuthResult<MfaBackupCodes>> completeMfaSetup({
    required String mfaToken,
    required String totpCode,
    required String ipAddress,
    required String userAgent,
  });

  /// Verify MFA code during login
  Future<AuthResult<LoginSuccessResult>> verifyMfa({
    required String mfaToken,
    required String code,
    required String ipAddress,
    required String userAgent,
    String? deviceId,
  });

  /// Disable MFA
  Future<AuthResult<void>> disableMfa({
    required String password,
    required String ipAddress,
    required String userAgent,
  });

  /// Request password reset
  Future<AuthResult<void>> requestPasswordReset({
    required String email,
    required String ipAddress,
    required String userAgent,
  });

  /// Reset password with token
  Future<AuthResult<void>> resetPassword({
    required String token,
    required String newPassword,
    required String ipAddress,
    required String userAgent,
  });

  /// Update user profile
  Future<AuthResult<User>> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  });
}
