// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionPriceDtoImpl _$$SubscriptionPriceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionPriceDtoImpl(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$$SubscriptionPriceDtoImplToJson(
  _$SubscriptionPriceDtoImpl instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
};

_$DiscountDtoImpl _$$DiscountDtoImplFromJson(Map<String, dynamic> json) =>
    _$DiscountDtoImpl(
      amount: (json['amount'] as num).toDouble(),
      promoCode: json['promoCode'] as String?,
    );

Map<String, dynamic> _$$DiscountDtoImplToJson(_$DiscountDtoImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'promoCode': instance.promoCode,
    };

_$SubscriptionResponseDtoImpl _$$SubscriptionResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionResponseDtoImpl(
  id: json['id'] as String,
  authId: json['authId'] as String,
  gymId: json['gymId'] as String,
  gymName: json['gymName'] as String,
  planId: json['planId'] as String,
  planName: json['planName'] as String,
  status: json['status'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
  daysRemaining: (json['daysRemaining'] as num).toInt(),
  price: SubscriptionPriceDto.fromJson(json['price'] as Map<String, dynamic>),
  discountApplied: json['discountApplied'] == null
      ? null
      : DiscountDto.fromJson(json['discountApplied'] as Map<String, dynamic>),
  confirmationNumber: json['confirmationNumber'] as String,
  accessCount: (json['accessCount'] as num).toInt(),
  isInGracePeriod: json['isInGracePeriod'] as bool,
  canRenew: json['canRenew'] as bool,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  paymentMethodType: json['paymentMethodType'] as String?,
  pendingPaymentExpiresAt: json['pendingPaymentExpiresAt'] as String?,
);

Map<String, dynamic> _$$SubscriptionResponseDtoImplToJson(
  _$SubscriptionResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'authId': instance.authId,
  'gymId': instance.gymId,
  'gymName': instance.gymName,
  'planId': instance.planId,
  'planName': instance.planName,
  'status': instance.status,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'daysRemaining': instance.daysRemaining,
  'price': instance.price,
  'discountApplied': instance.discountApplied,
  'confirmationNumber': instance.confirmationNumber,
  'accessCount': instance.accessCount,
  'isInGracePeriod': instance.isInGracePeriod,
  'canRenew': instance.canRenew,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'paymentMethodType': instance.paymentMethodType,
  'pendingPaymentExpiresAt': instance.pendingPaymentExpiresAt,
};

_$SubscriptionListResponseDtoImpl _$$SubscriptionListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionListResponseDtoImpl(
  subscriptions: (json['subscriptions'] as List<dynamic>)
      .map((e) => SubscriptionResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$$SubscriptionListResponseDtoImplToJson(
  _$SubscriptionListResponseDtoImpl instance,
) => <String, dynamic>{
  'subscriptions': instance.subscriptions,
  'totalCount': instance.totalCount,
};

_$SubscriptionResultDtoImpl _$$SubscriptionResultDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionResultDtoImpl(
  subscription: SubscriptionResponseDto.fromJson(
    json['subscription'] as Map<String, dynamic>,
  ),
  message: json['message'] as String?,
);

Map<String, dynamic> _$$SubscriptionResultDtoImplToJson(
  _$SubscriptionResultDtoImpl instance,
) => <String, dynamic>{
  'subscription': instance.subscription,
  'message': instance.message,
};
