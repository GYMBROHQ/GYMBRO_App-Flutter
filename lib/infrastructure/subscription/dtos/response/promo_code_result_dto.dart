import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code_result_dto.freezed.dart';
part 'promo_code_result_dto.g.dart';

/// DTO for promo code application result from API
@freezed
class PromoCodeResultDto with _$PromoCodeResultDto {
  const factory PromoCodeResultDto({
    required String promoCode,
    required double discountAmount,
    required double originalPrice,
    required double finalPrice,
    String? message,
  }) = _PromoCodeResultDto;

  factory PromoCodeResultDto.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeResultDtoFromJson(json);
}
