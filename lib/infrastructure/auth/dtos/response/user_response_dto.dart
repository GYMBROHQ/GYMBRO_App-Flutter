import 'package:json_annotation/json_annotation.dart';

part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDto {
  final String id;
  final String email;
  final bool emailVerified;
  final bool isMfaEnabled;
  final String? fullName;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? avatarUrl;
  final String? createdAt;
  final String? updatedAt;

  const UserResponseDto({
    required this.id,
    required this.email,
    required this.emailVerified,
    required this.isMfaEnabled,
    this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseDtoToJson(this);
}
