import 'package:gymbro/domain/access/entities/access_log.dart';
import 'package:gymbro/domain/access/repositories/access_repository.dart';
import '../dtos/response/access_log_response_dto.dart';

/// Mapper for converting access log DTOs to domain entities
class AccessLogMapper {
  /// Convert single DTO to domain entity
  static AccessLog toDomain(AccessLogResponseDto dto) {
    return AccessLog(
      id: dto.id,
      subscriptionId: dto.subscriptionId,
      gymId: dto.gymId,
      gymName: dto.gymName ?? 'Unknown Gym',
      result: _mapResult(dto.result),
      timestamp: DateTime.parse(dto.accessedAt),
      deniedReason: dto.denialReason,
    );
  }

  /// Convert list DTO to domain result
  static AccessLogsResult toAccessLogsResult(AccessLogListResponseDto dto) {
    return AccessLogsResult(
      logs: dto.items.map((log) => toDomain(log)).toList(),
      totalCount: dto.total,
      page: dto.page,
      limit: dto.limit,
    );
  }

  /// Map string result to enum
  static AccessResult _mapResult(String result) {
    switch (result.toLowerCase()) {
      case 'granted':
        return AccessResult.granted;
      case 'denied':
        return AccessResult.denied;
      default:
        return AccessResult.denied;
    }
  }
}
