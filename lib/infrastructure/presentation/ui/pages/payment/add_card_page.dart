import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../../../../application/subscription/state/payment_methods_notifier.dart';

/// Add Card Page - Full-screen card entry form
/// Replaces the Stripe Payment Sheet modal with a custom full-screen experience
class AddCardPage extends ConsumerStatefulWidget {
  final String clientSecret;

  const AddCardPage({
    super.key,
    required this.clientSecret,
  });

  @override
  ConsumerState<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends ConsumerState<AddCardPage> {
  bool _isProcessing = false;
  bool _cardComplete = false;
  final _cardHolderController = TextEditingController();

  @override
  void dispose() {
    _cardHolderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: _buildAppBar(context, isDark),
      body: Column(
        children: [
          _buildSecurityBanner(isDark),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSpacing.spacing4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Card Information', isDark),
                  SizedBox(height: AppSpacing.spacing3),
                  _buildCardForm(isDark),
                  SizedBox(height: AppSpacing.spacing6),
                  _buildSectionTitle('Cardholder Name (Optional)', isDark),
                  SizedBox(height: AppSpacing.spacing3),
                  _buildCardHolderField(isDark),
                  SizedBox(height: AppSpacing.spacing8),
                  _buildTestCardInfo(isDark),
                ],
              ),
            ),
          ),
          _buildSaveButton(isDark),
        ],
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
        onPressed: _isProcessing ? null : () => context.pop(),
      ),
      title: Text(
        'Add Card',
        style: AppTypography.h6.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSecurityBanner(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary500.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: AppColors.primary500.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock,
            size: 14,
            color: AppColors.primary500,
          ),
          SizedBox(width: AppSpacing.spacing2),
          Text(
            'Protected by Stripe encryption',
            style: AppTypography.labelXs.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: EdgeInsets.only(left: AppSpacing.spacing1),
      child: Text(
        title.toUpperCase(),
        style: AppTypography.labelXs.copyWith(
          color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildCardForm(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.xl,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(AppSpacing.spacing4),
      child: CardFormField(
        enablePostalCode: true,
        style: CardFormStyle(
          backgroundColor: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
          textColor: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          placeholderColor: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          borderColor: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          cursorColor: AppColors.primary500,
          fontSize: 16,
          borderWidth: 1,
          borderRadius: AppRadius.md.toInt(),
        ),
        onCardChanged: (details) {
          setState(() {
            _cardComplete = details?.complete ?? false;
          });
        },
      ),
    );
  }

  Widget _buildCardHolderField(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.xl,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      child: TextField(
        controller: _cardHolderController,
        enabled: !_isProcessing,
        textCapitalization: TextCapitalization.words,
        style: AppTypography.bodyMd.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'John Doe',
          hintStyle: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(AppSpacing.spacing4),
        ),
      ),
    );
  }

  Widget _buildTestCardInfo(bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary)
            .withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                'Test Mode',
                style: AppTypography.labelSm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            'Use test card: 4242 4242 4242 4242\nAny future date, any CVC',
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
        border: Border(
          top: BorderSide(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.all(AppSpacing.spacing4),
      child: SafeArea(
        child: AppButton(
          text: _isProcessing ? 'Saving...' : 'Save Card',
          onPressed: _cardComplete && !_isProcessing ? _handleSaveCard : null,
          isLoading: _isProcessing,
          icon: _isProcessing ? null : const Icon(Icons.check),
        ),
      ),
    );
  }

  Future<void> _handleSaveCard() async {
    if (!_cardComplete || _isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      // Confirm the setup intent with the card details
      await ref.read(paymentMethodsProvider.notifier).confirmCardSetup(
            widget.clientSecret,
          );

      if (!mounted) return;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Card added successfully',
            style: AppTypography.bodyMd.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.success500,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
          margin: EdgeInsets.all(AppSpacing.spacing4),
        ),
      );

      // Navigate back to payment methods page
      context.pop(true);
    } catch (e) {
      if (!mounted) return;

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceFirst('Exception: ', ''),
            style: AppTypography.bodyMd.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.error500,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
          margin: EdgeInsets.all(AppSpacing.spacing4),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
}
