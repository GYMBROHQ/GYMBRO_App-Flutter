import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_qr_request_dto.freezed.dart';
part 'generate_qr_request_dto.g.dart';

/// DTO for generating QR code request to API
@freezed
class GenerateQRRequestDto with _$GenerateQRRequestDto {
  const factory GenerateQRRequestDto({
    required String gymId,
    required String deviceFingerprint,
  }) = _GenerateQRRequestDto;

  factory GenerateQRRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GenerateQRRequestDtoFromJson(json);
}
