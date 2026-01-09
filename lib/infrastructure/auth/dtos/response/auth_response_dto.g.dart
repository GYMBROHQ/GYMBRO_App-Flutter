// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensResponseDto _$TokensResponseDtoFromJson(Map<String, dynamic> json) =>
    TokensResponseDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpiresAt: json['accessTokenExpiresAt'] as String?,
      refreshTokenExpiresAt: json['refreshTokenExpiresAt'] as String?,
    );

Map<String, dynamic> _$TokensResponseDtoToJson(TokensResponseDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt,
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt,
    };

AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) =>
    AuthResponseDto(
      tokens: TokensResponseDto.fromJson(
        json['tokens'] as Map<String, dynamic>,
      ),
      user: UserResponseDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseDtoToJson(AuthResponseDto instance) =>
    <String, dynamic>{'tokens': instance.tokens, 'user': instance.user};

RefreshTokensResponseDto _$RefreshTokensResponseDtoFromJson(
  Map<String, dynamic> json,
) => RefreshTokensResponseDto(
  tokens: TokensResponseDto.fromJson(json['tokens'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RefreshTokensResponseDtoToJson(
  RefreshTokensResponseDto instance,
) => <String, dynamic>{'tokens': instance.tokens};

LoginMfaRequiredResponseDto _$LoginMfaRequiredResponseDtoFromJson(
  Map<String, dynamic> json,
) => LoginMfaRequiredResponseDto(
  mfaRequired: json['mfaRequired'] as bool,
  mfaToken: json['mfaToken'] as String,
);

Map<String, dynamic> _$LoginMfaRequiredResponseDtoToJson(
  LoginMfaRequiredResponseDto instance,
) => <String, dynamic>{
  'mfaRequired': instance.mfaRequired,
  'mfaToken': instance.mfaToken,
};
