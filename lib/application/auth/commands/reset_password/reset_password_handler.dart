import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import 'reset_password_command.dart';

/// Handler for reset password command
class ResetPasswordHandler {
  final AuthRepositoryPort _authRepository;

  ResetPasswordHandler({
    required AuthRepositoryPort authRepository,
  }) : _authRepository = authRepository;

  /// Execute the reset password command
  Future<AuthResult<void>> execute(ResetPasswordCommand command) async {
    // Validate password strength
    if (!Password.isValid(command.newPassword)) {
      final failures = Password.getFailedRequirements(command.newPassword);
      return AuthFailure('Password requirements not met: ${failures.join(', ')}');
    }

    return _authRepository.resetPassword(
      token: command.token,
      newPassword: command.newPassword,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );
  }
}
