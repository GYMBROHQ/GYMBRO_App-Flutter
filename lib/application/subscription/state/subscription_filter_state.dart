import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/subscription/entities/subscription.dart';

part 'subscription_filter_state.freezed.dart';

/// Filter criteria for subscription history
@freezed
class SubscriptionFilter with _$SubscriptionFilter {
  const factory SubscriptionFilter({
    @Default(null) SubscriptionStatus? status,
    @Default(null) DateTime? startDate,
    @Default(null) DateTime? endDate,
  }) = _SubscriptionFilter;

  const SubscriptionFilter._();

  /// Check if a subscription passes the filter
  bool matches(Subscription subscription) {
    // Status filter
    if (status != null && subscription.status != status) {
      return false;
    }

    // Date range filter (check if subscription was active during the date range)
    if (startDate != null && subscription.endDate.isBefore(startDate!)) {
      return false;
    }
    if (endDate != null && subscription.startDate.isAfter(endDate!)) {
      return false;
    }

    return true;
  }

  /// Check if any filters are active
  bool get hasActiveFilters => status != null || startDate != null || endDate != null;

  /// Count of active filters
  int get activeFilterCount {
    int count = 0;
    if (status != null) count++;
    if (startDate != null || endDate != null) count++;
    return count;
  }
}

/// Extension to apply filters to subscription lists
extension SubscriptionListFiltering on List<Subscription> {
  List<Subscription> applyFilter(SubscriptionFilter filter) {
    if (!filter.hasActiveFilters) return this;
    return where((subscription) => filter.matches(subscription)).toList();
  }
}
