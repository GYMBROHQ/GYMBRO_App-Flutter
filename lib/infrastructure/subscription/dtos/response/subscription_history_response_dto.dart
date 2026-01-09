import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_history_response_dto.freezed.dart';
part 'subscription_history_response_dto.g.dart';

/// DTO for subscription history event from API
@freezed
class SubscriptionHistoryResponseDto with _$SubscriptionHistoryResponseDto {
  const factory SubscriptionHistoryResponseDto({
    required String id,
    required String subscriptionId,
    required String eventType,
    required String description,
    Map<String, dynamic>? metadata,
    required String occurredAt,
  }) = _SubscriptionHistoryResponseDto;

  factory SubscriptionHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionHistoryResponseDtoFromJson(json);
}

/// DTO for list of subscription history events from API
@freezed
class SubscriptionHistoryListDto with _$SubscriptionHistoryListDto {
  const factory SubscriptionHistoryListDto({
    required List<SubscriptionHistoryResponseDto> history,
    required int totalCount,
  }) = _SubscriptionHistoryListDto;

  factory SubscriptionHistoryListDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionHistoryListDtoFromJson(json);
}
