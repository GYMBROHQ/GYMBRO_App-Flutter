import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// Service for handling Stripe payment operations
class StripeService {
  /// Initialize Stripe with publishable key
  /// Should be called early in app startup
  static Future<void> initialize(String publishableKey) async {
    Stripe.publishableKey = publishableKey;
    // Optionally set merchant identifier for Apple Pay
    // Stripe.merchantIdentifier = 'merchant.com.gymbro';
  }

  /// Present the payment sheet for adding a new payment method
  /// Returns true if successful, false if cancelled
  Future<bool> presentPaymentSheet({
    required String clientSecret,
    String? customerEphemeralKeySecret,
    String? customerId,
  }) async {
    try {
      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          customerEphemeralKeySecret: customerEphemeralKeySecret,
          customerId: customerId,
          merchantDisplayName: 'GYMBRO',
          style: ThemeMode.system,
          // Enable Apple Pay and Google Pay if desired
          // applePay: const PaymentSheetApplePay(merchantCountryCode: 'US'),
          // googlePay: const PaymentSheetGooglePay(
          //   merchantCountryCode: 'US',
          //   testEnv: true,
          // ),
        ),
      );

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();
      return true;
    } on StripeException catch (e) {
      // User cancelled or other error
      if (e.error.code == FailureCode.Canceled) {
        return false;
      }
      rethrow;
    }
  }

  /// Create a payment method from card details
  /// This is an alternative to the payment sheet for custom UI
  Future<PaymentMethod> createPaymentMethod({
    required CardFieldInputDetails cardDetails,
    BillingDetails? billingDetails,
  }) async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
      );
      return paymentMethod;
    } on StripeException catch (e) {
      throw Exception('Failed to create payment method: ${e.error.message}');
    }
  }

  /// Confirm a setup intent (for custom flows)
  Future<SetupIntent> confirmSetupIntent({
    required String clientSecret,
    required PaymentMethodParams params,
  }) async {
    try {
      final result = await Stripe.instance.confirmSetupIntent(
        paymentIntentClientSecret: clientSecret,
        params: params,
      );
      return result;
    } on StripeException catch (e) {
      throw Exception('Failed to confirm setup: ${e.error.message}');
    }
  }

  /// Confirm setup intent with card details from CardFormField
  /// This is used for the full-screen card entry form
  Future<SetupIntent> confirmSetupWithCardDetails({
    required String clientSecret,
    BillingDetails? billingDetails,
  }) async {
    try {
      final result = await Stripe.instance.confirmSetupIntent(
        paymentIntentClientSecret: clientSecret,
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
      );
      return result;
    } on StripeException catch (e) {
      throw Exception('Failed to save card: ${e.error.message}');
    }
  }

  /// Check if platform pay (Apple Pay or Google Pay) is supported
  Future<bool> isPlatformPaySupported() async {
    try {
      return await Stripe.instance.isPlatformPaySupported();
    } catch (e) {
      return false;
    }
  }
}
