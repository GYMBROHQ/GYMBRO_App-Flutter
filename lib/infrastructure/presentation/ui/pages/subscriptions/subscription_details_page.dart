import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../organisms/organisms.dart';
import '../../../../../application/subscription/state/subscriptions_notifier.dart';
import '../../../../../application/subscription/state/payment_methods_notifier.dart';
import '../../../../../application/subscription/state/plans_notifier.dart';
import '../../../../../application/access/state/access_history_notifier.dart';
import '../../../../../application/gym/state/gym_details_notifier.dart';
import '../../../../../domain/subscription/entities/subscription.dart' as domain;
import '../../../../../domain/subscription/entities/plan.dart';
import '../../../../../domain/gym/entities/gym.dart';
import '../../../../providers/providers.dart';

/// Subscription Details Page - Shows detailed information about a specific subscription
class SubscriptionDetailsPage extends ConsumerWidget {
  final String subscriptionId;

  const SubscriptionDetailsPage({
    super.key,
    required this.subscriptionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subscriptionAsync = ref.watch(subscriptionByIdProvider(subscriptionId));

    return Scaffold(
      backgroundColor: isDark
          ? DarkAppColors.backgroundPrimary
          : AppColors.neutral50,
      body: subscriptionAsync.when(
        data: (subscription) => _buildContent(context, ref, isDark, subscription),
        loading: () => _buildLoading(context, isDark),
        error: (error, stack) => _buildError(context, isDark, error.toString()),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
    domain.Subscription subscription,
  ) {
    // Fetch gym details using the gymId from subscription
    final gymDetailsAsync = ref.watch(gymDetailsProvider(subscription.gymId));

    return Column(
      children: [
        _buildHeader(context, isDark, subscription.gymId),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero image
                gymDetailsAsync.when(
                  data: (gym) => _buildHeroImage(isDark, gym?.coverPhotoUrl),
                  loading: () => _buildHeroImage(isDark, null),
                  error: (error, stack) => _buildHeroImage(isDark, null),
                ),

                // Gym name and location
                gymDetailsAsync.when(
                  data: (gym) => _buildGymInfo(isDark, subscription, gym),
                  loading: () => _buildGymInfo(isDark, subscription, null),
                  error: (error, stack) => _buildGymInfo(isDark, subscription, null),
                ),

                // Plan details card
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: PlanDetailsCard(
                    planName: subscription.planName,
                    price: '\$${subscription.price.amount.toStringAsFixed(2)}/${_getPeriodFromPlanName(subscription.planName)}',
                    status: _mapDomainStatusToUI(subscription),
                    startDate: DateFormat('MMM dd, yyyy').format(subscription.startDate),
                    renewalDate: DateFormat('MMM dd, yyyy').format(subscription.endDate),
                    daysRemaining: subscription.daysRemaining,
                  ),
                ),

                // Generate QR button
                if (subscription.isActive)
                  gymDetailsAsync.when(
                    data: (gym) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            _showQRCodeBottomSheet(context, ref, subscription, gym);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary500,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadius.xl),
                            ),
                            shadowColor: AppColors.primary500.withValues(alpha: 0.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.qr_code_2, size: 24),
                              const SizedBox(width: 12),
                              Text(
                                'Generate QR Code',
                                style: AppTypography.button.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    loading: () => const SizedBox(height: 80),
                    error: (error, stack) => const SizedBox(height: 80),
                  ),

                // Plan Features section
                _buildPlanFeatures(ref, isDark, subscription.gymId, subscription.planId),

                // Recent Access
                _buildRecentAccess(context, ref, isDark, subscription),

                // Payment Method
                _buildPaymentMethod(ref, isDark, subscription),

                // Action buttons
                _buildActionButtons(context, ref, isDark, subscription),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, String gymId) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.backgroundPrimary.withValues(alpha: 0.95)
            : AppColors.white.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.neutral900,
                    size: 24,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Back',
                    style: AppTypography.bodySm.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : AppColors.neutral900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Subscription',
              style: AppTypography.bodyMd.copyWith(
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
            // 3-dot menu button
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_horiz,
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
                size: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              color: isDark
                  ? DarkAppColors.surfaceElevated1
                  : AppColors.white,
              onSelected: (value) {
                if (value == 'view_gym') {
                  context.push('/gyms/$gymId');
                } else if (value == 'contact_support') {
                  _showComingSoonSnackBar(context);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'view_gym',
                  child: Row(
                    children: [
                      Icon(
                        Icons.fitness_center,
                        size: 20,
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : AppColors.neutral900,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'View Gym',
                        style: AppTypography.bodySm.copyWith(
                          color: isDark
                              ? DarkAppColors.textPrimary
                              : AppColors.neutral900,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'contact_support',
                  child: Row(
                    children: [
                      Icon(
                        Icons.support_agent,
                        size: 20,
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : AppColors.neutral900,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Contact Support',
                        style: AppTypography.bodySm.copyWith(
                          color: isDark
                              ? DarkAppColors.textPrimary
                              : AppColors.neutral900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage(bool isDark, String? gymImageUrl) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated2
            : AppColors.neutral800,
      ),
      child: Stack(
        children: [
          if (gymImageUrl != null)
            Image.network(
              gymImageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  isDark
                      ? DarkAppColors.backgroundPrimary
                      : AppColors.neutral50,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGymInfo(bool isDark, domain.Subscription subscription, Gym? gym) {
    final gymAddress = gym != null
        ? '${gym.address.street}, ${gym.address.city}, ${gym.address.state}'
        : 'Loading...';

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Transform.translate(
        offset: const Offset(0, -24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subscription.gymName,
              style: AppTypography.h2.copyWith(
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: AppColors.primary500,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    gymAddress,
                    style: AppTypography.bodySm.copyWith(
                      color: isDark
                          ? DarkAppColors.textMuted
                          : AppColors.neutral600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanFeatures(WidgetRef ref, bool isDark, String gymId, String planId) {
    final plansAsync = ref.watch(gymPlansProvider(gymId));

    return plansAsync.when(
      data: (plans) {
        // Find the plan matching the subscription's planId
        final Plan? plan = plans.cast<Plan?>().firstWhere(
          (p) => p?.id == planId,
          orElse: () => null,
        );

        if (plan == null || plan.features.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 12),
                child: Text(
                  'Plan Features',
                  style: AppTypography.h5.copyWith(
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.neutral900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.surfaceElevated1
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: plan.features.asMap().entries.map((entry) {
                    final isLast = entry.key == plan.features.length - 1;
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: !isLast
                            ? Border(
                                bottom: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.05),
                                ),
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 20,
                            color: AppColors.primary500,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: AppTypography.bodySm.copyWith(
                                color: isDark
                                    ? DarkAppColors.textPrimary
                                    : AppColors.neutral900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }

  Widget _buildRecentAccess(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
    domain.Subscription subscription,
  ) {
    final accessHistoryAsync = ref.watch(
      accessHistoryProvider(
        gymId: subscription.gymId,
        subscriptionId: subscription.id,
        limit: 5,
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Access',
                  style: AppTypography.h5.copyWith(
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.neutral900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to full access history page
                    _showComingSoonSnackBar(context);
                  },
                  child: Text(
                    'View All',
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? DarkAppColors.surfaceElevated1
                  : AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
            child: accessHistoryAsync.when(
              data: (result) {
                if (result.logs.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'No access history yet',
                        style: AppTypography.bodySm.copyWith(
                          color: isDark
                              ? DarkAppColors.textMuted
                              : AppColors.neutral500,
                        ),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    ...result.logs.take(5).map((log) {
                      return AccessHistoryItem(
                        location: log.gymName,
                        timestamp: DateFormat('MMM dd, yyyy • h:mm a').format(log.timestamp),
                        isSuccess: log.wasGranted,
                      );
                    }),
                  ],
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Failed to load access history',
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.error500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(
    WidgetRef ref,
    bool isDark,
    domain.Subscription subscription,
  ) {
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Payment Method',
              style: AppTypography.h5.copyWith(
                color: isDark
                    ? DarkAppColors.textPrimary
                    : AppColors.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          paymentMethodsAsync.when(
            data: (methods) {
              if (methods.isEmpty) {
                return Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? DarkAppColors.surfaceElevated1
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'No payment methods on file',
                      style: AppTypography.bodySm.copyWith(
                        color: isDark
                            ? DarkAppColors.textMuted
                            : AppColors.neutral500,
                      ),
                    ),
                  ),
                );
              }

              // Find default payment method or use the first one
              final paymentMethod = methods.firstWhere(
                (m) => m.isDefault,
                orElse: () => methods.first,
              );

              return PaymentMethodCard(
                lastFourDigits: paymentMethod.lastFour,
                cardBrand: paymentMethod.brand?.toUpperCase(),
              );
            },
            loading: () => Container(
              decoration: BoxDecoration(
                color: isDark
                    ? DarkAppColors.surfaceElevated1
                    : AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
              padding: const EdgeInsets.all(32),
              child: const Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => Container(
              decoration: BoxDecoration(
                color: isDark
                    ? DarkAppColors.surfaceElevated1
                    : AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Failed to load payment method',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.error500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
    domain.Subscription subscription,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        children: [
          if (subscription.canRenew && subscription.isActive)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  _handleRenew(context, ref, subscription);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? DarkAppColors.surfaceElevated2
                      : AppColors.neutral200,
                  foregroundColor: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                ),
                child: Text(
                  'Renew Subscription Early',
                  style: AppTypography.button.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          if (subscription.isActive) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {
                  _handleCancel(context, ref, subscription);
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                ),
                child: Text(
                  'Cancel Subscription',
                  style: AppTypography.button.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildHeader(context, isDark, ''), // Empty gymId during loading
        const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, bool isDark, String error) {
    return Column(
      children: [
        _buildHeader(context, isDark, ''), // Empty gymId during error
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error500,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load subscription',
                    style: AppTypography.h5.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : AppColors.neutral900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySm.copyWith(
                      color: isDark
                          ? DarkAppColors.textSecondary
                          : AppColors.neutral600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Go Back',
                    onPressed: () => context.pop(),
                    variant: ButtonVariant.outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  SubscriptionStatus _mapDomainStatusToUI(domain.Subscription subscription) {
    if (subscription.isExpiringSoon) {
      return SubscriptionStatus.expiring;
    }

    switch (subscription.status) {
      case domain.SubscriptionStatus.active:
        return SubscriptionStatus.active;
      case domain.SubscriptionStatus.expired:
        return SubscriptionStatus.expired;
      case domain.SubscriptionStatus.cancelled:
        return SubscriptionStatus.canceled;
      case domain.SubscriptionStatus.suspended:
        return SubscriptionStatus.canceled;
      case domain.SubscriptionStatus.pendingPayment:
        return SubscriptionStatus.pending;
    }
  }

  String _getPeriodFromPlanName(String planName) {
    // Simple heuristic to extract period from plan name
    final lowerName = planName.toLowerCase();
    if (lowerName.contains('month')) return 'month';
    if (lowerName.contains('year')) return 'year';
    if (lowerName.contains('week')) return 'week';
    if (lowerName.contains('day')) return 'day';
    return 'period';
  }

  Future<void> _handleRenew(
    BuildContext context,
    WidgetRef ref,
    domain.Subscription subscription,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RenewalBottomSheet(
        subscriptionId: subscription.id,
        planName: subscription.planName,
        renewalPrice: subscription.price.amount,
        onRenew: (paymentMethodId) async {
          await ref.read(userSubscriptionsProvider().notifier).renewSubscription(
            subscription.id,
            paymentMethodId,
          );
        },
      ),
    );

    if (result == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subscription renewed successfully!'),
          backgroundColor: AppColors.success500,
        ),
      );
    }
  }

  Future<void> _handleCancel(
    BuildContext context,
    WidgetRef ref,
    domain.Subscription subscription,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        return AlertDialog(
          backgroundColor: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
          title: Text(
            'Cancel Subscription',
            style: AppTypography.h6.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel your subscription to ${subscription.gymName}? You will lose access at the end of your billing period.',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.neutral600,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Keep Subscription',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.neutral600,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Cancel Subscription',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.error500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    try {
      await ref.read(userSubscriptionsProvider().notifier).cancelSubscription(
            subscription.id,
            'User requested cancellation',
          );

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Subscription cancelled successfully',
            style: AppTypography.bodyMd.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.success500,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );

      context.pop(); // Go back to subscriptions list
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to cancel subscription: ${e.toString()}',
            style: AppTypography.bodyMd.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.error500,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  void _showQRCodeBottomSheet(
    BuildContext context,
    WidgetRef ref,
    domain.Subscription subscription,
    Gym? gym,
  ) {
    final authState = ref.read(authNotifierProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    if (user == null) return;

    // Get user initials
    final initials = user.fullName != null && user.fullName!.isNotEmpty
        ? user.fullName!
            .split(' ')
            .where((word) => word.isNotEmpty)
            .take(2)
            .map((word) => word[0].toUpperCase())
            .join()
        : 'U';

    final gymLocation = gym != null
        ? '${gym.address.street}, ${gym.address.city}, ${gym.address.state}'
        : '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeBottomSheet(
        subscriptionId: subscription.id,
        gymId: subscription.gymId,
        gymName: subscription.gymName,
        gymLocation: gymLocation,
        userName: user.fullName ?? 'User',
        userInitials: initials,
        gymImageUrl: gym?.coverPhotoUrl,
      ),
    );
  }

  void _showComingSoonSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'This feature is coming soon!',
          style: AppTypography.bodyMd.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary500,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
