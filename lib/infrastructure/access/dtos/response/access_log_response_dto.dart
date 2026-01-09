import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_log_response_dto.freezed.dart';
part 'access_log_response_dto.g.dart';

/// DTO for single access log entry from API
@freezed
class AccessLogResponseDto with _$AccessLogResponseDto {
  const factory AccessLogResponseDto({
    required String id,
    required String userId,
    String? userName,
    required String gymId,
    String? gymName,
    required String subscriptionId,
    required String accessType,
    required String accessMethod,
    required String result,
    String? denialReason,
    String? verifiedByStaffId,
    String? verifiedByStaffName,
    String? deviceId,
    required String accessedAt,
  }) = _AccessLogResponseDto;

  factory AccessLogResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccessLogResponseDtoFromJson(json);
}

/// DTO for paginated access logs list from API
@freezed
class AccessLogListResponseDto with _$AccessLogListResponseDto {
  const factory AccessLogListResponseDto({
    required List<AccessLogResponseDto> items,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _AccessLogListResponseDto;

  factory AccessLogListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccessLogListResponseDtoFromJson(json);
}
