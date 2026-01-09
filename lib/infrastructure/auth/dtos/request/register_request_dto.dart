import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  final String fullName;
  final String email;
  final String password;
  final String dateOfBirth;
  final bool acceptedTerms;

  const RegisterRequestDto({
    required this.fullName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.acceptedTerms,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}
