import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_promo_code_request_dto.freezed.dart';
part 'apply_promo_code_request_dto.g.dart';

/// DTO for applying promo code request to API
@freezed
class ApplyPromoCodeRequestDto with _$ApplyPromoCodeRequestDto {
  const factory ApplyPromoCodeRequestDto({
    required String promoCode,
  }) = _ApplyPromoCodeRequestDto;

  factory ApplyPromoCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyPromoCodeRequestDtoFromJson(json);
}
