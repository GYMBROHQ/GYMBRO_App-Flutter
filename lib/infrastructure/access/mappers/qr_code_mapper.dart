import 'package:gymbro/domain/access/entities/qr_code.dart';
import '../dtos/response/qr_code_response_dto.dart';

/// Mapper for converting QR code DTOs to domain entities
class QRCodeMapper {
  /// Convert DTO to domain entity
  /// The subscriptionId must be provided since the backend doesn't return it
  static QRCode toDomain(QRCodeResponseDto dto, {required String subscriptionId}) {
    // Calculate createdAt from expiresAt and remainingSeconds
    final expiresAt = DateTime.parse(dto.expiresAt);
    final createdAt = expiresAt.subtract(Duration(seconds: dto.remainingSeconds));

    return QRCode(
      code: dto.payload,
      subscriptionId: subscriptionId,
      gymId: dto.gymId,
      status: _mapStatus(dto.status),
      expiresAt: expiresAt,
      createdAt: createdAt,
    );
  }

  /// Map string status to enum
  static QRCodeStatus _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case 'unused':
        return QRCodeStatus.unused;
      case 'used':
        return QRCodeStatus.used;
      case 'expired':
        return QRCodeStatus.expired;
      case 'revoked':
        return QRCodeStatus.revoked;
      default:
        return QRCodeStatus.expired;
    }
  }
}
