import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_history.freezed.dart';

/// Domain entity representing a subscription history event
@freezed
class SubscriptionHistory with _$SubscriptionHistory {
  const factory SubscriptionHistory({
    required String id,
    required String subscriptionId,
    required HistoryEventType eventType,
    required String description,
    Map<String, dynamic>? metadata,
    required DateTime occurredAt,
  }) = _SubscriptionHistory;
}

/// Subscription history event types
enum HistoryEventType {
  created,
  renewed,
  cancelled,
  suspended,
  expired,
  paymentFailed,
  reactivated;

  String get displayName {
    switch (this) {
      case HistoryEventType.created:
        return 'Created';
      case HistoryEventType.renewed:
        return 'Renewed';
      case HistoryEventType.cancelled:
        return 'Cancelled';
      case HistoryEventType.suspended:
        return 'Suspended';
      case HistoryEventType.expired:
        return 'Expired';
      case HistoryEventType.paymentFailed:
        return 'Payment Failed';
      case HistoryEventType.reactivated:
        return 'Reactivated';
    }
  }

  /// Get the API string representation
  String get apiValue {
    switch (this) {
      case HistoryEventType.created:
        return 'created';
      case HistoryEventType.renewed:
        return 'renewed';
      case HistoryEventType.cancelled:
        return 'cancelled';
      case HistoryEventType.suspended:
        return 'suspended';
      case HistoryEventType.expired:
        return 'expired';
      case HistoryEventType.paymentFailed:
        return 'payment_failed';
      case HistoryEventType.reactivated:
        return 'reactivated';
    }
  }

  /// Parse from API string
  static HistoryEventType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'created':
        return HistoryEventType.created;
      case 'renewed':
        return HistoryEventType.renewed;
      case 'cancelled':
        return HistoryEventType.cancelled;
      case 'suspended':
        return HistoryEventType.suspended;
      case 'expired':
        return HistoryEventType.expired;
      case 'payment_failed':
        return HistoryEventType.paymentFailed;
      case 'reactivated':
        return HistoryEventType.reactivated;
      default:
        throw ArgumentError('Unknown history event type: $value');
    }
  }
}
