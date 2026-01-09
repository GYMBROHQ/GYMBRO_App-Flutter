import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/subscription/entities/plan.dart';
import '../../../domain/subscription/entities/payment_method.dart';
import '../../../domain/subscription/entities/subscription.dart';
import '../../../domain/subscription/repositories/subscription_repository.dart';
import 'subscriptions_notifier.dart';

part 'checkout_notifier.g.dart';
part 'checkout_notifier.freezed.dart';

/// State for checkout flow
@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.planSelected({
    required Plan plan,
    required String gymId,
    required String gymName,
    String? promoCode,
    double? discount,
  }) = _PlanSelected;
  const factory CheckoutState.paymentMethodSelected({
    required Plan plan,
    required String gymId,
    required String gymName,
    required PaymentMethod paymentMethod,
    String? promoCode,
    double? discount,
  }) = _PaymentMethodSelected;
  const factory CheckoutState.cashPaymentSelected({
    required Plan plan,
    required String gymId,
    required String gymName,
    String? promoCode,
    double? discount,
  }) = _CashPaymentSelected;
  const factory CheckoutState.processing() = _Processing;
  const factory CheckoutState.success(Subscription subscription) = _Success;
  const factory CheckoutState.failure(String error) = _Failure;
}

/// Notifier for managing checkout flow
@Riverpod(keepAlive: true)
class Checkout extends _$Checkout {
  @override
  CheckoutState build() {
    return const CheckoutState.initial();
  }

  /// Start checkout with a selected plan
  void selectPlan({
    required Plan plan,
    required String gymId,
    required String gymName,
  }) {
    state = CheckoutState.planSelected(
      plan: plan,
      gymId: gymId,
      gymName: gymName,
    );
  }

  /// Select payment method for checkout
  void selectPaymentMethod(PaymentMethod paymentMethod) {
    state.when(
      planSelected: (plan, gymId, gymName, promoCode, discount) {
        state = CheckoutState.paymentMethodSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          paymentMethod: paymentMethod,
          promoCode: promoCode,
          discount: discount,
        );
      },
      paymentMethodSelected: (plan, gymId, gymName, _, promoCode, discount) {
        state = CheckoutState.paymentMethodSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          paymentMethod: paymentMethod,
          promoCode: promoCode,
          discount: discount,
        );
      },
      cashPaymentSelected: (plan, gymId, gymName, promoCode, discount) {
        state = CheckoutState.paymentMethodSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          paymentMethod: paymentMethod,
          promoCode: promoCode,
          discount: discount,
        );
      },
      initial: () {},
      loading: () {},
      processing: () {},
      success: (_) {},
      failure: (_) {},
    );
  }

  /// Select cash payment for checkout
  void selectCashPayment() {
    state.when(
      planSelected: (plan, gymId, gymName, promoCode, discount) {
        state = CheckoutState.cashPaymentSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          promoCode: promoCode,
          discount: discount,
        );
      },
      paymentMethodSelected: (plan, gymId, gymName, _, promoCode, discount) {
        state = CheckoutState.cashPaymentSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          promoCode: promoCode,
          discount: discount,
        );
      },
      cashPaymentSelected: (plan, gymId, gymName, promoCode, discount) {
        // Already in cash payment state, do nothing
      },
      initial: () {},
      loading: () {},
      processing: () {},
      success: (_) {},
      failure: (_) {},
    );
  }

  /// Apply a promo code
  /// This validates the promo code against the backend
  Future<void> applyPromoCode(String subscriptionId, String promoCode) async {
    try {
      final repository = ref.read(subscriptionRepositoryProvider);
      final result = await repository.applyPromoCode(subscriptionId, promoCode);

      state.when(
        planSelected: (plan, gymId, gymName, _, __) {
          state = CheckoutState.planSelected(
            plan: plan,
            gymId: gymId,
            gymName: gymName,
            promoCode: result.promoCode,
            discount: result.discountAmount,
          );
        },
        paymentMethodSelected: (plan, gymId, gymName, paymentMethod, _, __) {
          state = CheckoutState.paymentMethodSelected(
            plan: plan,
            gymId: gymId,
            gymName: gymName,
            paymentMethod: paymentMethod,
            promoCode: result.promoCode,
            discount: result.discountAmount,
          );
        },
        cashPaymentSelected: (plan, gymId, gymName, _, __) {
          state = CheckoutState.cashPaymentSelected(
            plan: plan,
            gymId: gymId,
            gymName: gymName,
            promoCode: result.promoCode,
            discount: result.discountAmount,
          );
        },
        initial: () {},
        loading: () {},
        processing: () {},
        success: (_) {},
        failure: (_) {},
      );
    } catch (e) {
      // Promo code validation failed
      throw Exception('Failed to apply promo code: $e');
    }
  }

  /// Remove applied promo code
  void removePromoCode() {
    state.when(
      planSelected: (plan, gymId, gymName, _, __) {
        state = CheckoutState.planSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
        );
      },
      paymentMethodSelected: (plan, gymId, gymName, paymentMethod, _, __) {
        state = CheckoutState.paymentMethodSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
          paymentMethod: paymentMethod,
        );
      },
      cashPaymentSelected: (plan, gymId, gymName, _, __) {
        state = CheckoutState.cashPaymentSelected(
          plan: plan,
          gymId: gymId,
          gymName: gymName,
        );
      },
      initial: () {},
      loading: () {},
      processing: () {},
      success: (_) {},
      failure: (_) {},
    );
  }

  /// Complete the checkout and subscribe to the plan
  Future<void> completePurchase() async {
    // Check if we're in the right state
    final currentState = state;
    if (currentState is! _PaymentMethodSelected && currentState is! _CashPaymentSelected) {
      state = const CheckoutState.failure('Please select a payment method');
      return;
    }

    state = const CheckoutState.processing();

    try {
      final repository = ref.read(subscriptionRepositoryProvider);

      SubscribeToPlanRequest request;

      if (currentState is _PaymentMethodSelected) {
        // Card payment
        request = SubscribeToPlanRequest(
          gymId: currentState.gymId,
          planId: currentState.plan.id,
          paymentMethodId: currentState.paymentMethod.id,
          promoCode: currentState.promoCode,
          paymentMethodType: 'card',
        );
      } else if (currentState is _CashPaymentSelected) {
        // Cash payment
        request = SubscribeToPlanRequest(
          gymId: currentState.gymId,
          planId: currentState.plan.id,
          paymentMethodId: 'cash', // Dummy ID for cash payments
          promoCode: currentState.promoCode,
          paymentMethodType: 'cash',
        );
      } else {
        state = const CheckoutState.failure('Invalid payment state');
        return;
      }

      final subscription = await repository.subscribeToPlan(request);
      state = CheckoutState.success(subscription);
    } catch (e) {
      state = CheckoutState.failure(e.toString());
    }
  }

  /// Reset checkout to initial state
  void reset() {
    state = const CheckoutState.initial();
  }
}
