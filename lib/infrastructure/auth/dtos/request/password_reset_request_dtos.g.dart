// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPasswordResetDto _$RequestPasswordResetDtoFromJson(
  Map<String, dynamic> json,
) => RequestPasswordResetDto(email: json['email'] as String);

Map<String, dynamic> _$RequestPasswordResetDtoToJson(
  RequestPasswordResetDto instance,
) => <String, dynamic>{'email': instance.email};

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) =>
    ResetPasswordDto(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordDtoToJson(ResetPasswordDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
