import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../../../../application/subscription/state/checkout_notifier.dart';
import '../../../../../application/subscription/state/payment_methods_notifier.dart';

/// Payment Method Selection Page - Dedicated screen for choosing payment method
/// User selects between cash payment or saved/new cards before proceeding to checkout
class PaymentMethodSelectionPage extends ConsumerStatefulWidget {
  final String gymId;
  final String planId;

  const PaymentMethodSelectionPage({
    super.key,
    required this.gymId,
    required this.planId,
  });

  @override
  ConsumerState<PaymentMethodSelectionPage> createState() =>
      _PaymentMethodSelectionPageState();
}

class _PaymentMethodSelectionPageState
    extends ConsumerState<PaymentMethodSelectionPage> {
  String? selectedPaymentMethodId;
  bool isCashSelected = false;

  @override
  void initState() {
    super.initState();
    // Check if there's already a selected payment method from checkout state
    final checkoutState = ref.read(checkoutProvider);
    checkoutState.when(
      paymentMethodSelected: (_, __, ___, paymentMethod, ____, _____) {
        selectedPaymentMethodId = paymentMethod.id;
        isCashSelected = false;
      },
      cashPaymentSelected: (_, __, ___, ____, _____) {
        isCashSelected = true;
        selectedPaymentMethodId = null;
      },
      planSelected: (_, __, ___, ____, _____) {},
      initial: () {},
      loading: () {},
      processing: () {},
      success: (_) {},
      failure: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: _buildAppBar(context, isDark),
      body: paymentMethodsAsync.when(
        data: (methods) => _buildContent(context, isDark, methods),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildError(error.toString(), isDark),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      elevation: 0,
      centerTitle: true,
      leading: AppBackButton(
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Select Payment Method',
        style: AppTypography.h5.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDark, List paymentMethods) {
    final hasSelection = selectedPaymentMethodId != null || isCashSelected;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSpacing.spacing4,
            right: AppSpacing.spacing4,
            top: AppSpacing.spacing5,
            bottom: 120, // Space for fixed footer
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(isDark),
              SizedBox(height: AppSpacing.spacing6),
              _buildPaymentMethodSection(isDark, paymentMethods),
            ],
          ),
        ),
        _buildStickyFooter(isDark, hasSelection),
      ],
    );
  }

  Widget _buildInfoCard(bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: AppColors.primary500.withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: AppColors.primary500.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: AppColors.primary500,
            size: 24,
          ),
          SizedBox(width: AppSpacing.spacing3),
          Expanded(
            child: Text(
              'Choose how you\'d like to pay for your gym subscription',
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection(bool isDark, List paymentMethods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Options',
              style: AppTypography.h6.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            if (paymentMethods.isNotEmpty)
              TextButton.icon(
                onPressed: () async {
                  try {
                    final clientSecret = await ref
                        .read(paymentMethodsProvider.notifier)
                        .getSetupIntentClientSecret();
                    if (mounted) {
                      context.push('/payment/add-card', extra: clientSecret);
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${e.toString()}'),
                          backgroundColor: AppColors.error500,
                        ),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.add, size: 18),
                label: Text(
                  'Add New Card',
                  style: AppTypography.labelSm.copyWith(color: AppColors.primary500),
                ),
              ),
          ],
        ),
        SizedBox(height: AppSpacing.spacing3),

        // Cash payment option
        _buildCashPaymentOption(isDark),

        if (paymentMethods.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.spacing4),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing3),
                  child: Text(
                    'OR PAY WITH CARD',
                    style: AppTypography.labelSm.copyWith(
                      color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                  ),
                ),
              ],
            ),
          ),
          ...paymentMethods.map((method) => _buildCardOption(isDark, method)).toList(),
        ],

        if (paymentMethods.isEmpty) ...[
          SizedBox(height: AppSpacing.spacing4),
          _buildEmptyCardsState(isDark),
        ],
      ],
    );
  }

  Widget _buildCashPaymentOption(bool isDark) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCashSelected = true;
          selectedPaymentMethodId = null;
        });
      },
      child: Container(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        decoration: BoxDecoration(
          color: isDark
              ? DarkAppColors.surfaceElevated1
              : AppColors.backgroundPrimary,
          borderRadius: AppBorderRadius.lg,
          border: Border.all(
            color: isCashSelected
                ? AppColors.primary500
                : (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault),
            width: isCashSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isCashSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isCashSelected
                  ? AppColors.primary500
                  : (isDark ? DarkAppColors.textMuted : AppColors.textMuted),
            ),
            SizedBox(width: AppSpacing.spacing3),
            Container(
              padding: EdgeInsets.all(AppSpacing.spacing2),
              decoration: BoxDecoration(
                color: isCashSelected
                    ? AppColors.primary500.withValues(alpha: 0.1)
                    : (isDark ? DarkAppColors.surfaceElevated2 : AppColors.backgroundSecondary),
                borderRadius: AppBorderRadius.md,
              ),
              child: Icon(
                Icons.payments_outlined,
                size: 28,
                color: isCashSelected
                    ? AppColors.primary500
                    : (isDark ? DarkAppColors.textPrimary : AppColors.textPrimary),
              ),
            ),
            SizedBox(width: AppSpacing.spacing3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pay with Cash',
                    style: AppTypography.bodyMd.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing1),
                  Text(
                    'Pay at the gym. Subscription activates after staff confirmation.',
                    style: AppTypography.bodySm.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardOption(bool isDark, dynamic method) {
    final isSelected = selectedPaymentMethodId == method.id && !isCashSelected;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethodId = method.id;
          isCashSelected = false;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.spacing3),
        padding: EdgeInsets.all(AppSpacing.spacing4),
        decoration: BoxDecoration(
          color: isDark
              ? DarkAppColors.surfaceElevated1
              : AppColors.backgroundPrimary,
          borderRadius: AppBorderRadius.lg,
          border: Border.all(
            color: isSelected
                ? AppColors.primary500
                : (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? AppColors.primary500
                  : (isDark ? DarkAppColors.textMuted : AppColors.textMuted),
            ),
            SizedBox(width: AppSpacing.spacing3),
            Container(
              padding: EdgeInsets.all(AppSpacing.spacing2),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary500.withValues(alpha: 0.1)
                    : (isDark ? DarkAppColors.surfaceElevated2 : AppColors.backgroundSecondary),
                borderRadius: AppBorderRadius.md,
              ),
              child: Icon(
                Icons.credit_card,
                size: 28,
                color: isSelected
                    ? AppColors.primary500
                    : (isDark ? DarkAppColors.textPrimary : AppColors.textPrimary),
              ),
            ),
            SizedBox(width: AppSpacing.spacing3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.displayLabel,
                    style: AppTypography.bodyMd.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Expires ${method.expiryDate}',
                    style: AppTypography.bodySm.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (method.isDefault)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacing2,
                  vertical: AppSpacing.spacing1,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.1),
                  borderRadius: AppBorderRadius.sm,
                ),
                child: Text(
                  'Default',
                  style: AppTypography.labelXs.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCardsState(bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing5),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundSecondary,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.credit_card_outlined, size: 56, color: AppColors.textMuted),
          SizedBox(height: AppSpacing.spacing3),
          Text(
            'No saved cards',
            style: AppTypography.h6.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            'Add a payment card to pay online',
            textAlign: TextAlign.center,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
          ),
          SizedBox(height: AppSpacing.spacing4),
          AppButton(
            text: 'Add Payment Card',
            onPressed: () async {
              try {
                final clientSecret = await ref
                    .read(paymentMethodsProvider.notifier)
                    .getSetupIntentClientSecret();
                if (mounted) {
                  context.push('/payment/add-card', extra: clientSecret);
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${e.toString()}'),
                      backgroundColor: AppColors.error500,
                    ),
                  );
                }
              }
            },
            variant: ButtonVariant.outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildError(String error, bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: AppColors.error500),
            SizedBox(height: AppSpacing.spacing4),
            Text(
              'Error Loading Payment Methods',
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
              text: 'Go Back',
              onPressed: () => context.pop(),
              variant: ButtonVariant.outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickyFooter(bool isDark, bool hasSelection) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
          border: Border(
            top: BorderSide(
              color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: SafeArea(
          child: AppButton(
            text: 'Continue to Checkout',
            icon: const Icon(Icons.arrow_forward, size: 20),
            onPressed: hasSelection ? _handleContinue : null,
            isFullWidth: true,
            variant: ButtonVariant.primary,
          ),
        ),
      ),
    );
  }

  void _handleContinue() async {
    if (isCashSelected) {
      // Update checkout state with cash payment
      ref.read(checkoutProvider.notifier).selectCashPayment();
    } else if (selectedPaymentMethodId != null) {
      // Get the selected payment method and update checkout state
      final paymentMethodsAsync = ref.read(paymentMethodsProvider);
      final matches = paymentMethodsAsync.value?.where((m) => m.id == selectedPaymentMethodId);
      final paymentMethod = matches != null && matches.isNotEmpty ? matches.first : null;

      if (paymentMethod != null) {
        ref.read(checkoutProvider.notifier).selectPaymentMethod(paymentMethod);
      }
    }

    // Navigate to checkout page
    if (mounted) {
      context.push('/gyms/${widget.gymId}/plans/${widget.planId}/checkout');
    }
  }
}
