import '../entities/access_log.dart';
import '../entities/qr_code.dart';

/// Request data for generating a QR code
class GenerateQRRequest {
  final String subscriptionId;
  final String gymId;
  final String deviceFingerprint;

  const GenerateQRRequest({
    required this.subscriptionId,
    required this.gymId,
    required this.deviceFingerprint,
  });
}

/// Result object for paginated access logs
class AccessLogsResult {
  final List<AccessLog> logs;
  final int totalCount;
  final int page;
  final int limit;

  const AccessLogsResult({
    required this.logs,
    required this.totalCount,
    required this.page,
    required this.limit,
  });

  bool get hasMore => (page * limit) < totalCount;
}

/// Repository interface for managing gym access
abstract class AccessRepository {
  /// Generate a QR code for gym access
  /// QR codes are valid for 60 seconds
  Future<QRCode> generateQRCode(GenerateQRRequest request);

  /// Get access logs for a specific gym and user
  /// Filters logs by gymId (required) and optionally by userId
  /// When subscriptionId is provided, only logs for that subscription will be shown
  /// Supports pagination with [page] and [limit]
  Future<AccessLogsResult> getAccessLogs({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  });

  /// Get all access logs for the authenticated user across all gyms
  /// Supports pagination with [page] and [limit]
  Future<AccessLogsResult> getAllAccessLogs({
    int page = 1,
    int limit = 20,
  });
}
