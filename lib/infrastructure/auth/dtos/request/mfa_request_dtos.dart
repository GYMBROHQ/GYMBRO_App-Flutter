import 'package:json_annotation/json_annotation.dart';

part 'mfa_request_dtos.g.dart';

@JsonSerializable()
class MfaSetupCompleteRequestDto {
  final String mfaToken;
  final String totpCode;

  const MfaSetupCompleteRequestDto({
    required this.mfaToken,
    required this.totpCode,
  });

  factory MfaSetupCompleteRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MfaSetupCompleteRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MfaSetupCompleteRequestDtoToJson(this);
}

@JsonSerializable()
class MfaVerifyRequestDto {
  final String mfaToken;
  final String code;
  final String? deviceId;

  const MfaVerifyRequestDto({
    required this.mfaToken,
    required this.code,
    this.deviceId,
  });

  factory MfaVerifyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MfaVerifyRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MfaVerifyRequestDtoToJson(this);
}

@JsonSerializable()
class MfaDisableRequestDto {
  final String password;

  const MfaDisableRequestDto({
    required this.password,
  });

  factory MfaDisableRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MfaDisableRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MfaDisableRequestDtoToJson(this);
}
