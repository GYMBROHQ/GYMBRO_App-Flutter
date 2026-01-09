import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/theme.dart';
import '../../../../application/subscription/state/payment_methods_notifier.dart';
import '../../../../domain/subscription/entities/payment_method.dart';
import '../molecules/payment_method_card.dart';

/// Bottom sheet for renewing a subscription with payment method selection
class RenewalBottomSheet extends ConsumerStatefulWidget {
  final String subscriptionId;
  final String planName;
  final double renewalPrice;
  final Future<void> Function(String paymentMethodId) onRenew;

  const RenewalBottomSheet({
    super.key,
    required this.subscriptionId,
    required this.planName,
    required this.renewalPrice,
    required this.onRenew,
  });

  @override
  ConsumerState<RenewalBottomSheet> createState() => _RenewalBottomSheetState();
}

class _RenewalBottomSheetState extends ConsumerState<RenewalBottomSheet> {
  String? _selectedPaymentMethodId;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.backgroundPrimary : AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Renew Subscription',
                    style: AppTypography.h4.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _isProcessing ? null : () => Navigator.pop(context),
                    color: isDark ? DarkAppColors.textSecondary : AppColors.neutral500,
                  ),
                ],
              ),
            ),

            // Plan info
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.surfaceElevated1
                      : AppColors.neutral50,
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.planName,
                      style: AppTypography.bodyMd.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${widget.renewalPrice.toStringAsFixed(2)}',
                      style: AppTypography.h5.copyWith(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Payment methods
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text(
                'Select Payment Method',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.neutral600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),

            paymentMethodsAsync.when(
              data: (methods) {
                if (methods.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Text(
                      'No payment methods available. Please add a payment method first.',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.error500,
                      ),
                    ),
                  );
                }

                // Auto-select default or first method
                if (_selectedPaymentMethodId == null) {
                  final defaultMethod = methods.firstWhere(
                    (m) => m.isDefault,
                    orElse: () => methods.first,
                  );
                  _selectedPaymentMethodId = defaultMethod.id;
                }

                return Column(
                  children: methods.map((method) {
                    return _buildPaymentMethodOption(isDark, method);
                  }).toList(),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Text(
                  'Failed to load payment methods',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.error500,
                  ),
                ),
              ),
            ),

            // Renew button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isProcessing || _selectedPaymentMethodId == null
                      ? null
                      : _handleRenew,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                    ),
                    disabledBackgroundColor: AppColors.neutral300,
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Renew Now',
                          style: AppTypography.button.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption(bool isDark, PaymentMethod method) {
    final isSelected = _selectedPaymentMethodId == method.id;

    return GestureDetector(
      onTap: _isProcessing
          ? null
          : () {
              setState(() {
                _selectedPaymentMethodId = method.id;
              });
            },
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.primary500
                : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: PaymentMethodCard(
          lastFourDigits: method.lastFour,
          cardBrand: method.brand?.toUpperCase(),
        ),
      ),
    );
  }

  Future<void> _handleRenew() async {
    if (_selectedPaymentMethodId == null) return;

    setState(() => _isProcessing = true);

    try {
      await widget.onRenew(_selectedPaymentMethodId!);
      if (mounted) {
        Navigator.pop(context, true); // Return true to indicate success
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isProcessing = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to renew subscription: $e'),
            backgroundColor: AppColors.error500,
          ),
        );
      }
    }
  }
}
