// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodResponseDtoImpl _$$PaymentMethodResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentMethodResponseDtoImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  last4: json['last4'] as String?,
  brand: json['brand'] as String?,
  expMonth: (json['exp_month'] as num?)?.toInt(),
  expYear: (json['exp_year'] as num?)?.toInt(),
  isDefault: json['isDefault'] as bool?,
  card: json['card'] == null
      ? null
      : PaymentMethodCardDto.fromJson(json['card'] as Map<String, dynamic>),
  customerId: json['customer_id'] as String?,
  created: (json['created'] as num?)?.toInt(),
);

Map<String, dynamic> _$$PaymentMethodResponseDtoImplToJson(
  _$PaymentMethodResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'last4': instance.last4,
  'brand': instance.brand,
  'exp_month': instance.expMonth,
  'exp_year': instance.expYear,
  'isDefault': instance.isDefault,
  'card': instance.card,
  'customer_id': instance.customerId,
  'created': instance.created,
};

_$PaymentMethodCardDtoImpl _$$PaymentMethodCardDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentMethodCardDtoImpl(
  brand: json['brand'] as String,
  last4: json['last4'] as String,
  expMonth: (json['exp_month'] as num?)?.toInt(),
  expYear: (json['exp_year'] as num?)?.toInt(),
  funding: json['funding'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$$PaymentMethodCardDtoImplToJson(
  _$PaymentMethodCardDtoImpl instance,
) => <String, dynamic>{
  'brand': instance.brand,
  'last4': instance.last4,
  'exp_month': instance.expMonth,
  'exp_year': instance.expYear,
  'funding': instance.funding,
  'country': instance.country,
};

_$PaymentMethodListDtoImpl _$$PaymentMethodListDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentMethodListDtoImpl(
  methods: (json['methods'] as List<dynamic>)
      .map((e) => PaymentMethodResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PaymentMethodListDtoImplToJson(
  _$PaymentMethodListDtoImpl instance,
) => <String, dynamic>{'methods': instance.methods};

_$SetupIntentDtoImpl _$$SetupIntentDtoImplFromJson(Map<String, dynamic> json) =>
    _$SetupIntentDtoImpl(clientSecret: json['clientSecret'] as String);

Map<String, dynamic> _$$SetupIntentDtoImplToJson(
  _$SetupIntentDtoImpl instance,
) => <String, dynamic>{'clientSecret': instance.clientSecret};
