// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mfa_response_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MfaSetupInitResponseDto _$MfaSetupInitResponseDtoFromJson(
  Map<String, dynamic> json,
) => MfaSetupInitResponseDto(
  secret: json['secret'] as String,
  qrCodeUri: json['qrCodeUri'] as String,
  mfaToken: json['mfaToken'] as String,
);

Map<String, dynamic> _$MfaSetupInitResponseDtoToJson(
  MfaSetupInitResponseDto instance,
) => <String, dynamic>{
  'secret': instance.secret,
  'qrCodeUri': instance.qrCodeUri,
  'mfaToken': instance.mfaToken,
};

MfaSetupCompleteResponseDto _$MfaSetupCompleteResponseDtoFromJson(
  Map<String, dynamic> json,
) => MfaSetupCompleteResponseDto(
  success: json['success'] as bool,
  backupCodes: (json['backupCodes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$MfaSetupCompleteResponseDtoToJson(
  MfaSetupCompleteResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'backupCodes': instance.backupCodes,
};

DisableMfaResponseDto _$DisableMfaResponseDtoFromJson(
  Map<String, dynamic> json,
) => DisableMfaResponseDto(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$DisableMfaResponseDtoToJson(
  DisableMfaResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
