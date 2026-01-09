import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.freezed.dart';

/// Domain entity representing a gym subscription plan
@freezed
class Plan with _$Plan {
  const factory Plan({
    required String id,
    required String gymId,
    required String name,
    required String description,
    required PlanPrice price,
    required PlanDuration duration,
    required List<String> features,
    required String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    required bool isActive,
    required int sortOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Plan;
}

/// Value object for plan pricing
@freezed
class PlanPrice with _$PlanPrice {
  const factory PlanPrice({
    required double amount,
    required String currency,
  }) = _PlanPrice;
}

/// Value object for plan duration
@freezed
class PlanDuration with _$PlanDuration {
  const factory PlanDuration({
    required int value,
    required String unit, // 'day', 'week', 'month', 'year'
  }) = _PlanDuration;

  const PlanDuration._();

  /// Get duration in days for comparison
  int get days {
    switch (unit) {
      case 'day':
        return value;
      case 'week':
        return value * 7;
      case 'month':
        return value * 30; // approximate
      case 'year':
        return value * 365;
      default:
        return value;
    }
  }
}
