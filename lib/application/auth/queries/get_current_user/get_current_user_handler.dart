import '../../../../domain/auth/auth.dart';
import '../../ports/auth_repository_port.dart';
import '../../ports/secure_storage_port.dart';
import 'get_current_user_query.dart';

/// Handler for get current user query
class GetCurrentUserHandler {
  final AuthRepositoryPort _authRepository;
  final SecureStoragePort _secureStorage;

  GetCurrentUserHandler({
    required AuthRepositoryPort authRepository,
    required SecureStoragePort secureStorage,
  })  : _authRepository = authRepository,
        _secureStorage = secureStorage;

  /// Execute the get current user query
  Future<AuthResult<User>> execute(GetCurrentUserQuery query) async {
    // First try to get from local storage for quick access
    final cachedUser = await _secureStorage.getUser();

    // If we have a cached user, return it but also refresh in background
    if (cachedUser != null) {
      // Refresh user data from server in background
      _refreshUserInBackground();
      return AuthSuccess(cachedUser);
    }

    // No cached user, fetch from server
    final result = await _authRepository.getCurrentUser();

    // Cache the user if successful
    if (result is AuthSuccess<User>) {
      await _secureStorage.saveUser(result.data);
    }

    return result;
  }

  void _refreshUserInBackground() async {
    try {
      final result = await _authRepository.getCurrentUser();
      if (result is AuthSuccess<User>) {
        await _secureStorage.saveUser(result.data);
      }
    } catch (_) {
      // Ignore background refresh errors
    }
  }
}
