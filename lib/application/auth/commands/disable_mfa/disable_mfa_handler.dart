import '../../ports/auth_repository_port.dart';
import 'disable_mfa_command.dart';

/// Handler for disable MFA command
class DisableMfaHandler {
  final AuthRepositoryPort _authRepository;

  DisableMfaHandler({
    required AuthRepositoryPort authRepository,
  }) : _authRepository = authRepository;

  /// Execute the disable MFA command
  Future<AuthResult<void>> execute(DisableMfaCommand command) async {
    return _authRepository.disableMfa(
      password: command.password,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );
  }
}
