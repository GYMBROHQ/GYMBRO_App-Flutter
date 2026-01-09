import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/api_client.dart';
import '../core/storage/secure_storage_service.dart';
import '../../application/auth/ports/secure_storage_port.dart';

/// Provider for secure storage service
final secureStorageProvider = Provider<SecureStoragePort>((ref) {
  return SecureStorageService();
});

/// Provider for base Dio HTTP client (used for auth requests)
final baseDioProvider = Provider<Dio>((ref) {
  return ApiClient.createDio();
});
