import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code.freezed.dart';

/// Domain entity representing a QR code for gym access
@freezed
class QRCode with _$QRCode {
  const factory QRCode({
    required String code,
    required String subscriptionId,
    required String gymId,
    required QRCodeStatus status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _QRCode;

  const QRCode._();

  /// Check if QR code is still valid
  bool get isValid =>
      status == QRCodeStatus.unused &&
      DateTime.now().isBefore(expiresAt);

  /// Get remaining seconds until expiration
  int get secondsRemaining {
    final now = DateTime.now();
    if (now.isAfter(expiresAt)) return 0;
    return expiresAt.difference(now).inSeconds;
  }
}

/// QR code status enum
enum QRCodeStatus {
  unused,
  used,
  expired,
  revoked;

  String get displayName {
    switch (this) {
      case QRCodeStatus.unused:
        return 'Active';
      case QRCodeStatus.used:
        return 'Used';
      case QRCodeStatus.expired:
        return 'Expired';
      case QRCodeStatus.revoked:
        return 'Revoked';
    }
  }
}
