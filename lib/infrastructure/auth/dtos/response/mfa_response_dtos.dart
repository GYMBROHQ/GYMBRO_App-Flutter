import 'package:json_annotation/json_annotation.dart';

part 'mfa_response_dtos.g.dart';

/// Response for MFA setup initiation
@JsonSerializable()
class MfaSetupInitResponseDto {
  final String secret;
  final String qrCodeUri;
  final String mfaToken;

  const MfaSetupInitResponseDto({
    required this.secret,
    required this.qrCodeUri,
    required this.mfaToken,
  });

  factory MfaSetupInitResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MfaSetupInitResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MfaSetupInitResponseDtoToJson(this);
}

/// Response for MFA setup completion
@JsonSerializable()
class MfaSetupCompleteResponseDto {
  final bool success;
  final List<String> backupCodes;

  const MfaSetupCompleteResponseDto({
    required this.success,
    required this.backupCodes,
  });

  factory MfaSetupCompleteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MfaSetupCompleteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MfaSetupCompleteResponseDtoToJson(this);
}

/// Response for MFA disable
@JsonSerializable()
class DisableMfaResponseDto {
  final bool success;
  final String message;

  const DisableMfaResponseDto({
    required this.success,
    required this.message,
  });

  factory DisableMfaResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DisableMfaResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DisableMfaResponseDtoToJson(this);
}
