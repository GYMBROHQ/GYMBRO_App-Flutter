// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_to_plan_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscribeToPlanRequestDtoImpl _$$SubscribeToPlanRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscribeToPlanRequestDtoImpl(
  gymId: json['gymId'] as String,
  planId: json['planId'] as String,
  paymentMethodId: json['paymentMethodId'] as String,
  promoCode: json['promoCode'] as String?,
  startDate: json['startDate'] as String?,
  paymentMethodType: json['paymentMethodType'] as String?,
);

Map<String, dynamic> _$$SubscribeToPlanRequestDtoImplToJson(
  _$SubscribeToPlanRequestDtoImpl instance,
) => <String, dynamic>{
  'gymId': instance.gymId,
  'planId': instance.planId,
  'paymentMethodId': instance.paymentMethodId,
  'promoCode': instance.promoCode,
  'startDate': instance.startDate,
  'paymentMethodType': instance.paymentMethodType,
};

_$RenewSubscriptionRequestDtoImpl _$$RenewSubscriptionRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RenewSubscriptionRequestDtoImpl(
  paymentMethodId: json['paymentMethodId'] as String,
);

Map<String, dynamic> _$$RenewSubscriptionRequestDtoImplToJson(
  _$RenewSubscriptionRequestDtoImpl instance,
) => <String, dynamic>{'paymentMethodId': instance.paymentMethodId};

_$CancelSubscriptionRequestDtoImpl _$$CancelSubscriptionRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CancelSubscriptionRequestDtoImpl(reason: json['reason'] as String);

Map<String, dynamic> _$$CancelSubscriptionRequestDtoImplToJson(
  _$CancelSubscriptionRequestDtoImpl instance,
) => <String, dynamic>{'reason': instance.reason};

_$PauseSubscriptionRequestDtoImpl _$$PauseSubscriptionRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PauseSubscriptionRequestDtoImpl(reason: json['reason'] as String);

Map<String, dynamic> _$$PauseSubscriptionRequestDtoImplToJson(
  _$PauseSubscriptionRequestDtoImpl instance,
) => <String, dynamic>{'reason': instance.reason};
