import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/subscription/entities/payment_method.dart';
import '../../../domain/subscription/repositories/payment_method_repository.dart';
import '../../../infrastructure/subscription/repositories/payment_method_repository_impl.dart';
import '../../../infrastructure/providers/auth_providers.dart';
import '../../../infrastructure/services/stripe_service.dart';

part 'payment_methods_notifier.g.dart';

/// Provider for PaymentMethodRepository
@riverpod
PaymentMethodRepository paymentMethodRepository(PaymentMethodRepositoryRef ref) {
  final dio = ref.read(authenticatedDioProvider);
  return PaymentMethodRepositoryImpl(dio: dio);
}

/// Provider for StripeService
@riverpod
StripeService stripeService(StripeServiceRef ref) {
  return StripeService();
}

/// Notifier for managing payment methods
@riverpod
class PaymentMethods extends _$PaymentMethods {
  @override
  Future<List<PaymentMethod>> build() async {
    final repository = ref.read(paymentMethodRepositoryProvider);
    return await repository.getPaymentMethods();
  }

  /// Refresh payment methods list
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }

  /// Get setup intent client secret for adding a new card
  /// Returns the client secret to be used with the card entry form
  Future<String> getSetupIntentClientSecret() async {
    final repository = ref.read(paymentMethodRepositoryProvider);
    return await repository.createSetupIntent();
  }

  /// Confirm card setup after user enters card details
  /// Called from the AddCardPage after successful card entry
  Future<bool> confirmCardSetup(String clientSecret) async {
    try {
      final stripeService = ref.read(stripeServiceProvider);
      await stripeService.confirmSetupWithCardDetails(clientSecret: clientSecret);
      await refresh();
      return true;
    } catch (e) {
      throw Exception('Failed to save card: $e');
    }
  }

  /// Add a new payment method using Stripe payment sheet (legacy)
  /// Kept for backward compatibility, but prefer using getSetupIntentClientSecret
  /// and confirmCardSetup for the full-screen form flow
  Future<bool> addPaymentMethod() async {
    try {
      final repository = ref.read(paymentMethodRepositoryProvider);
      final stripeService = ref.read(stripeServiceProvider);

      // Get setup intent client secret from backend
      final clientSecret = await repository.createSetupIntent();

      // Present Stripe payment sheet
      final success = await stripeService.presentPaymentSheet(
        clientSecret: clientSecret,
      );

      if (success) {
        // Refresh the list to show the new payment method
        await refresh();
      }

      return success;
    } catch (e) {
      throw Exception('Failed to add payment method: $e');
    }
  }

  /// Remove a payment method
  Future<void> removePaymentMethod(String paymentMethodId) async {
    final repository = ref.read(paymentMethodRepositoryProvider);
    await repository.removePaymentMethod(paymentMethodId);
    await refresh();
  }

  /// Set a payment method as default
  Future<void> setDefaultPaymentMethod(String paymentMethodId) async {
    final repository = ref.read(paymentMethodRepositoryProvider);
    await repository.setDefaultPaymentMethod(paymentMethodId);
    await refresh();
  }
}
