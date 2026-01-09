import '../entities/payment_method.dart';

/// Repository interface for managing payment methods
abstract class PaymentMethodRepository {
  /// Get all payment methods for the authenticated user
  Future<List<PaymentMethod>> getPaymentMethods();

  /// Create a setup intent for adding a new payment method
  /// Returns the client secret needed for Stripe's payment sheet
  Future<String> createSetupIntent();

  /// Remove a payment method
  Future<void> removePaymentMethod(String paymentMethodId);

  /// Set a payment method as the default
  Future<void> setDefaultPaymentMethod(String paymentMethodId);
}
