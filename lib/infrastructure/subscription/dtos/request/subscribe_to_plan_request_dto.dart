import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_to_plan_request_dto.freezed.dart';
part 'subscribe_to_plan_request_dto.g.dart';

/// DTO for subscribing to a plan request
@freezed
class SubscribeToPlanRequestDto with _$SubscribeToPlanRequestDto {
  const factory SubscribeToPlanRequestDto({
    required String gymId,
    required String planId,
    required String paymentMethodId,
    String? promoCode,
    String? startDate,
    String? paymentMethodType,
  }) = _SubscribeToPlanRequestDto;

  factory SubscribeToPlanRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubscribeToPlanRequestDtoFromJson(json);
}

/// DTO for renewing a subscription request
@freezed
class RenewSubscriptionRequestDto with _$RenewSubscriptionRequestDto {
  const factory RenewSubscriptionRequestDto({
    required String paymentMethodId,
  }) = _RenewSubscriptionRequestDto;

  factory RenewSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionRequestDtoFromJson(json);
}

/// DTO for cancelling a subscription request
@freezed
class CancelSubscriptionRequestDto with _$CancelSubscriptionRequestDto {
  const factory CancelSubscriptionRequestDto({
    required String reason,
  }) = _CancelSubscriptionRequestDto;

  factory CancelSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CancelSubscriptionRequestDtoFromJson(json);
}

/// DTO for pausing a subscription request
@freezed
class PauseSubscriptionRequestDto with _$PauseSubscriptionRequestDto {
  const factory PauseSubscriptionRequestDto({
    required String reason,
  }) = _PauseSubscriptionRequestDto;

  factory PauseSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PauseSubscriptionRequestDtoFromJson(json);
}
