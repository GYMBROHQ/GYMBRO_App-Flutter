import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_endpoints.dart';

/// Creates and configures the Dio HTTP client
class ApiClient {
  static Dio createDio({
    String? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add logging interceptor in debug mode
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrint('[Dio] $obj'),
      ),
    );

    // Add custom interceptors
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    return dio;
  }
}
