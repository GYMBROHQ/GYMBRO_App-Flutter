import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../../../../application/subscription/state/subscriptions_notifier.dart';
import '../../../../../domain/subscription/entities/subscription.dart' as domain;

/// Subscription History Page - Comprehensive list view of all subscriptions
class SubscriptionHistoryPage extends ConsumerStatefulWidget {
  const SubscriptionHistoryPage({super.key});

  @override
  ConsumerState<SubscriptionHistoryPage> createState() =>
      _SubscriptionHistoryPageState();
}

class _SubscriptionHistoryPageState
    extends ConsumerState<SubscriptionHistoryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subscriptionsAsync = ref.watch(userSubscriptionsProvider());

    return Scaffold(
      backgroundColor: isDark
          ? DarkAppColors.backgroundPrimary
          : AppColors.neutral50,
      body: subscriptionsAsync.when(
        data: (subscriptions) => _buildContent(context, isDark, subscriptions),
        loading: () => _buildLoading(context, isDark),
        error: (error, stack) => _buildError(context, isDark, error.toString()),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
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

    // Calculate total lifetime spent
    final totalLifetimeSpent =
        subscriptions.fold<double>(0, (sum, sub) => sum + sub.price.amount);

    return Column(
      children: [
        _buildHeader(context, isDark),
        Expanded(
          child: subscriptions.isEmpty
              ? _buildEmptyState(context, isDark)
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search and filter area
                      _buildSearchAndFilter(isDark),

                      // Active Section
                      if (activeSubscriptions.isNotEmpty) ...[
                        _buildSectionHeader(
                          isDark,
                          'ACTIVE (${activeSubscriptions.length})',
                          isActive: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: activeSubscriptions
                                .map((sub) => Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: _buildHistoryCard(
                                        context,
                                        subscription: sub,
                                        isActive: true,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],

                      // Past Section
                      if (pastSubscriptions.isNotEmpty) ...[
                        _buildSectionHeader(
                          isDark,
                          'PAST (${pastSubscriptions.length})',
                          isActive: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: pastSubscriptions
                                .map((sub) => Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: _buildHistoryCard(
                                        context,
                                        subscription: sub,
                                        isActive: false,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
        ),
        _buildFooterSummary(isDark, totalLifetimeSpent),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
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
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  size: 24,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Subscription History',
                style: AppTypography.h5.copyWith(
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isDark
                    ? DarkAppColors.surfaceElevated2
                    : AppColors.neutral200,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Icon(
                Icons.analytics,
                size: 20,
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: isDark ? DarkAppColors.backgroundPrimary : AppColors.neutral50,
      child: Column(
        children: [
          // Search bar
          TextField(
            controller: _searchController,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
            ),
            decoration: InputDecoration(
              hintText: 'Search subscriptions...',
              hintStyle: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.neutral500,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: isDark ? DarkAppColors.textMuted : AppColors.neutral500,
                size: 20,
              ),
              filled: true,
              fillColor: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
            onChanged: (value) {
              // TODO: Implement search filtering
            },
          ),
          const SizedBox(height: 12),
          // Action chips
          Row(
            children: [
              _buildActionChip(
                context,
                icon: Icons.calendar_month,
                label: 'Filter',
                onTap: () {
                  // TODO: Implement filter dialog
                  _showComingSoonSnackBar(context);
                },
              ),
              const SizedBox(width: 8),
              _buildActionChip(
                context,
                icon: Icons.download,
                label: 'Export',
                onTap: () {
                  // TODO: Implement export functionality
                  _showComingSoonSnackBar(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(bool isDark, String title,
      {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.backgroundPrimary.withValues(alpha: 0.95)
            : AppColors.white.withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Text(
        title,
        style: AppTypography.labelSm.copyWith(
          color: isActive
              ? (isDark ? DarkAppColors.textPrimary : AppColors.neutral900)
              : (isDark ? DarkAppColors.textMuted : AppColors.neutral600),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildHistoryCard(
    BuildContext context, {
    required domain.Subscription subscription,
    required bool isActive,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isActive
            ? (isDark ? DarkAppColors.surfaceElevated1 : AppColors.white)
            : (isDark
                ? DarkAppColors.surfaceElevated1.withValues(alpha: 0.6)
                : AppColors.white.withValues(alpha: 0.6)),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: isActive
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.white.withValues(alpha: 0.025),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Gym image placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  color: isDark
                      ? DarkAppColors.surfaceElevated2
                      : AppColors.neutral700,
                ),
                child: Icon(
                  Icons.fitness_center,
                  size: 20,
                  color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
                ),
              ),
              const SizedBox(width: 12),
              // Gym info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            subscription.gymName,
                            style: AppTypography.bodyMd.copyWith(
                              color: isActive
                                  ? (isDark
                                      ? DarkAppColors.textPrimary
                                      : AppColors.neutral900)
                                  : AppColors.neutral400,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${subscription.price.amount.toStringAsFixed(2)}',
                          style: AppTypography.bodySm.copyWith(
                            color: isActive
                                ? AppColors.primary500
                                : (isDark
                                    ? DarkAppColors.textMuted
                                    : AppColors.neutral500),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _getStatusColor(subscription.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          subscription.status.displayName,
                          style: AppTypography.bodyXs.copyWith(
                            color: _getStatusColor(subscription.status),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          ' • ',
                          style: AppTypography.bodyXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.neutral500,
                          ),
                        ),
                        Text(
                          DateFormat('MMM dd, yyyy').format(subscription.startDate),
                          style: AppTypography.bodyXs.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.neutral500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subscription.isActive
                          ? 'Renews ${DateFormat('MMM dd, yyyy').format(subscription.endDate)}'
                          : 'Ended ${DateFormat('MMM dd, yyyy').format(subscription.endDate)}',
                      style: AppTypography.bodyXs.copyWith(
                        color:
                            isDark ? DarkAppColors.textMuted : AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/subscriptions/${subscription.id}/details');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isActive
                          ? AppColors.primary500
                          : (isDark
                              ? DarkAppColors.surfaceElevated2
                              : AppColors.neutral200),
                      foregroundColor: isActive ? Colors.white : AppColors.primary500,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        side: !isActive
                            ? BorderSide(
                                color: AppColors.primary500.withValues(alpha: 0.2),
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Text(
                      isActive ? 'Manage' : 'View Details',
                      style: AppTypography.labelSm.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Generate receipt/invoice
                      _showComingSoonSnackBar(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDark
                          ? DarkAppColors.textSecondary
                          : AppColors.neutral700,
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.05),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                    ),
                    child: Text(
                      'Receipt',
                      style: AppTypography.labelSm.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSummary(bool isDark, double totalLifetimeSpent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Lifetime Spent',
                  style: AppTypography.bodyXs.copyWith(
                    color: isDark ? DarkAppColors.textMuted : AppColors.neutral600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${totalLifetimeSpent.toStringAsFixed(2)}',
                  style: AppTypography.h4.copyWith(
                    color:
                        isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary500.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.attach_money,
                color: AppColors.primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.bodyXs.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildHeader(context, isDark),
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
        _buildHeader(context, isDark),
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
                    'Failed to load subscription history',
                    style: AppTypography.h5.copyWith(
                      color:
                          isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySm.copyWith(
                      color:
                          isDark ? DarkAppColors.textSecondary : AppColors.neutral600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Try Again',
                    onPressed: () {
                      ref.invalidate(userSubscriptionsProvider());
                    },
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

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildHeader(context, isDark),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 64,
                    color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Subscription History',
                    style: AppTypography.h5.copyWith(
                      color:
                          isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your subscription history will appear here once you subscribe to a gym.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySm.copyWith(
                      color:
                          isDark ? DarkAppColors.textSecondary : AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(domain.SubscriptionStatus status) {
    switch (status) {
      case domain.SubscriptionStatus.active:
        return AppColors.success500;
      case domain.SubscriptionStatus.expired:
        return AppColors.warning500;
      case domain.SubscriptionStatus.cancelled:
        return AppColors.error500;
      case domain.SubscriptionStatus.suspended:
        return AppColors.error500;
      case domain.SubscriptionStatus.pendingPayment:
        return AppColors.warning500;
    }
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
