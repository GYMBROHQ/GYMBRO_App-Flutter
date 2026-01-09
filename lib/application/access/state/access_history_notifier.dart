import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/access/repositories/access_repository.dart';
import 'qr_code_notifier.dart';

part 'access_history_notifier.g.dart';

/// Notifier for access history (logs) for a specific subscription
@riverpod
class AccessHistory extends _$AccessHistory {
  late int _page;
  late int _limit;
  late String _gymId;
  late String? _subscriptionId;

  @override
  Future<AccessLogsResult> build({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  }) async {
    _page = page;
    _limit = limit;
    _gymId = gymId;
    _subscriptionId = subscriptionId;
    final repository = ref.read(accessRepositoryProvider);
    return await repository.getAccessLogs(
      gymId: gymId,
      subscriptionId: subscriptionId,
      page: page,
      limit: limit,
    );
  }

  /// Load more access logs (next page)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null) return;

    if (!currentState.hasMore) return;

    final nextPage = _page + 1;
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => build(
        gymId: _gymId,
        subscriptionId: _subscriptionId,
        page: nextPage,
        limit: _limit,
      ),
    );
  }

  /// Refresh access logs
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => build(
        gymId: _gymId,
        subscriptionId: _subscriptionId,
        page: 1,
        limit: _limit,
      ),
    );
  }
}

/// Notifier for all access history (logs) across all user subscriptions
@riverpod
class AllAccessHistory extends _$AllAccessHistory {
  late int _page;
  late int _limit;

  @override
  Future<AccessLogsResult> build({int page = 1, int limit = 20}) async {
    _page = page;
    _limit = limit;
    final repository = ref.read(accessRepositoryProvider);
    return await repository.getAllAccessLogs(page: page, limit: limit);
  }

  /// Load more access logs (next page)
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null) return;

    if (!currentState.hasMore) return;

    final nextPage = _page + 1;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(page: nextPage, limit: _limit));
  }

  /// Refresh access logs
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(page: 1, limit: _limit));
  }
}
