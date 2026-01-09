import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/auth/auth.dart';
import '../../domain/auth/auth.dart' show User;
import '../auth/repositories/auth_repository_impl.dart';
import '../core/network/api_client.dart';
import '../core/network/auth_interceptor.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';
import 'core_providers.dart';

/// Provider for auth repository
final authRepositoryProvider = Provider<AuthRepositoryPort>((ref) {
  final dio = ref.watch(baseDioProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(dio: dio, secureStorage: secureStorage);
});

/// Provider for auth state notifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return AuthNotifier(
    authRepository: authRepository,
    secureStorage: secureStorage,
  );
});

/// Provider for authenticated Dio client with auth interceptor
final authenticatedDioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);
  final authNotifier = ref.read(authNotifierProvider.notifier);

  final authInterceptor = AuthInterceptor(
    secureStorage: storage,
    onTokenRefresh: () async {
      return authNotifier.refreshTokens();
    },
    onSessionExpired: () {
      authNotifier.handleSessionExpired();
    },
  );

  return ApiClient.createDio(interceptors: [authInterceptor]);
});

/// Selector for checking if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState is AuthAuthenticated;
});

/// Selector for current user (null if not authenticated)
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  if (authState is AuthAuthenticated) {
    return authState.user;
  }
  return null;
});
