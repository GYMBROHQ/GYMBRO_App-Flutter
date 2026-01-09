import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_response_dto.freezed.dart';
part 'payment_method_response_dto.g.dart';

/// DTO for payment method from Stripe API
/// Note: This matches the backend's flattened PaymentMethod structure
@freezed
class PaymentMethodResponseDto with _$PaymentMethodResponseDto {
  const factory PaymentMethodResponseDto({
    required String id,
    required String type,
    // Flattened card fields (from backend)
    String? last4,
    String? brand,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    bool? isDefault,
    // Legacy nested card object (for Stripe direct responses)
    PaymentMethodCardDto? card,
    @JsonKey(name: 'customer_id') String? customerId,
    int? created,
  }) = _PaymentMethodResponseDto;

  factory PaymentMethodResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseDtoFromJson(json);
}

/// DTO for card details within a payment method
@freezed
class PaymentMethodCardDto with _$PaymentMethodCardDto {
  const factory PaymentMethodCardDto({
    required String brand,
    required String last4,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    String? funding,
    String? country,
  }) = _PaymentMethodCardDto;

  factory PaymentMethodCardDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodCardDtoFromJson(json);
}

/// DTO for list of payment methods from API
@freezed
class PaymentMethodListDto with _$PaymentMethodListDto {
  const factory PaymentMethodListDto({
    required List<PaymentMethodResponseDto> methods,
  }) = _PaymentMethodListDto;

  factory PaymentMethodListDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodListDtoFromJson(json);
}

/// DTO for setup intent response from API
@freezed
class SetupIntentDto with _$SetupIntentDto {
  const factory SetupIntentDto({
    required String clientSecret,
  }) = _SetupIntentDto;

  factory SetupIntentDto.fromJson(Map<String, dynamic> json) =>
      _$SetupIntentDtoFromJson(json);
}
