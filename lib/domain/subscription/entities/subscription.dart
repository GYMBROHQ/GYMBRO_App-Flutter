import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

/// Domain entity representing a user's subscription to a gym
@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String authId,
    required String gymId,
    required String gymName,
    required String planId,
    required String planName,
    required SubscriptionStatus status,
    required DateTime startDate,
    required DateTime endDate,
    required int daysRemaining,
    required SubscriptionPrice price,
    SubscriptionDiscount? discountApplied,
    required String confirmationNumber,
    required int accessCount,
    required bool isInGracePeriod,
    required bool canRenew,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? paymentMethodType,
    DateTime? pendingPaymentExpiresAt,
  }) = _Subscription;

  const Subscription._();

  /// Check if subscription is currently active
  bool get isActive => status == SubscriptionStatus.active && daysRemaining > 0;

  /// Check if subscription is expiring soon (within 7 days)
  bool get isExpiringSoon => isActive && daysRemaining <= 7 && daysRemaining > 0;
}

/// Subscription status enum
enum SubscriptionStatus {
  active,
  expired,
  suspended,
  cancelled,
  pendingPayment;

  String get displayName {
    switch (this) {
      case SubscriptionStatus.active:
        return 'Active';
      case SubscriptionStatus.expired:
        return 'Expired';
      case SubscriptionStatus.suspended:
        return 'Suspended';
      case SubscriptionStatus.cancelled:
        return 'Cancelled';
      case SubscriptionStatus.pendingPayment:
        return 'Pending Approval';
    }
  }
}

/// Value object for subscription pricing
@freezed
class SubscriptionPrice with _$SubscriptionPrice {
  const factory SubscriptionPrice({
    required double amount,
    required String currency,
  }) = _SubscriptionPrice;
}

/// Value object for applied discount
@freezed
class SubscriptionDiscount with _$SubscriptionDiscount {
  const factory SubscriptionDiscount({
    required double amount,
    String? promoCode,
  }) = _SubscriptionDiscount;
}
