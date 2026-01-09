import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import 'request_password_reset_command.dart';

/// Handler for request password reset command
class RequestPasswordResetHandler {
  final AuthRepositoryPort _authRepository;

  RequestPasswordResetHandler({
    required AuthRepositoryPort authRepository,
  }) : _authRepository = authRepository;

  /// Execute the request password reset command
  Future<AuthResult<void>> execute(RequestPasswordResetCommand command) async {
    // Validate email format
    if (!Email.isValid(command.email)) {
      return const AuthFailure('Invalid email format');
    }

    return _authRepository.requestPasswordReset(
      email: command.email,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );
  }
}
