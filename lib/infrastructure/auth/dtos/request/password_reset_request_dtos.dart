import 'package:json_annotation/json_annotation.dart';

part 'password_reset_request_dtos.g.dart';

@JsonSerializable()
class RequestPasswordResetDto {
  final String email;

  const RequestPasswordResetDto({
    required this.email,
  });

  factory RequestPasswordResetDto.fromJson(Map<String, dynamic> json) =>
      _$RequestPasswordResetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPasswordResetDtoToJson(this);
}

@JsonSerializable()
class ResetPasswordDto {
  final String token;
  final String newPassword;

  const ResetPasswordDto({
    required this.token,
    required this.newPassword,
  });

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);
}
