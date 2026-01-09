import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'register_command.dart';

/// Handler for register command
class RegisterHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  RegisterHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the register command
  Future<AuthResult<LoginSuccessResult>> execute(RegisterCommand command) async {
    // Validate email format
    if (!Email.isValid(command.email)) {
      return const AuthFailure('Invalid email format');
    }

    // Validate password strength
    if (!Password.isValid(command.password)) {
      final failures = Password.getFailedRequirements(command.password);
      return AuthFailure('Password requirements not met: ${failures.join(', ')}');
    }

    // Execute registration via repository
    final result = await _authRepository.register(
      fullName: command.fullName,
      email: command.email,
      password: command.password,
      dateOfBirth: command.dateOfBirth,
      termsAcceptedAt: command.termsAcceptedAt,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );

    // If successful, save tokens to storage
    if (result is AuthSuccess<LoginSuccessResult>) {
      await _secureStorage.saveTokens(result.data.tokens);
      await _secureStorage.saveUser(result.data.user);
    }

    return result;
  }
}
