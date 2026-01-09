import 'dart:async';
import 'package:dio/dio.dart';
import '../../../application/auth/ports/secure_storage_port.dart';
import 'api_endpoints.dart';

/// Interceptor that handles auth token injection and refresh
class AuthInterceptor extends Interceptor {
  final SecureStoragePort _secureStorage;
  final Future<bool> Function() _onTokenRefresh;
  final void Function() _onSessionExpired;

  bool _isRefreshing = false;
  final List<_RetryRequest> _pendingRequests = [];

  AuthInterceptor({
    required SecureStoragePort secureStorage,
    required Future<bool> Function() onTokenRefresh,
    required void Function() onSessionExpired,
  })  : _secureStorage = secureStorage,
        _onTokenRefresh = onTokenRefresh,
        _onSessionExpired = onSessionExpired;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth header for public endpoints
    if (_isPublicEndpoint(options.path)) {
      handler.next(options);
      return;
    }

    // Add auth token
    final token = await _secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only handle 401 errors for authenticated endpoints
    if (err.response?.statusCode != 401 || _isPublicEndpoint(err.requestOptions.path)) {
      handler.next(err);
      return;
    }

    // If already refreshing, queue the request
    if (_isRefreshing) {
      _pendingRequests.add(_RetryRequest(
        requestOptions: err.requestOptions,
        handler: handler,
      ));
      return;
    }

    _isRefreshing = true;

    try {
      // Attempt to refresh token
      final refreshed = await _onTokenRefresh();

      if (refreshed) {
        // Retry original request with new token
        final newToken = await _secureStorage.getAccessToken();
        if (newToken != null) {
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        }

        // Retry the original request with a new Dio instance
        final dio = Dio(BaseOptions(
          baseUrl: err.requestOptions.baseUrl,
          connectTimeout: err.requestOptions.connectTimeout,
          receiveTimeout: err.requestOptions.receiveTimeout,
          sendTimeout: err.requestOptions.sendTimeout,
        ));

        try {
          final response = await dio.fetch(err.requestOptions);
          handler.resolve(response);

          // Retry pending requests
          _retryPendingRequests();
        } catch (retryError) {
          handler.reject(retryError is DioException ? retryError : DioException(
            requestOptions: err.requestOptions,
            error: retryError,
          ));
        }
      } else {
        // Refresh failed, session expired
        _onSessionExpired();
        _clearPendingRequests(err);
        handler.next(err);
      }
    } catch (e) {
      // Refresh failed
      _onSessionExpired();
      _clearPendingRequests(err);
      handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.register,
      ApiEndpoints.refresh,
      ApiEndpoints.mfaVerify,
      ApiEndpoints.passwordRequestReset,
      ApiEndpoints.passwordReset,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }

  void _retryPendingRequests() async {
    final requests = List<_RetryRequest>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final request in requests) {
      try {
        final newToken = await _secureStorage.getAccessToken();
        if (newToken != null) {
          request.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        }

        final dio = Dio(BaseOptions(
          baseUrl: request.requestOptions.baseUrl,
          connectTimeout: request.requestOptions.connectTimeout,
          receiveTimeout: request.requestOptions.receiveTimeout,
          sendTimeout: request.requestOptions.sendTimeout,
        ));
        final response = await dio.fetch(request.requestOptions);
        request.handler.resolve(response);
      } catch (e) {
        request.handler.reject(
          DioException(
            requestOptions: request.requestOptions,
            error: e,
          ),
        );
      }
    }
  }

  void _clearPendingRequests(DioException error) {
    for (final request in _pendingRequests) {
      request.handler.reject(error);
    }
    _pendingRequests.clear();
  }
}

class _RetryRequest {
  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;

  _RetryRequest({
    required this.requestOptions,
    required this.handler,
  });
}
