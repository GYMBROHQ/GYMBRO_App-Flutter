import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_response_dto.freezed.dart';
part 'subscription_response_dto.g.dart';

/// DTO for subscription price from API
@freezed
class SubscriptionPriceDto with _$SubscriptionPriceDto {
  const factory SubscriptionPriceDto({
    required double amount,
    required String currency,
  }) = _SubscriptionPriceDto;

  factory SubscriptionPriceDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPriceDtoFromJson(json);
}

/// DTO for discount information from API
@freezed
class DiscountDto with _$DiscountDto {
  const factory DiscountDto({
    required double amount,
    String? promoCode,
  }) = _DiscountDto;

  factory DiscountDto.fromJson(Map<String, dynamic> json) =>
      _$DiscountDtoFromJson(json);
}

/// DTO for subscription response from API
@freezed
class SubscriptionResponseDto with _$SubscriptionResponseDto {
  const factory SubscriptionResponseDto({
    required String id,
    required String authId,
    required String gymId,
    required String gymName,
    required String planId,
    required String planName,
    required String status,
    required String startDate,
    required String endDate,
    required int daysRemaining,
    required SubscriptionPriceDto price,
    DiscountDto? discountApplied,
    required String confirmationNumber,
    required int accessCount,
    required bool isInGracePeriod,
    required bool canRenew,
    required String createdAt,
    required String updatedAt,
    String? paymentMethodType,
    String? pendingPaymentExpiresAt,
  }) = _SubscriptionResponseDto;

  factory SubscriptionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseDtoFromJson(json);
}

/// DTO for list of subscriptions from API
@freezed
class SubscriptionListResponseDto with _$SubscriptionListResponseDto {
  const factory SubscriptionListResponseDto({
    required List<SubscriptionResponseDto> subscriptions,
    required int totalCount,
  }) = _SubscriptionListResponseDto;

  factory SubscriptionListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListResponseDtoFromJson(json);
}

/// DTO for subscription result (after subscribe/renew) from API
@freezed
class SubscriptionResultDto with _$SubscriptionResultDto {
  const factory SubscriptionResultDto({
    required SubscriptionResponseDto subscription,
    String? message,
  }) = _SubscriptionResultDto;

  factory SubscriptionResultDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResultDtoFromJson(json);
}
