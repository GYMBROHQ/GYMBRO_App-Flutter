import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code_response_dto.freezed.dart';
part 'qr_code_response_dto.g.dart';

/// DTO for QR code response from API
@freezed
class QRCodeResponseDto with _$QRCodeResponseDto {
  const factory QRCodeResponseDto({
    required String id,
    required String payload,
    required String expiresAt,
    required int remainingSeconds,
    required String status,
    required String gymId,
    String? gymName,
  }) = _QRCodeResponseDto;

  factory QRCodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$QRCodeResponseDtoFromJson(json);
}
