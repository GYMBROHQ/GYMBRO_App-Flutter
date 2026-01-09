import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_dto.g.dart';

@JsonSerializable()
class UpdateProfileRequestDto {
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const UpdateProfileRequestDto({
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });

  factory UpdateProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestDtoToJson(this);
}
