// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      acceptedTerms: json['acceptedTerms'] as bool,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'dateOfBirth': instance.dateOfBirth,
      'acceptedTerms': instance.acceptedTerms,
    };
