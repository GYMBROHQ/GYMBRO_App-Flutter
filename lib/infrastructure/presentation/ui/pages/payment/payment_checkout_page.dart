import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../../models/navigation_models.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../../../../application/subscription/state/checkout_notifier.dart';
import '../../../../../application/subscription/state/payment_methods_notifier.dart';
import '../../../../../domain/subscription/entities/subscription.dart' as domain;

/// Payment Checkout Page - Final checkout screen with payment method selection
/// Design: aggressive mobile-first revision from GYMBRO_Docs
class PaymentCheckoutPage extends ConsumerStatefulWidget {
  final String gymId;
  final String planId;

  const PaymentCheckoutPage({
    super.key,
    required this.gymId,
    required this.planId,
  });

  @override
  ConsumerState<PaymentCheckoutPage> createState() => _PaymentCheckoutPageState();
}

class _PaymentCheckoutPageState extends ConsumerState<PaymentCheckoutPage> {
  String? selectedPaymentMethodId;
  bool isCashSelected = false;
  bool agreedToTerms = false;
  String? _promoCodeError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final checkoutState = ref.watch(checkoutProvider);
    print('🔴 [PaymentCheckoutPage] Checkout state: ${checkoutState.runtimeType}');
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: _buildAppBar(context, isDark),
      body: checkoutState.when(
        initial: () => _buildError('No checkout session found', isDark),
        loading: () => _buildLoading(),
        planSelected: (plan, gymId, gymName, promoCode, discount) =>
            paymentMethodsAsync.when(
          data: (methods) => _buildContent(
            context,
            isDark,
            plan.name,
            gymName,
            plan.price.amount,
            discount ?? 0,
            methods,
            promoCode,
          ),
          loading: () => _buildLoading(),
          error: (error, stack) => _buildError(error.toString(), isDark),
        ),
        paymentMethodSelected: (plan, gymId, gymName, paymentMethod, promoCode, discount) =>
            paymentMethodsAsync.when(
          data: (methods) {
            // Auto-select the already chosen payment method
            if (selectedPaymentMethodId == null && !isCashSelected) {
              selectedPaymentMethodId = paymentMethod.id;
            }
            return _buildContent(
              context,
              isDark,
              plan.name,
              gymName,
              plan.price.amount,
              discount ?? 0,
              methods,
              promoCode,
            );
          },
          loading: () => _buildLoading(),
          error: (error, stack) => _buildError(error.toString(), isDark),
        ),
        cashPaymentSelected: (plan, gymId, gymName, promoCode, discount) =>
            paymentMethodsAsync.when(
          data: (methods) {
            // Auto-select cash payment
            if (!isCashSelected) {
              isCashSelected = true;
              selectedPaymentMethodId = null;
            }
            return _buildContent(
              context,
              isDark,
              plan.name,
              gymName,
              plan.price.amount,
              discount ?? 0,
              methods,
              promoCode,
            );
          },
          loading: () => _buildLoading(),
          error: (error, stack) => _buildError(error.toString(), isDark),
        ),
        processing: () => _buildProcessing(isDark),
        success: (subscription) {
          // Navigate to success page
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(
              '/payment/success',
              extra: PaymentSuccessData(
                gymName: subscription.gymName,
                planName: subscription.planName,
                amount: subscription.price.amount,
                gymImageUrl: '', // TODO: Get from gym details
                userEmail: 'user@example.com', // TODO: Get from auth
                startDate: subscription.startDate.toString(),
                expiryDate: subscription.endDate.toString(),
                isPending: subscription.status == domain.SubscriptionStatus.pendingPayment,
              ),
            );
          });
          return _buildProcessing(isDark);
        },
        failure: (error) => _buildError(error, isDark),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    bool isDark,
    String planName,
    String gymName,
    double subtotal,
    double discount,
    List paymentMethods,
    String? promoCode,
  ) {
    final total = subtotal - discount;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSpacing.spacing4,
            right: AppSpacing.spacing4,
            top: AppSpacing.spacing5,
            bottom: 180, // Space for fixed footer
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderSummaryCard(isDark, gymName, planName, subtotal, discount),
              SizedBox(height: AppSpacing.spacing6),
              _buildPromoCodeSection(isDark, promoCode, discount),
              SizedBox(height: AppSpacing.spacing6),
              _buildPaymentMethodSection(isDark, paymentMethods),
              SizedBox(height: AppSpacing.spacing6),
              _buildTermsCheckbox(isDark),
            ],
          ),
        ),
        _buildStickyFooter(isDark, total),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildProcessing(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: AppSpacing.spacing4),
          Text(
            'Processing payment...',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
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
              'Checkout Error',
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
        'Checkout',
        style: AppTypography.h5.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildOrderSummaryCard(
    bool isDark,
    String gymName,
    String planName,
    double subtotal,
    double discount,
  ) {
    final total = subtotal - discount;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.xl,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gymName,
                      style: AppTypography.h6.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.spacing1),
                    Text(
                      planName,
                      style: AppTypography.bodySm.copyWith(
                        color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSpacing.spacing3),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: AppSpacing.spacing3),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: AppTypography.bodyMd.copyWith(
                          color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: AppTypography.bodyMd.copyWith(
                          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  if (discount > 0) ...[
                    SizedBox(height: AppSpacing.spacing2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: AppTypography.bodyMd.copyWith(
                            color: AppColors.success500,
                          ),
                        ),
                        Text(
                          '-\$${discount.toStringAsFixed(2)}',
                          style: AppTypography.bodyMd.copyWith(
                            color: AppColors.success500,
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: AppSpacing.spacing3),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                          width: 1,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(top: AppSpacing.spacing3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: AppTypography.h6.copyWith(
                            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: AppTypography.h5.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection(bool isDark, List paymentMethods) {
    // Determine which payment method is selected
    String paymentLabel;
    String paymentDetails;
    IconData paymentIcon;

    if (isCashSelected) {
      paymentLabel = 'Pay with Cash';
      paymentDetails = 'Pay at the gym. Subscription activates after staff confirmation.';
      paymentIcon = Icons.payments_outlined;
    } else if (selectedPaymentMethodId != null) {
      // Find the selected payment method
      final matches = paymentMethods.where((m) => m.id == selectedPaymentMethodId);
      final selectedMethod = matches.isNotEmpty ? matches.first : null;

      if (selectedMethod != null) {
        paymentLabel = selectedMethod.displayLabel;
        paymentDetails = 'Expires ${selectedMethod.expiryDate}';
        paymentIcon = Icons.credit_card;
      } else {
        paymentLabel = 'No payment method selected';
        paymentDetails = 'Please select a payment method';
        paymentIcon = Icons.error_outline;
      }
    } else {
      paymentLabel = 'No payment method selected';
      paymentDetails = 'Please select a payment method';
      paymentIcon = Icons.error_outline;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Method',
              style: AppTypography.h6.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                context.push('/gyms/${widget.gymId}/plans/${widget.planId}/payment-method');
              },
              icon: const Icon(Icons.edit, size: 18),
              label: Text(
                'Change',
                style: AppTypography.labelSm.copyWith(color: AppColors.primary500),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.spacing3),
        Container(
          padding: EdgeInsets.all(AppSpacing.spacing4),
          decoration: BoxDecoration(
            color: isDark
                ? DarkAppColors.surfaceElevated1
                : AppColors.backgroundPrimary,
            borderRadius: AppBorderRadius.lg,
            border: Border.all(
              color: AppColors.primary500,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.spacing2),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.1),
                  borderRadius: AppBorderRadius.md,
                ),
                child: Icon(
                  paymentIcon,
                  size: 28,
                  color: AppColors.primary500,
                ),
              ),
              SizedBox(width: AppSpacing.spacing3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentLabel,
                      style: AppTypography.bodyMd.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppSpacing.spacing1),
                    Text(
                      paymentDetails,
                      style: AppTypography.bodySm.copyWith(
                        color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.check_circle,
                color: AppColors.success500,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox(bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: agreedToTerms,
            onChanged: (value) {
              setState(() {
                agreedToTerms = value ?? false;
              });
            },
            activeColor: AppColors.primary500,
            side: BorderSide(
              color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
              width: 2,
            ),
          ),
        ),
        SizedBox(width: AppSpacing.spacing3),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: AppColors.primary500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' and authorize the recurring charge.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStickyFooter(bool isDark, double total) {
    final canProceed = agreedToTerms && (selectedPaymentMethodId != null || isCashSelected);

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
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Column(
          children: [
            if (!isCashSelected)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 14,
                    color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  ),
                  SizedBox(width: AppSpacing.spacing1),
                  Text(
                    'Secured by Stripe',
                    style: AppTypography.labelXs.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 14,
                    color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  ),
                  SizedBox(width: AppSpacing.spacing1),
                  Text(
                    'Pending approval after payment at gym',
                    style: AppTypography.labelXs.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            SizedBox(height: AppSpacing.spacing3),
            AppButton(
              text: isCashSelected
                  ? 'Complete Order'
                  : 'Pay \$${total.toStringAsFixed(2)} Securely',
              icon: Icon(isCashSelected ? Icons.check : Icons.lock, size: 20),
              onPressed: canProceed ? _handlePayment : null,
              isFullWidth: true,
              variant: ButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCodeSection(
    bool isDark,
    String? currentPromoCode,
    double? currentDiscount,
  ) {
    return PromoCodeInput(
      appliedPromoCode: currentPromoCode,
      discountAmount: currentDiscount,
      errorMessage: _promoCodeError,
      onApply: (code) async {
        setState(() => _promoCodeError = null);

        // For now, we'll just apply the promo code to the checkout state
        // Backend validation will happen when the subscription is created
        // In a real implementation, you'd validate the promo code here
        // Note: This is a placeholder - actual validation should happen via backend API

        final checkoutState = ref.read(checkoutProvider);
        checkoutState.when(
          planSelected: (plan, gymId, gymName, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
            // TODO: Replace with actual API validation when backend supports it
            // await ref.read(checkoutProvider.notifier).applyPromoCode(subscriptionId, code);
          },
          paymentMethodSelected: (plan, gymId, gymName, paymentMethod, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
            ref.read(checkoutProvider.notifier).selectPaymentMethod(paymentMethod);
          },
          cashPaymentSelected: (plan, gymId, gymName, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
            ref.read(checkoutProvider.notifier).selectCashPayment();
          },
          initial: () {},
          loading: () {},
          processing: () {},
          success: (_) {},
          failure: (_) {},
        );
      },
      onRemove: () {
        setState(() => _promoCodeError = null);
        // Remove promo code from checkout state
        final checkoutState = ref.read(checkoutProvider);
        checkoutState.when(
          planSelected: (plan, gymId, gymName, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
          },
          paymentMethodSelected: (plan, gymId, gymName, paymentMethod, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
            ref.read(checkoutProvider.notifier).selectPaymentMethod(paymentMethod);
          },
          cashPaymentSelected: (plan, gymId, gymName, _, __) {
            ref.read(checkoutProvider.notifier).selectPlan(
              plan: plan,
              gymId: gymId,
              gymName: gymName,
            );
            ref.read(checkoutProvider.notifier).selectCashPayment();
          },
          initial: () {},
          loading: () {},
          processing: () {},
          success: (_) {},
          failure: (_) {},
        );
      },
    );
  }

  void _handlePayment() async {
    // Check if either cash or card payment is selected
    if (!isCashSelected && selectedPaymentMethodId == null) return;

    if (isCashSelected) {
      // For cash payment, directly complete the purchase
      await ref.read(checkoutProvider.notifier).completePurchase();
      return;
    }

    // Get the selected payment method for card payment
    final paymentMethodsAsync = ref.read(paymentMethodsProvider);
    final matches = paymentMethodsAsync.value?.where((m) => m.id == selectedPaymentMethodId);
    final paymentMethod = matches != null && matches.isNotEmpty ? matches.first : null;

    if (paymentMethod == null) return;

    // Update checkout state with selected payment method
    final checkoutState = ref.read(checkoutProvider);
    checkoutState.when(
      planSelected: (plan, gymId, gymName, promoCode, discount) {
        ref.read(checkoutProvider.notifier).selectPaymentMethod(paymentMethod);
      },
      paymentMethodSelected: (_, __, ___, ____, _____, ______) {},
      cashPaymentSelected: (_, __, ___, ____, _____) {},
      initial: () {},
      loading: () {},
      processing: () {},
      success: (_) {},
      failure: (_) {},
    );

    // Process the payment
    await ref.read(checkoutProvider.notifier).completePurchase();
  }
}
