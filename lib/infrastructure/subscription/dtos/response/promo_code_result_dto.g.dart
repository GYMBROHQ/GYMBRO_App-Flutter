// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeResultDtoImpl _$$PromoCodeResultDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PromoCodeResultDtoImpl(
  promoCode: json['promoCode'] as String,
  discountAmount: (json['discountAmount'] as num).toDouble(),
  originalPrice: (json['originalPrice'] as num).toDouble(),
  finalPrice: (json['finalPrice'] as num).toDouble(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$PromoCodeResultDtoImplToJson(
  _$PromoCodeResultDtoImpl instance,
) => <String, dynamic>{
  'promoCode': instance.promoCode,
  'discountAmount': instance.discountAmount,
  'originalPrice': instance.originalPrice,
  'finalPrice': instance.finalPrice,
  'message': instance.message,
};
