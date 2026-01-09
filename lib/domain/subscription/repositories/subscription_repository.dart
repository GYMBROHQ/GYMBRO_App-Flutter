import '../entities/subscription.dart';
import '../entities/subscription_history.dart';

/// Request data for subscribing to a plan
class SubscribeToPlanRequest {
  final String gymId;
  final String planId;
  final String paymentMethodId;
  final String? promoCode;
  final DateTime? startDate;
  final String? paymentMethodType; // 'card' or 'cash'

  const SubscribeToPlanRequest({
    required this.gymId,
    required this.planId,
    required this.paymentMethodId,
    this.promoCode,
    this.startDate,
    this.paymentMethodType,
  });
}

/// Request data for renewing a subscription
class RenewSubscriptionRequest {
  final String subscriptionId;
  final String paymentMethodId;

  const RenewSubscriptionRequest({
    required this.subscriptionId,
    required this.paymentMethodId,
  });
}

/// Repository interface for managing subscriptions
abstract class SubscriptionRepository {
  /// Get all subscriptions for the authenticated user
  /// If [activeOnly] is true, only return active subscriptions
  Future<List<Subscription>> getUserSubscriptions({bool activeOnly = false});

  /// Get details of a specific subscription
  Future<Subscription> getSubscriptionById(String subscriptionId);

  /// Subscribe to a gym plan
  Future<Subscription> subscribeToPlan(SubscribeToPlanRequest request);

  /// Cancel a subscription
  Future<void> cancelSubscription(String subscriptionId, String reason);

  /// Renew an expiring or expired subscription
  Future<Subscription> renewSubscription(RenewSubscriptionRequest request);

  /// Pause/suspend a subscription
  Future<void> pauseSubscription(String subscriptionId, String reason);

  /// Resume a paused subscription
  Future<void> resumeSubscription(String subscriptionId);

  /// Get subscription history for the authenticated user
  /// Supports pagination with [page] and [limit]
  Future<SubscriptionHistoryResult> getSubscriptionHistory({
    int page = 1,
    int limit = 20,
  });

  /// Apply a promo code to a subscription
  /// Returns the discount details
  Future<PromoCodeResult> applyPromoCode(String subscriptionId, String promoCode);
}

/// Result object for paginated subscription history
class SubscriptionHistoryResult {
  final List<SubscriptionHistory> history;
  final int totalCount;

  const SubscriptionHistoryResult({
    required this.history,
    required this.totalCount,
  });
}

/// Result object for promo code application
class PromoCodeResult {
  final String promoCode;
  final double discountAmount;
  final double originalPrice;
  final double finalPrice;
  final String? message;

  const PromoCodeResult({
    required this.promoCode,
    required this.discountAmount,
    required this.originalPrice,
    required this.finalPrice,
    this.message,
  });

  double get discountPercentage =>
      originalPrice > 0 ? (discountAmount / originalPrice) * 100 : 0;
}
