import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../organisms/organisms.dart';
import '../../../../../application/subscription/state/subscriptions_notifier.dart';
import '../../../../../domain/subscription/entities/subscription.dart' as domain;
import '../../../../providers/providers.dart';

/// My Subscriptions Page - Main screen showing active and past gym memberships
class MySubscriptionsPage extends ConsumerWidget {
  const MySubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subscriptionsAsync = ref.watch(userSubscriptionsProvider());

    return Scaffold(
      backgroundColor: isDark
          ? DarkAppColors.backgroundPrimary
          : AppColors.neutral50,
      body: SafeArea(
        child: subscriptionsAsync.when(
          data: (subscriptions) => _buildContent(context, ref, isDark, subscriptions),
          loading: () => _buildLoading(isDark),
          error: (error, stack) => _buildError(context, ref, isDark, error.toString()),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
    List<domain.Subscription> subscriptions,
  ) {
    // Separate active and past subscriptions
    final activeSubscriptions = subscriptions
        .where((s) => s.status == domain.SubscriptionStatus.active)
        .toList();
    final pastSubscriptions = subscriptions
        .where((s) =>
            s.status == domain.SubscriptionStatus.expired ||
            s.status == domain.SubscriptionStatus.cancelled)
        .toList();

    return Column(
      children: [
        _buildHeader(context, ref, isDark),
        Expanded(
          child: activeSubscriptions.isEmpty && pastSubscriptions.isEmpty
              ? _buildEmptyState(context, isDark)
              : SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Active Section Header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                        child: Text(
                          'Active (${activeSubscriptions.length})',
                          style: AppTypography.bodyMd.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary
                                : AppColors.neutral900,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Active Subscriptions
                      if (activeSubscriptions.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'No active subscriptions',
                              style: AppTypography.bodySm.copyWith(
                                color: isDark
                                    ? DarkAppColors.textMuted
                                    : AppColors.neutral500,
                              ),
                            ),
                          ),
                        )
                      else
                        ...activeSubscriptions.map((subscription) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: ActiveSubscriptionCard(
                              gymName: subscription.gymName,
                              gymImageUrl: null, // TODO: Add gym images
                              planType: subscription.planName,
                              expiryText: _formatExpiryText(subscription.endDate),
                              status: _mapDomainStatusToUI(subscription),
                              isExpiring: subscription.isExpiringSoon,
                              warningText: subscription.isExpiringSoon
                                  ? 'Expires in ${subscription.daysRemaining} days'
                                  : null,
                              showRenewButton: subscription.isExpiringSoon,
                              onGenerateQR: () {
                                _showQRCodeBottomSheet(context, ref, subscription);
                              },
                              onRenew: subscription.canRenew
                                  ? () => _handleRenew(context, ref, subscription)
                                  : null,
                              onViewDetails: () {
                                context.push('/subscriptions/${subscription.id}/details');
                              },
                            ),
                          );
                        }),

                      // Past Subscriptions Section
                      if (pastSubscriptions.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDark
                                    ? DarkAppColors.surfaceElevated1
                                        .withValues(alpha: 0.5)
                                    : AppColors.white,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.xl),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.05),
                                ),
                              ),
                              child: ExpansionTile(
                                tilePadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                childrenPadding: const EdgeInsets.fromLTRB(
                                  16,
                                  8,
                                  16,
                                  16,
                                ),
                                title: Text(
                                  'Past (${pastSubscriptions.length})',
                                  style: AppTypography.bodySm.copyWith(
                                    color: isDark
                                        ? DarkAppColors.textPrimary
                                        : AppColors.neutral900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                iconColor: isDark
                                    ? DarkAppColors.textSecondary
                                    : AppColors.neutral600,
                                collapsedIconColor: isDark
                                    ? DarkAppColors.textSecondary
                                    : AppColors.neutral600,
                                children: pastSubscriptions
                                    .map((subscription) => Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: PastSubscriptionItem(
                                            gymName: subscription.gymName,
                                            gymImageUrl: null, // TODO: Add gym images
                                            planName: subscription.planName,
                                            endedDate: _formatDate(subscription.endDate),
                                            onRenew: subscription.canRenew
                                                ? () => _handleRenew(context, ref, subscription)
                                                : null,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref, bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Subscriptions',
            style: AppTypography.h3.copyWith(
              color: isDark
                  ? DarkAppColors.textPrimary
                  : AppColors.neutral900,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          Row(
            children: [
              // History button
              GestureDetector(
                onTap: () {
                  context.push('/subscriptions/history');
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isDark
                        ? DarkAppColors.surfaceElevated2
                        : AppColors.neutral200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.history,
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.neutral900,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Add button - navigate to gyms list
              GestureDetector(
                onTap: () {
                  context.go('/gyms');
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primary500,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Subscriptions',
                style: AppTypography.h3.copyWith(
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, bool isDark, String error) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Subscriptions',
                style: AppTypography.h3.copyWith(
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
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
                    'Failed to load subscriptions',
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
                    text: 'Try Again',
                    onPressed: () {
                      ref.invalidate(userSubscriptionsProvider());
                    },
                    variant: ButtonVariant.outlined,
                    isFullWidth: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Subscriptions',
                style: AppTypography.h3.copyWith(
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fitness_center_outlined,
                    size: 64,
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Subscriptions Yet',
                    style: AppTypography.h5.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : AppColors.neutral900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Browse gyms and subscribe to start your fitness journey',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySm.copyWith(
                      color: isDark
                          ? DarkAppColors.textSecondary
                          : AppColors.neutral600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Browse Gyms',
                    onPressed: () {
                      context.go('/gyms');
                    },
                    icon: const Icon(Icons.search),
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
        return SubscriptionStatus.canceled; // Treat suspended as canceled in UI
      case domain.SubscriptionStatus.pendingPayment:
        return SubscriptionStatus.pending;
    }
  }

  String _formatExpiryText(DateTime endDate) {
    final now = DateTime.now();
    final difference = endDate.difference(now).inDays;

    if (difference == 0) {
      return 'Expires today';
    } else if (difference == 1) {
      return 'Expires tomorrow';
    } else if (difference > 1 && difference <= 7) {
      return 'Expires in $difference days';
    } else {
      return 'Expires ${DateFormat('MMM dd, yyyy').format(endDate)}';
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  void _handleRenew(
    BuildContext context,
    WidgetRef ref,
    domain.Subscription subscription,
  ) {
    // TODO: Implement renewal flow with payment method selection
    _showComingSoonSnackBar(context);
  }

  void _showQRCodeBottomSheet(
    BuildContext context,
    WidgetRef ref,
    domain.Subscription subscription,
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

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeBottomSheet(
        subscriptionId: subscription.id,
        gymId: subscription.gymId,
        gymName: subscription.gymName,
        gymLocation: '', // TODO: Add gym location to subscription model
        userName: user.fullName ?? 'User',
        userInitials: initials,
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
