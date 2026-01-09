import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/subscription/entities/subscription.dart';
import '../../subscription/state/subscriptions_notifier.dart';

part 'gym_subscription_provider.g.dart';

/// Provider for fetching user's active subscription for a specific gym
@riverpod
Future<Subscription?> gymActiveSubscription(
  Ref ref,
  String gymId,
) async {
  // Watch the user's active subscriptions
  final subscriptions = await ref.watch(
    userSubscriptionsProvider(activeOnly: true).future,
  );

  // Find subscription for this specific gym
  try {
    return subscriptions.firstWhere(
      (s) => s.gymId == gymId && s.isActive,
    );
  } catch (_) {
    // No subscription found for this gym
    return null;
  }
}
