import 'package:json_annotation/json_annotation.dart';
import 'user_response_dto.dart';

part 'auth_response_dto.g.dart';

/// Tokens data from the backend
@JsonSerializable()
class TokensResponseDto {
  final String accessToken;
  final String refreshToken;
  final String? accessTokenExpiresAt;
  final String? refreshTokenExpiresAt;

  const TokensResponseDto({
    required this.accessToken,
    required this.refreshToken,
    this.accessTokenExpiresAt,
    this.refreshTokenExpiresAt,
  });

  factory TokensResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokensResponseDtoToJson(this);
}

/// Response for successful login/register with tokens
@JsonSerializable()
class AuthResponseDto {
  final TokensResponseDto tokens;
  final UserResponseDto user;

  const AuthResponseDto({
    required this.tokens,
    required this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}

/// Response for token refresh
@JsonSerializable()
class RefreshTokensResponseDto {
  final TokensResponseDto tokens;

  const RefreshTokensResponseDto({
    required this.tokens,
  });

  factory RefreshTokensResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokensResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokensResponseDtoToJson(this);
}

/// Response when login requires MFA
@JsonSerializable()
class LoginMfaRequiredResponseDto {
  final bool mfaRequired;
  final String mfaToken;

  const LoginMfaRequiredResponseDto({
    required this.mfaRequired,
    required this.mfaToken,
  });

  factory LoginMfaRequiredResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginMfaRequiredResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginMfaRequiredResponseDtoToJson(this);
}
