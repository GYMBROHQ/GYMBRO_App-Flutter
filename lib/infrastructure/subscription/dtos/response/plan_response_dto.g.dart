// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceDtoImpl _$$PriceDtoImplFromJson(Map<String, dynamic> json) =>
    _$PriceDtoImpl(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$PriceDtoImplToJson(_$PriceDtoImpl instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};

_$DurationDtoImpl _$$DurationDtoImplFromJson(Map<String, dynamic> json) =>
    _$DurationDtoImpl(
      value: (json['value'] as num).toInt(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$DurationDtoImplToJson(_$DurationDtoImpl instance) =>
    <String, dynamic>{'value': instance.value, 'unit': instance.unit};

_$PlanResponseDtoImpl _$$PlanResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PlanResponseDtoImpl(
  id: json['id'] as String,
  gymId: json['gymId'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  price: PriceDto.fromJson(json['price'] as Map<String, dynamic>),
  duration: DurationDto.fromJson(json['duration'] as Map<String, dynamic>),
  features: (json['features'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  accessType: json['accessType'] as String,
  maxVisitsPerPeriod: (json['maxVisitsPerPeriod'] as num?)?.toInt(),
  visitPeriod: json['visitPeriod'] as String?,
  isActive: json['isActive'] as bool,
  sortOrder: (json['sortOrder'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$$PlanResponseDtoImplToJson(
  _$PlanResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'gymId': instance.gymId,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'duration': instance.duration,
  'features': instance.features,
  'accessType': instance.accessType,
  'maxVisitsPerPeriod': instance.maxVisitsPerPeriod,
  'visitPeriod': instance.visitPeriod,
  'isActive': instance.isActive,
  'sortOrder': instance.sortOrder,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_$PlanListResponseDtoImpl _$$PlanListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PlanListResponseDtoImpl(
  plans: (json['plans'] as List<dynamic>)
      .map((e) => PlanResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$$PlanListResponseDtoImplToJson(
  _$PlanListResponseDtoImpl instance,
) => <String, dynamic>{
  'plans': instance.plans,
  'totalCount': instance.totalCount,
};
