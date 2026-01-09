import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth/auth.dart';
import '../../domain/auth/auth.dart';
import 'auth_state.dart';

/// StateNotifier for managing authentication state
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  AuthNotifier({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage,
        super(const AuthInitial()) {
    // Check for existing session on initialization
    _checkExistingSession();
  }

  Future<void> _checkExistingSession() async {
    final tokens = await _secureStorage.getTokens();
    if (tokens != null && !tokens.isExpired) {
      final user = await _secureStorage.getUser();
      if (user != null) {
        state = AuthAuthenticated(user);
        return;
      }

      // Try to fetch user from server
      final result = await _authRepository.getCurrentUser();
      if (result is AuthSuccess<User>) {
        await _secureStorage.saveUser(result.data);
        state = AuthAuthenticated(result.data);
      } else {
        state = const AuthUnauthenticated();
      }
    } else {
      state = const AuthUnauthenticated();
    }
  }

  Future<void> login({
    required String email,
    required String password,
    String? deviceId,
  }) async {
    state = const AuthLoading();

    try {
      final handler = LoginHandler(
        authRepository: _authRepository,
        secureStorage: _secureStorage,
      );

      final result = await handler.execute(LoginCommand(
        email: email,
        password: password,
        ipAddress: 'mobile',
        userAgent: 'GYMBRO App',
        deviceId: deviceId,
      ));

      if (result is AuthSuccess<LoginResult>) {
        final loginResult = result.data;
        if (loginResult is LoginSuccessResult) {
          state = AuthAuthenticated(loginResult.user);
        } else if (loginResult is LoginMfaRequiredResult) {
          state = AuthMfaRequired(loginResult.challenge);
        }
      } else if (result is AuthFailure<LoginResult>) {
        state = AuthError(result.message);
      }
    } catch (e) {
      // Handle network errors and other exceptions
      state = AuthError('Network error: Unable to connect to server. Please check your connection and try again.');
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  }) async {
    state = const AuthLoading();

    try {
      final handler = RegisterHandler(
        authRepository: _authRepository,
        secureStorage: _secureStorage,
      );

      final result = await handler.execute(RegisterCommand(
        fullName: fullName,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
        termsAcceptedAt: DateTime.now(),
        ipAddress: 'mobile',
        userAgent: 'GYMBRO App',
      ));

      if (result is AuthSuccess<LoginSuccessResult>) {
        state = AuthAuthenticated(result.data.user);
      } else if (result is AuthFailure<LoginSuccessResult>) {
        state = AuthError(result.message);
      }
    } catch (e) {
      state = AuthError('Network error: Unable to connect to server. Please check your connection and try again.');
    }
  }

  Future<void> verifyMfa({
    required String mfaToken,
    required String code,
    String? deviceId,
  }) async {
    state = const AuthLoading();

    try {
      final handler = VerifyMfaHandler(
        authRepository: _authRepository,
        secureStorage: _secureStorage,
      );

      final result = await handler.execute(VerifyMfaCommand(
        mfaToken: mfaToken,
        code: code,
        ipAddress: 'mobile',
        userAgent: 'GYMBRO App',
        deviceId: deviceId,
      ));

      if (result is AuthSuccess<LoginSuccessResult>) {
        state = AuthAuthenticated(result.data.user);
      } else if (result is AuthFailure<LoginSuccessResult>) {
        state = AuthError(result.message);
      }
    } catch (e) {
      state = AuthError('Network error: Unable to connect to server. Please check your connection and try again.');
    }
  }

  Future<void> logout({bool allDevices = false}) async {
    final handler = LogoutHandler(
      authRepository: _authRepository,
      secureStorage: _secureStorage,
    );

    await handler.execute(LogoutCommand(
      sessionId: '',
      allDevices: allDevices,
    ));

    // Clear biometric preference on logout
    await _secureStorage.clearBiometricPreference();

    state = const AuthUnauthenticated();
  }

  Future<bool> refreshTokens() async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken == null) {
      return false;
    }

    final handler = RefreshSessionHandler(
      authRepository: _authRepository,
      secureStorage: _secureStorage,
    );

    final result = await handler.execute(RefreshSessionCommand(
      refreshToken: refreshToken,
      ipAddress: 'mobile',
      userAgent: 'GYMBRO App',
    ));

    final success = result is AuthSuccess<AuthTokens>;
    return success;
  }

  void handleSessionExpired() {
    _secureStorage.clearAll();
    _secureStorage.clearBiometricPreference();
    state = const AuthUnauthenticated(message: 'Session expired. Please login again.');
  }

  Future<void> requestPasswordReset({required String email}) async {
    final handler = RequestPasswordResetHandler(
      authRepository: _authRepository,
    );

    await handler.execute(RequestPasswordResetCommand(
      email: email,
      ipAddress: 'mobile',
      userAgent: 'GYMBRO App',
    ));
  }

  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    final handler = ResetPasswordHandler(
      authRepository: _authRepository,
    );

    final result = await handler.execute(ResetPasswordCommand(
      token: token,
      newPassword: newPassword,
      ipAddress: 'mobile',
      userAgent: 'GYMBRO App',
    ));

    return result is AuthSuccess<void>;
  }

  void clearError() {
    if (state is AuthError) {
      state = const AuthUnauthenticated();
    }
  }

  Future<MfaSetup?> initiateMfaSetup() async {
    final handler = SetupMfaHandler(
      authRepository: _authRepository,
    );

    final result = await handler.executeInitiate(const InitiateMfaSetupCommand());

    if (result is AuthSuccess<MfaSetup>) {
      return result.data;
    }
    return null;
  }

  Future<MfaBackupCodes?> completeMfaSetup({
    required String mfaToken,
    required String totpCode,
  }) async {
    final handler = SetupMfaHandler(
      authRepository: _authRepository,
    );

    final result = await handler.executeComplete(CompleteMfaSetupCommand(
      mfaToken: mfaToken,
      totpCode: totpCode,
      ipAddress: 'mobile',
      userAgent: 'GYMBRO App',
    ));

    if (result is AuthSuccess<MfaBackupCodes>) {
      return result.data;
    }
    return null;
  }

  Future<bool> disableMfa({required String password}) async {
    final handler = DisableMfaHandler(
      authRepository: _authRepository,
    );

    final result = await handler.execute(DisableMfaCommand(
      password: password,
      ipAddress: 'mobile',
      userAgent: 'GYMBRO App',
    ));

    return result is AuthSuccess<void>;
  }

  Future<bool> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    final result = await _authRepository.updateProfile(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
    );

    if (result is AuthSuccess<User>) {
      await _secureStorage.saveUser(result.data);
      state = AuthAuthenticated(result.data);
      return true;
    }

    return false;
  }

  Future<void> refreshCurrentUser() async {
    final result = await _authRepository.getCurrentUser();
    if (result is AuthSuccess<User>) {
      await _secureStorage.saveUser(result.data);
      state = AuthAuthenticated(result.data);
    }
  }
}
