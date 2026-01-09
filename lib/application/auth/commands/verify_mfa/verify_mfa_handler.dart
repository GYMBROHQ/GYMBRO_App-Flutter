import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'verify_mfa_command.dart';

/// Handler for verify MFA command
class VerifyMfaHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  VerifyMfaHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the verify MFA command
  Future<AuthResult<LoginSuccessResult>> execute(VerifyMfaCommand command) async {
    final result = await _authRepository.verifyMfa(
      mfaToken: command.mfaToken,
      code: command.code,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
      deviceId: command.deviceId,
    );

    // If successful, save tokens to storage
    if (result is AuthSuccess<LoginSuccessResult>) {
      await _secureStorage.saveTokens(result.data.tokens);
      await _secureStorage.saveUser(result.data.user);
    }

    return result;
  }
}
