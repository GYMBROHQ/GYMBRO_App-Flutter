import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../../../../application/subscription/state/payment_methods_notifier.dart';
import '../../../../../domain/subscription/entities/payment_method.dart';

/// Payment Methods Page - Manage saved payment methods
/// Design: aggressive mobile-first revision from GYMBRO_Docs
class PaymentMethodsPage extends ConsumerStatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  ConsumerState<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends ConsumerState<PaymentMethodsPage> {
  bool _isProcessing = false;

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
        loading: () => _buildLoading(),
        error: (error, stack) => _buildError(error.toString(), isDark),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDark, List<PaymentMethod> methods) {
    if (methods.isEmpty) {
      return _buildEmptyState(isDark);
    }

    final defaultMethod = methods.firstWhere(
      (m) => m.isDefault,
      orElse: () => methods.first,
    );
    final savedMethods = methods.where((m) => m != defaultMethod).toList();

    return Column(
      children: [
        _buildSecurityBanner(isDark),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSpacing.spacing4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDefaultMethodSection(isDark, defaultMethod),
                if (savedMethods.isNotEmpty) ...[
                  SizedBox(height: AppSpacing.spacing6),
                  _buildSavedMethodsSection(isDark, savedMethods),
                ],
                SizedBox(height: AppSpacing.spacing4),
                _buildAddNewButton(isDark),
                SizedBox(height: AppSpacing.spacing8),
              ],
            ),
          ),
        ),
        _buildFooterTrustBadge(isDark),
      ],
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
              'Failed to load payment methods',
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
                ref.invalidate(paymentMethodsProvider);
              },
              variant: ButtonVariant.outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Column(
      children: [
        _buildSecurityBanner(isDark),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.spacing4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card_outlined,
                    size: 64,
                    color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                  ),
                  SizedBox(height: AppSpacing.spacing4),
                  Text(
                    'No Payment Methods',
                    style: AppTypography.h5.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing2),
                  Text(
                    'Add a payment method to start purchasing subscriptions.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodySm.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.spacing6),
                  AppButton(
                    text: 'Add Payment Method',
                    onPressed: _handleAddPaymentMethod,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
        ),
        _buildFooterTrustBadge(isDark),
      ],
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
        'Payment Methods',
        style: AppTypography.h6.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          color: AppColors.primary500,
          onPressed: _handleAddPaymentMethod,
        ),
      ],
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

  Widget _buildDefaultMethodSection(bool isDark, PaymentMethod defaultMethod) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppSpacing.spacing1),
          child: Text(
            'DEFAULT METHOD',
            style: AppTypography.labelXs.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.spacing3),
        _buildPaymentMethodCard(defaultMethod, isDark),
      ],
    );
  }

  Widget _buildSavedMethodsSection(bool isDark, List<PaymentMethod> savedMethods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppSpacing.spacing1),
          child: Text(
            'SAVED METHODS',
            style: AppTypography.labelXs.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.spacing3),
        ...savedMethods.map((method) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.spacing3),
            child: _buildPaymentMethodCard(method, isDark),
          );
        }),
      ],
    );
  }

  Widget _buildPaymentMethodCard(PaymentMethod method, bool isDark) {
    final cardBrand = method.brand?.toLowerCase() ?? 'card';

    return InkWell(
      onTap: () {},
      borderRadius: AppBorderRadius.xl,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
          borderRadius: AppBorderRadius.xl,
          border: Border.all(
            color: method.isDefault
                ? AppColors.primary500.withValues(alpha: 0.3)
                : (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault),
            width: method.isDefault ? 1.5 : 1,
          ),
          boxShadow: method.isDefault
              ? [
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.05),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        padding: EdgeInsets.all(AppSpacing.spacing4),
        child: Row(
          children: [
            // Card brand logo
            _buildBrandIcon(cardBrand, isDark),
            SizedBox(width: AppSpacing.spacing4),
            // Card details
            Expanded(
              child: Text(
                method.displayLabel,
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Right side - badge or menu
            Row(
              children: [
                if (method.isDefault)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.spacing2,
                      vertical: AppSpacing.spacing1,
                    ),
                    margin: EdgeInsets.only(right: AppSpacing.spacing2),
                    decoration: BoxDecoration(
                      color: AppColors.primary500,
                      borderRadius: AppBorderRadius.sm,
                    ),
                    child: Text(
                      'DEFAULT',
                      style: AppTypography.labelXs.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  iconSize: 20,
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  onPressed: _isProcessing ? null : () {
                    _showCardOptionsMenu(method, isDark);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandIcon(String brand, bool isDark) {
    // Brand colors
    Color backgroundColor;
    Color iconColor;
    String brandText;

    switch (brand) {
      case 'visa':
        backgroundColor = const Color(0xFF1A1F71);
        iconColor = Colors.white;
        brandText = 'VISA';
        break;
      case 'mastercard':
        backgroundColor = const Color(0xFF000000);
        iconColor = const Color(0xFFFF5F00);
        brandText = 'MC';
        break;
      case 'amex':
      case 'american_express':
        backgroundColor = const Color(0xFF006FCF);
        iconColor = Colors.white;
        brandText = 'AMEX';
        break;
      case 'discover':
        backgroundColor = const Color(0xFFFF6000);
        iconColor = Colors.white;
        brandText = 'DISC';
        break;
      case 'diners':
      case 'diners_club':
        backgroundColor = const Color(0xFF004A97);
        iconColor = Colors.white;
        brandText = 'DC';
        break;
      case 'jcb':
        backgroundColor = const Color(0xFF0B4EA2);
        iconColor = Colors.white;
        brandText = 'JCB';
        break;
      case 'unionpay':
        backgroundColor = const Color(0xFF002E6E);
        iconColor = Colors.white;
        brandText = 'UP';
        break;
      default:
        backgroundColor = isDark ? DarkAppColors.surfaceElevated2 : AppColors.backgroundSecondary;
        iconColor = isDark ? DarkAppColors.textSecondary : AppColors.textSecondary;
        brandText = '';
    }

    return Container(
      width: 48,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppBorderRadius.sm,
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: brandText.isNotEmpty
          ? Center(
              child: Text(
                brandText,
                style: TextStyle(
                  color: iconColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            )
          : Icon(
              Icons.credit_card,
              size: 18,
              color: iconColor,
            ),
    );
  }

  Widget _buildAddNewButton(bool isDark) {
    return InkWell(
      onTap: _isProcessing ? null : _handleAddPaymentMethod,
      borderRadius: AppBorderRadius.xl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.xl,
          border: Border.all(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: AppSpacing.spacing4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 20,
              color: _isProcessing
                  ? (isDark ? DarkAppColors.textMuted : AppColors.textMuted)
                  : (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary),
            ),
            SizedBox(width: AppSpacing.spacing3),
            Text(
              _isProcessing ? 'Processing...' : 'Add New Payment Method',
              style: AppTypography.bodyMd.copyWith(
                color: _isProcessing
                    ? (isDark ? DarkAppColors.textMuted : AppColors.textMuted)
                    : (isDark ? DarkAppColors.textPrimary : AppColors.textPrimary),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterTrustBadge(bool isDark) {
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
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing8,
        vertical: AppSpacing.spacing6,
      ),
      child: Column(
        children: [
          Icon(
            Icons.lock_outline,
            size: 20,
            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            'All payment information is encrypted and\nPCI-DSS compliant.',
            textAlign: TextAlign.center,
            style: AppTypography.labelXs.copyWith(
              color: (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary).withValues(alpha: 0.7),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _showCardOptionsMenu(PaymentMethod method, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.modal)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!method.isDefault)
                ListTile(
                  leading: Icon(
                    Icons.star_border,
                    color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  ),
                  title: Text(
                    'Set as default',
                    style: AppTypography.bodyMd.copyWith(
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _handleSetDefault(method.id);
                  },
                ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: AppColors.error500,
                ),
                title: Text(
                  'Remove',
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.error500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _handleRemovePaymentMethod(method);
                },
              ),
              SizedBox(height: AppSpacing.spacing2),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleAddPaymentMethod() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      // Get setup intent client secret from backend
      final clientSecret = await ref.read(paymentMethodsProvider.notifier).getSetupIntentClientSecret();

      if (!mounted) return;

      // Navigate to full-screen card entry form
      final result = await context.push<bool>('/payment/add-card', extra: clientSecret);

      if (!mounted) return;

      // If card was added successfully, refresh is already done by the AddCardPage
      if (result == true) {
        // Refresh handled by AddCardPage, just show success if not already shown
      }
    } catch (e) {
      if (!mounted) return;
      _showSnackBar('Error: ${e.toString()}', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _handleRemovePaymentMethod(PaymentMethod method) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        return AlertDialog(
          backgroundColor: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
          title: Text(
            'Remove Payment Method',
            style: AppTypography.h6.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          content: Text(
            'Are you sure you want to remove ${method.displayLabel}?',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Cancel',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Remove',
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
    if (!mounted) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      await ref.read(paymentMethodsProvider.notifier).removePaymentMethod(method.id);

      if (!mounted) return;
      _showSnackBar('Payment method removed', isError: false);
    } catch (e) {
      if (!mounted) return;
      _showSnackBar('Failed to remove payment method: ${e.toString()}', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  Future<void> _handleSetDefault(String paymentMethodId) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      await ref.read(paymentMethodsProvider.notifier).setDefaultPaymentMethod(paymentMethodId);

      if (!mounted) return;
      _showSnackBar('Default payment method updated', isError: false);
    } catch (e) {
      if (!mounted) return;
      _showSnackBar('Failed to set default: ${e.toString()}', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
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
