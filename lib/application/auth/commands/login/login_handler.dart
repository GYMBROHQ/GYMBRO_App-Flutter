import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'login_command.dart';

/// Handler for login command
class LoginHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  LoginHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the login command
  Future<AuthResult<LoginResult>> execute(LoginCommand command) async {
    // Validate email format
    if (!Email.isValid(command.email)) {
      return const AuthFailure('Invalid email format');
    }

    // Execute login via repository
    final result = await _authRepository.login(
      email: command.email,
      password: command.password,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
      deviceId: command.deviceId,
    );

    // If successful with tokens, save to storage
    if (result is AuthSuccess<LoginResult>) {
      final loginResult = result.data;
      if (loginResult is LoginSuccessResult) {
        await _secureStorage.saveTokens(loginResult.tokens);
        await _secureStorage.saveUser(loginResult.user);
      }
    }

    return result;
  }
}
