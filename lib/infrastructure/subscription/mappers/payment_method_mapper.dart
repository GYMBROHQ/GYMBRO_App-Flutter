import '../../../domain/subscription/entities/payment_method.dart';
import '../dtos/response/payment_method_response_dto.dart';

/// Mapper for converting PaymentMethod DTOs to domain entities
class PaymentMethodMapper {
  /// Convert PaymentMethod DTO to domain entity
  static PaymentMethod toDomain(PaymentMethodResponseDto dto) {
    // Try flattened fields first (from backend), then nested card object
    final last4 = dto.last4 ?? dto.card?.last4 ?? '0000';
    final brand = dto.brand ?? dto.card?.brand ?? dto.type;
    final expMonth = dto.expMonth ?? dto.card?.expMonth ?? 0;
    final expYear = dto.expYear ?? dto.card?.expYear ?? 0;
    final isDefault = dto.isDefault ?? false;

    // Format expiry date
    String expiryDate;
    if (expMonth > 0 && expYear > 0) {
      final expYearStr = expYear.toString();
      expiryDate = '${expMonth.toString().padLeft(2, '0')}/${expYearStr.length >= 2 ? expYearStr.substring(expYearStr.length - 2) : expYearStr}';
    } else {
      expiryDate = '00/00';
    }

    return PaymentMethod(
      id: dto.id,
      type: dto.type,
      lastFour: last4,
      expiryDate: expiryDate,
      brand: brand,
      cardholderName: null, // Not provided by Stripe in standard response
      isDefault: isDefault,
      createdAt: dto.created != null
          ? DateTime.fromMillisecondsSinceEpoch(dto.created! * 1000)
          : DateTime.now(),
    );
  }

  /// Convert list of PaymentMethod DTOs to domain entities
  static List<PaymentMethod> toDomainList(
    List<PaymentMethodResponseDto> dtos, {
    String? defaultPaymentMethodId,
  }) {
    return dtos.map((dto) {
      final paymentMethod = toDomain(dto);
      // Override isDefault if this is the default payment method
      if (defaultPaymentMethodId != null && dto.id == defaultPaymentMethodId) {
        return paymentMethod.copyWith(isDefault: true);
      }
      return paymentMethod;
    }).toList();
  }
}
