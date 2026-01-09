import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';

/// Domain entity representing a user's saved payment method
@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String type, // 'card', 'bank_account', etc.
    required String lastFour,
    required String expiryDate, // MM/YY format
    String? brand, // 'visa', 'mastercard', etc.
    String? cardholderName,
    required bool isDefault,
    required DateTime createdAt,
  }) = _PaymentMethod;

  const PaymentMethod._();

  /// Get a display-friendly card label
  String get displayLabel {
    final cardType = brand?.toUpperCase() ?? type.toUpperCase();
    return '$cardType ending in $lastFour';
  }

  /// Check if the card is expired
  bool get isExpired {
    try {
      final parts = expiryDate.split('/');
      if (parts.length != 2) return false;

      final month = int.parse(parts[0]);
      final year = int.parse('20${parts[1]}'); // Assuming 20XX

      final now = DateTime.now();
      final expiry = DateTime(year, month + 1, 0); // Last day of expiry month

      return expiry.isBefore(now);
    } catch (e) {
      return false;
    }
  }
}
