// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QRCodeResponseDtoImpl _$$QRCodeResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$QRCodeResponseDtoImpl(
  id: json['id'] as String,
  payload: json['payload'] as String,
  expiresAt: json['expiresAt'] as String,
  remainingSeconds: (json['remainingSeconds'] as num).toInt(),
  status: json['status'] as String,
  gymId: json['gymId'] as String,
  gymName: json['gymName'] as String?,
);

Map<String, dynamic> _$$QRCodeResponseDtoImplToJson(
  _$QRCodeResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'payload': instance.payload,
  'expiresAt': instance.expiresAt,
  'remainingSeconds': instance.remainingSeconds,
  'status': instance.status,
  'gymId': instance.gymId,
  'gymName': instance.gymName,
};
