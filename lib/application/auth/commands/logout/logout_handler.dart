import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'logout_command.dart';

/// Handler for logout command
class LogoutHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  LogoutHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the logout command
  Future<AuthResult<void>> execute(LogoutCommand command) async {
    // Call logout on server
    final result = await _authRepository.logout(
      sessionId: command.sessionId,
      allDevices: command.allDevices,
    );

    // Always clear local storage on logout attempt
    await _secureStorage.clearAll();

    return result;
  }
}
