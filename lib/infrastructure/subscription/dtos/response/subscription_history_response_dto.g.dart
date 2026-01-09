// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionHistoryResponseDtoImpl
_$$SubscriptionHistoryResponseDtoImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionHistoryResponseDtoImpl(
      id: json['id'] as String,
      subscriptionId: json['subscriptionId'] as String,
      eventType: json['eventType'] as String,
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      occurredAt: json['occurredAt'] as String,
    );

Map<String, dynamic> _$$SubscriptionHistoryResponseDtoImplToJson(
  _$SubscriptionHistoryResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'subscriptionId': instance.subscriptionId,
  'eventType': instance.eventType,
  'description': instance.description,
  'metadata': instance.metadata,
  'occurredAt': instance.occurredAt,
};

_$SubscriptionHistoryListDtoImpl _$$SubscriptionHistoryListDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionHistoryListDtoImpl(
  history: (json['history'] as List<dynamic>)
      .map(
        (e) =>
            SubscriptionHistoryResponseDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$$SubscriptionHistoryListDtoImplToJson(
  _$SubscriptionHistoryListDtoImpl instance,
) => <String, dynamic>{
  'history': instance.history,
  'totalCount': instance.totalCount,
};
