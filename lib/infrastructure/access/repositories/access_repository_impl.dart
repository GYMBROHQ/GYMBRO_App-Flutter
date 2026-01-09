import 'package:dio/dio.dart';
import '../../../domain/access/entities/qr_code.dart';
import '../../../domain/access/repositories/access_repository.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/request/generate_qr_request_dto.dart';
import '../dtos/response/qr_code_response_dto.dart';
import '../dtos/response/access_log_response_dto.dart';
import '../mappers/qr_code_mapper.dart';
import '../mappers/access_log_mapper.dart';

/// Implementation of AccessRepository using Dio HTTP client
class AccessRepositoryImpl implements AccessRepository {
  final Dio dio;

  AccessRepositoryImpl({required this.dio});

  @override
  Future<QRCode> generateQRCode(GenerateQRRequest request) async {
    try {
      final requestDto = GenerateQRRequestDto(
        gymId: request.gymId,
        deviceFingerprint: request.deviceFingerprint,
      );

      final response = await dio.post(
        ApiEndpoints.generateQR,
        data: requestDto.toJson(),
      );

      final dto = QRCodeResponseDto.fromJson(response.data);
      return QRCodeMapper.toDomain(dto, subscriptionId: request.subscriptionId);
    } on DioException catch (e) {
      // If endpoint doesn't exist (404), generate mock QR code for testing
      if (e.response?.statusCode == 404) {
        return _generateMockQRCode(request);
      }
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to generate QR code: $e');
    }
  }

  /// Generate a mock QR code for frontend testing when backend is not ready
  QRCode _generateMockQRCode(GenerateQRRequest request) {
    final now = DateTime.now();
    final code = 'GYMBRO-${request.subscriptionId.substring(0, 8).toUpperCase()}-${now.millisecondsSinceEpoch}';

    return QRCode(
      code: code,
      subscriptionId: request.subscriptionId,
      gymId: request.gymId,
      status: QRCodeStatus.unused,
      expiresAt: now.add(const Duration(seconds: 60)),
      createdAt: now,
    );
  }

  @override
  Future<AccessLogsResult> getAccessLogs({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.accessLogs,
        queryParameters: {
          'gymId': gymId,
          'page': page,
          'limit': limit,
        },
      );

      final dto = AccessLogListResponseDto.fromJson(response.data);
      var result = AccessLogMapper.toAccessLogsResult(dto);

      // Filter by subscriptionId client-side if provided
      if (subscriptionId != null) {
        final filteredLogs = result.logs
            .where((log) => log.subscriptionId == subscriptionId)
            .toList();
        result = AccessLogsResult(
          logs: filteredLogs,
          totalCount: filteredLogs.length,
          page: page,
          limit: limit,
        );
      }

      return result;
    } on DioException catch (e) {
      // If endpoint doesn't exist (404), return empty mock data
      if (e.response?.statusCode == 404) {
        return AccessLogsResult(
          logs: [],
          totalCount: 0,
          page: page,
          limit: limit,
        );
      }
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load access logs: $e');
    }
  }

  @override
  Future<AccessLogsResult> getAllAccessLogs({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.accessLogs,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final dto = AccessLogListResponseDto.fromJson(response.data);
      return AccessLogMapper.toAccessLogsResult(dto);
    } on DioException catch (e) {
      // If endpoint doesn't exist (404), return empty mock data
      if (e.response?.statusCode == 404) {
        return AccessLogsResult(
          logs: [],
          totalCount: 0,
          page: page,
          limit: limit,
        );
      }
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load access logs: $e');
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final message = e.response!.data['message'] ?? 'Unknown error';

      switch (statusCode) {
        case 400:
          return Exception('Invalid request: $message');
        case 401:
          return Exception('Unauthorized: $message');
        case 403:
          return Exception('Forbidden: $message');
        case 404:
          return Exception('Not found: $message');
        case 409:
          return Exception('QR code already used or expired: $message');
        case 500:
          return Exception('Server error: $message');
        default:
          return Exception('Request failed: $message');
      }
    } else {
      return Exception('Network error: ${e.message}');
    }
  }
}
