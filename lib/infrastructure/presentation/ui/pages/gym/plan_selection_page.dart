import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../organisms/organisms.dart';
import '../../../../../application/gym/state/gym_details_notifier.dart';
import '../../../../../application/gym/state/gym_subscription_provider.dart';
import '../../../../../application/subscription/state/plans_notifier.dart';
import '../../../../../application/subscription/state/checkout_notifier.dart';
import '../../../../../domain/subscription/entities/plan.dart';

/// Plan Selection Page - Displays subscription plans for a specific gym
/// Design: mobile-first revision from GYMBRO_Docs
class PlanSelectionPage extends ConsumerStatefulWidget {
  final String gymId;

  const PlanSelectionPage({
    super.key,
    required this.gymId,
  });

  @override
  ConsumerState<PlanSelectionPage> createState() => _PlanSelectionPageState();
}

class _PlanSelectionPageState extends ConsumerState<PlanSelectionPage> {
  bool showPromoCode = false;
  final TextEditingController promoCodeController = TextEditingController();

  @override
  void dispose() {
    promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Watch gym details, plans, and current subscription
    final gymDetailsAsync = ref.watch(gymDetailsProvider(widget.gymId));
    final plansAsync = ref.watch(gymPlansProvider(widget.gymId));
    final subscriptionAsync = ref.watch(gymActiveSubscriptionProvider(widget.gymId));

    // Get current plan ID if user has an active subscription
    final currentPlanId = subscriptionAsync.valueOrNull?.planId;

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: _buildAppBar(context, isDark),
      body: plansAsync.when(
        data: (plans) => gymDetailsAsync.when(
          data: (gym) => _buildContent(context, isDark, plans, gym, currentPlanId),
          loading: () => _buildLoading(),
          error: (error, stack) => _buildError(error.toString(), isDark),
        ),
        loading: () => _buildLoading(),
        error: (error, stack) => _buildError(error.toString(), isDark),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    bool isDark,
    List<Plan> plans,
    gym,
    String? currentPlanId,
  ) {
    if (plans.isEmpty) {
      return _buildEmptyState(isDark);
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGymInfo(isDark, gym),
            SizedBox(height: AppSpacing.spacing5),
            Text(
              'Choose Your Plan',
              style: AppTypography.h4.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSpacing.spacing4),
            ..._buildPlanCards(isDark, plans, currentPlanId),
            SizedBox(height: AppSpacing.spacing4),
            _buildPromoCodeSection(isDark),
            SizedBox(height: AppSpacing.spacing4),
            _buildSecurityFooter(isDark),
            SizedBox(height: AppSpacing.spacing6),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String error, bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error500,
            ),
            SizedBox(height: AppSpacing.spacing4),
            Text(
              'Failed to load plans',
              style: AppTypography.h5.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSpacing.spacing2),
            Text(
              error,
              textAlign: TextAlign.center,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
            ),
            SizedBox(height: AppSpacing.spacing4),
            AppButton(
              text: 'Try Again',
              onPressed: () {
                ref.invalidate(gymPlansProvider(widget.gymId));
                ref.invalidate(gymDetailsProvider(widget.gymId));
              },
              variant: ButtonVariant.outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
            SizedBox(height: AppSpacing.spacing4),
            Text(
              'No Plans Available',
              style: AppTypography.h5.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSpacing.spacing2),
            Text(
              'This gym doesn\'t have any subscription plans at the moment.',
              textAlign: TextAlign.center,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      elevation: 0,
      leading: AppBackButton(
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Choose Plan',
        style: AppTypography.h5.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildGymInfo(bool isDark, dynamic gym) {
    if (gym == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gym.name ?? 'Unknown Gym',
          style: AppTypography.h5.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSpacing.spacing1),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: AppIconSizes.xs,
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
            SizedBox(width: AppSpacing.spacing1),
            Expanded(
              child: Text(
                gym.address?.toString() ?? 'Address not available',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildPlanCards(bool isDark, List<Plan> plans, String? currentPlanId) {
    return plans.map((plan) {
      // Check if this is the user's current plan
      final isCurrentPlan = currentPlanId != null && plan.id == currentPlanId;

      // Determine badge and highlighting based on plan
      String? badge;
      bool isHighlighted = false;
      Color? titleColor;
      Color? badgeColor;

      // Simple heuristic: middle-priced plan is "Popular"
      if (plans.length >= 3) {
        final sortedByPrice = List<Plan>.from(plans)
          ..sort((a, b) => a.price.amount.compareTo(b.price.amount));
        if (plan == sortedByPrice[1]) {
          badge = 'Popular';
          isHighlighted = true;
        } else if (plan == sortedByPrice.last) {
          badge = 'Best Value';
          titleColor = AppColors.warning500;
          badgeColor = DarkAppColors.borderLight;
        }
      }

      return Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.spacing5),
        child: PlanCard(
          title: plan.name,
          price: plan.price.amount,
          period: plan.duration.unit,
          features: plan.features,
          badge: badge,
          badgeColor: badgeColor,
          titleColor: titleColor,
          isHighlighted: isHighlighted,
          isCurrentPlan: isCurrentPlan,
          onSelect: () => _handlePlanSelection(plan),
          isDark: isDark,
        ),
      );
    }).toList();
  }

  Widget _buildPromoCodeSection(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showPromoCode = !showPromoCode;
              });
            },
            borderRadius: AppBorderRadius.lg,
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.spacing4),
              child: Row(
                children: [
                  Icon(
                    Icons.local_offer,
                    size: AppIconSizes.sm,
                    color: AppColors.primary500,
                  ),
                  SizedBox(width: AppSpacing.spacing3),
                  Expanded(
                    child: Text(
                      'Have a promo code?',
                      style: AppTypography.bodyMd.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    showPromoCode
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: AppIconSizes.sm,
                    color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (showPromoCode) ...[
            const Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(AppSpacing.spacing4),
              child: Column(
                children: [
                  TextField(
                    controller: promoCodeController,
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      hintStyle: AppTypography.bodyMd.copyWith(
                        color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                      ),
                      filled: true,
                      fillColor: isDark
                          ? DarkAppColors.surfaceElevated2
                          : AppColors.backgroundPrimary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.input),
                        borderSide: BorderSide(
                          color: isDark
                              ? DarkAppColors.borderDefault
                              : AppColors.borderDefault,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.input),
                        borderSide: BorderSide(
                          color: isDark
                              ? DarkAppColors.borderDefault
                              : AppColors.borderDefault,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppRadius.input),
                        borderSide: const BorderSide(
                          color: AppColors.primary500,
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacing4,
                        vertical: AppSpacing.spacing3,
                      ),
                    ),
                    style: AppTypography.bodyMd.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing3),
                  AppButton(
                    text: 'Apply Code',
                    onPressed: _applyPromoCode,
                    isFullWidth: true,
                    variant: ButtonVariant.outlined,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSecurityFooter(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock,
          size: 16,
          color: (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary)
              .withValues(alpha: 0.5),
        ),
        SizedBox(width: AppSpacing.spacing2),
        Text(
          'Secure checkout via GYMBRO',
          style: AppTypography.labelXs.copyWith(
            color: (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary)
                .withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  void _handlePlanSelection(Plan plan) {
    // Get gym details for checkout
    final gymDetailsAsync = ref.read(gymDetailsProvider(widget.gymId));

    // Get gym name from already-loaded data (page already displays it)
    final gymName = gymDetailsAsync.value?.name ?? 'Unknown Gym';

    // Initialize checkout with selected plan BEFORE navigation
    ref.read(checkoutProvider.notifier).selectPlan(
      plan: plan,
      gymId: widget.gymId,
      gymName: gymName,
    );

    // Navigate to payment method selection page AFTER state is set
    context.push('/gyms/${widget.gymId}/plans/${plan.id}/payment-method');
  }

  void _applyPromoCode() {
    final code = promoCodeController.text.trim();
    if (code.isEmpty) {
      _showSnackBar('Please enter a promo code', isError: true);
      return;
    }

    // TODO: Implement promo code validation
    _showSnackBar('Promo code applied successfully!', isError: false);
    setState(() {
      showPromoCode = false;
      promoCodeController.clear();
    });
  }

  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTypography.bodyMd.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: isError ? AppColors.error500 : AppColors.success500,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.sm,
        ),
        margin: EdgeInsets.all(AppSpacing.spacing4),
      ),
    );
  }
}
