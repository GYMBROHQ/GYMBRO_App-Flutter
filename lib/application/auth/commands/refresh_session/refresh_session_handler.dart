import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'refresh_session_command.dart';

/// Handler for refresh session command
class RefreshSessionHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  RefreshSessionHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the refresh session command
  Future<AuthResult<AuthTokens>> execute(RefreshSessionCommand command) async {
    final result = await _authRepository.refreshTokens(
      refreshToken: command.refreshToken,
      ipAddress: command.ipAddress,
      userAgent: command.userAgent,
    );

    // If successful, save new tokens to storage
    if (result is AuthSuccess<AuthTokens>) {
      await _secureStorage.saveTokens(result.data);
    }

    return result;
  }
}
