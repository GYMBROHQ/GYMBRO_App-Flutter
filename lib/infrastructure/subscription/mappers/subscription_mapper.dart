import '../../../domain/subscription/entities/subscription.dart';
import '../../../domain/subscription/entities/subscription_history.dart';
import '../dtos/response/subscription_response_dto.dart';
import '../dtos/response/subscription_history_response_dto.dart';

/// Mapper for converting Subscription DTOs to domain entities
class SubscriptionMapper {
  /// Convert Subscription DTO to domain entity
  static Subscription toDomain(SubscriptionResponseDto dto) {
    return Subscription(
      id: dto.id,
      authId: dto.authId,
      gymId: dto.gymId,
      gymName: dto.gymName,
      planId: dto.planId,
      planName: dto.planName,
      status: _parseStatus(dto.status),
      startDate: DateTime.parse(dto.startDate),
      endDate: DateTime.parse(dto.endDate),
      daysRemaining: dto.daysRemaining,
      price: SubscriptionPrice(
        amount: dto.price.amount,
        currency: dto.price.currency,
      ),
      discountApplied: dto.discountApplied != null
          ? SubscriptionDiscount(
              amount: dto.discountApplied!.amount,
              promoCode: dto.discountApplied!.promoCode,
            )
          : null,
      confirmationNumber: dto.confirmationNumber,
      accessCount: dto.accessCount,
      isInGracePeriod: dto.isInGracePeriod,
      canRenew: dto.canRenew,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      paymentMethodType: dto.paymentMethodType,
      pendingPaymentExpiresAt: dto.pendingPaymentExpiresAt != null
          ? DateTime.parse(dto.pendingPaymentExpiresAt!)
          : null,
    );
  }

  /// Convert list of Subscription DTOs to domain entities
  static List<Subscription> toDomainList(List<SubscriptionResponseDto> dtos) {
    return dtos.map(toDomain).toList();
  }

  /// Convert SubscriptionHistory DTO to domain entity
  static SubscriptionHistory historyToDomain(
      SubscriptionHistoryResponseDto dto) {
    return SubscriptionHistory(
      id: dto.id,
      subscriptionId: dto.subscriptionId,
      eventType: HistoryEventType.fromString(dto.eventType),
      description: dto.description,
      metadata: dto.metadata,
      occurredAt: DateTime.parse(dto.occurredAt),
    );
  }

  /// Convert list of SubscriptionHistory DTOs to domain entities
  static List<SubscriptionHistory> historyToDomainList(
      List<SubscriptionHistoryResponseDto> dtos) {
    return dtos.map(historyToDomain).toList();
  }

  /// Parse subscription status from API string
  static SubscriptionStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return SubscriptionStatus.active;
      case 'expired':
        return SubscriptionStatus.expired;
      case 'suspended':
        return SubscriptionStatus.suspended;
      case 'cancelled':
        return SubscriptionStatus.cancelled;
      case 'pending_payment':
      case 'pendingpayment':
        return SubscriptionStatus.pendingPayment;
      default:
        throw ArgumentError('Unknown subscription status: $status');
    }
  }
}
