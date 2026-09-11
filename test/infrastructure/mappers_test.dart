import 'package:flutter_test/flutter_test.dart';
import 'package:gymbro/domain/access/entities/access_log.dart';
import 'package:gymbro/domain/access/entities/qr_code.dart';
import 'package:gymbro/infrastructure/access/dtos/response/access_log_response_dto.dart';
import 'package:gymbro/infrastructure/access/dtos/response/qr_code_response_dto.dart';
import 'package:gymbro/infrastructure/access/mappers/access_log_mapper.dart';
import 'package:gymbro/infrastructure/access/mappers/qr_code_mapper.dart';
import 'package:gymbro/infrastructure/subscription/dtos/response/payment_method_response_dto.dart';
import 'package:gymbro/infrastructure/subscription/mappers/payment_method_mapper.dart';

void main() {
  test(
    'QR code mapper derives creation time and maps status case-insensitively',
    () {
      final expiresAt = DateTime.utc(2025, 1, 1, 12);
      final dto = QRCodeResponseDto(
        id: 'qr-1',
        payload: 'signed-payload',
        expiresAt: expiresAt.toIso8601String(),
        remainingSeconds: 90,
        status: 'UNUSED',
        gymId: 'gym-1',
      );

      final result = QRCodeMapper.toDomain(dto, subscriptionId: 'sub-1');

      expect(result.code, 'signed-payload');
      expect(result.subscriptionId, 'sub-1');
      expect(result.status, QRCodeStatus.unused);
      expect(result.expiresAt, expiresAt);
      expect(result.createdAt, expiresAt.subtract(const Duration(seconds: 90)));
    },
  );

  test('access log mapper supplies a fallback gym name and maps a grant', () {
    final accessedAt = DateTime.utc(2025, 2, 3, 9, 30);
    final dto = AccessLogResponseDto(
      id: 'log-1',
      userId: 'user-1',
      gymId: 'gym-1',
      subscriptionId: 'sub-1',
      accessType: 'member',
      accessMethod: 'qr',
      result: 'GRANTED',
      accessedAt: accessedAt.toIso8601String(),
    );

    final result = AccessLogMapper.toDomain(dto);

    expect(result.gymName, 'Unknown Gym');
    expect(result.result, AccessResult.granted);
    expect(result.wasGranted, isTrue);
    expect(result.timestamp, accessedAt);
  });

  test(
    'payment method mapper formats flattened card details and default override',
    () {
      final dto = PaymentMethodResponseDto(
        id: 'pm-1',
        type: 'card',
        last4: '4242',
        brand: 'visa',
        expMonth: 3,
        expYear: 2030,
        isDefault: false,
        created: 1704067200,
      );

      final result = PaymentMethodMapper.toDomainList([
        dto,
      ], defaultPaymentMethodId: 'pm-1');

      expect(result, hasLength(1));
      expect(result.single.lastFour, '4242');
      expect(result.single.expiryDate, '03/30');
      expect(result.single.displayLabel, 'VISA ending in 4242');
      expect(result.single.isDefault, isTrue);
      expect(
        result.single.createdAt,
        DateTime.fromMillisecondsSinceEpoch(1704067200 * 1000),
      );
    },
  );
}
