import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/subscription/entities/subscription.dart';
import '../../../domain/subscription/repositories/subscription_repository.dart';
import '../../../infrastructure/subscription/repositories/subscription_repository_impl.dart';
import '../../../infrastructure/providers/auth_providers.dart';

part 'subscriptions_notifier.g.dart';

/// Provider for SubscriptionRepository
@riverpod
SubscriptionRepository subscriptionRepository(SubscriptionRepositoryRef ref) {
  final dio = ref.read(authenticatedDioProvider);
  return SubscriptionRepositoryImpl(dio: dio);
}

/// Provider for fetching a single subscription by ID
@riverpod
Future<Subscription> subscriptionById(SubscriptionByIdRef ref, String subscriptionId) async {
  final repository = ref.read(subscriptionRepositoryProvider);
  return await repository.getSubscriptionById(subscriptionId);
}

/// Notifier for managing user subscriptions
@riverpod
class UserSubscriptions extends _$UserSubscriptions {
  @override
  Future<List<Subscription>> build({bool activeOnly = false}) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    return await repository.getUserSubscriptions(activeOnly: activeOnly);
  }

  /// Refresh subscriptions list
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }

  /// Get a specific subscription by ID
  Future<Subscription> getSubscriptionById(String subscriptionId) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    return await repository.getSubscriptionById(subscriptionId);
  }

  /// Cancel a subscription
  Future<void> cancelSubscription(String subscriptionId, String reason) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    await repository.cancelSubscription(subscriptionId, reason);
    // Refresh the list after cancellation
    await refresh();
  }

  /// Renew a subscription
  Future<Subscription> renewSubscription(
    String subscriptionId,
    String paymentMethodId,
  ) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    final request = RenewSubscriptionRequest(
      subscriptionId: subscriptionId,
      paymentMethodId: paymentMethodId,
    );
    final renewed = await repository.renewSubscription(request);
    // Refresh the list after renewal
    await refresh();
    return renewed;
  }

  /// Pause a subscription
  Future<void> pauseSubscription(String subscriptionId, String reason) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    await repository.pauseSubscription(subscriptionId, reason);
    await refresh();
  }

  /// Resume a subscription
  Future<void> resumeSubscription(String subscriptionId) async {
    final repository = ref.read(subscriptionRepositoryProvider);
    await repository.resumeSubscription(subscriptionId);
    await refresh();
  }
}

/// Notifier for subscription history
@riverpod
class SubscriptionHistory extends _$SubscriptionHistory {
  late int _page;
  late int _limit;

  @override
  Future<SubscriptionHistoryResult> build({int page = 1, int limit = 20}) async {
    _page = page;
    _limit = limit;
    final repository = ref.read(subscriptionRepositoryProvider);
    return await repository.getSubscriptionHistory(page: page, limit: limit);
  }

  /// Load more history (next page)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null) return;

    final nextPage = _page + 1;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(page: nextPage, limit: _limit));
  }

  /// Refresh history
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}
