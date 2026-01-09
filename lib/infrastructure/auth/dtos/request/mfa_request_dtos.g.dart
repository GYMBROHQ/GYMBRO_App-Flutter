// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mfa_request_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MfaSetupCompleteRequestDto _$MfaSetupCompleteRequestDtoFromJson(
  Map<String, dynamic> json,
) => MfaSetupCompleteRequestDto(
  mfaToken: json['mfaToken'] as String,
  totpCode: json['totpCode'] as String,
);

Map<String, dynamic> _$MfaSetupCompleteRequestDtoToJson(
  MfaSetupCompleteRequestDto instance,
) => <String, dynamic>{
  'mfaToken': instance.mfaToken,
  'totpCode': instance.totpCode,
};

MfaVerifyRequestDto _$MfaVerifyRequestDtoFromJson(Map<String, dynamic> json) =>
    MfaVerifyRequestDto(
      mfaToken: json['mfaToken'] as String,
      code: json['code'] as String,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$MfaVerifyRequestDtoToJson(
  MfaVerifyRequestDto instance,
) => <String, dynamic>{
  'mfaToken': instance.mfaToken,
  'code': instance.code,
  'deviceId': instance.deviceId,
};

MfaDisableRequestDto _$MfaDisableRequestDtoFromJson(
  Map<String, dynamic> json,
) => MfaDisableRequestDto(password: json['password'] as String);

Map<String, dynamic> _$MfaDisableRequestDtoToJson(
  MfaDisableRequestDto instance,
) => <String, dynamic>{'password': instance.password};
