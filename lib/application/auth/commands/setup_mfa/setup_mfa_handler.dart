import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import 'setup_mfa_command.dart';

/// Handler for MFA setup commands
class SetupMfaHandler {
  final AuthRepositoryPort _authRepository;

  SetupMfaHandler({
    required AuthRepositoryPort authRepository,
  }) : _authRepository = authRepository;

  /// Execute initiate MFA setup
  Future<AuthResult<MfaSetup>> executeInitiate(InitiateMfaSetupCommand command) async {
    return _authRepository.initiateMfaSetup();
  }

  /// Execute complete MFA setup
  Future<AuthResult<MfaBackupCodes>> executeComplete(CompleteMfaSetupCommand command) async {
    // Validate TOTP code format
    if (!TotpCode.isValid(command.totpCode)) {
      return const AuthFailure('Invalid TOTP code format');
    }

    return _authRepository.completeMfaSetup(
      mfaToken: command.mfaToken,
      totpCode: command.totpCode,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );
  }
}
