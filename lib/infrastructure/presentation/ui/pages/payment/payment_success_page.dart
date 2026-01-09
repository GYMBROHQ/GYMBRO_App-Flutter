import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';

/// Payment Success Page - Celebration screen after successful payment
/// Design: aggressive mobile-first revision from GYMBRO_Docs
class PaymentSuccessPage extends StatefulWidget {
  final String gymName;
  final String planName;
  final double amount;
  final String? gymImageUrl;
  final String? userEmail;
  final String? startDate;
  final String? expiryDate;
  final bool isPending;

  const PaymentSuccessPage({
    super.key,
    required this.gymName,
    required this.planName,
    required this.amount,
    this.gymImageUrl,
    this.userEmail,
    this.startDate,
    this.expiryDate,
    this.isPending = false,
  });

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundSecondary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing4,
              vertical: AppSpacing.spacing6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSuccessIcon(),
                SizedBox(height: AppSpacing.spacing4),
                _buildHeadline(isDark),
                SizedBox(height: AppSpacing.spacing8),
                _buildSubscriptionDetailsCard(isDark),
                SizedBox(height: AppSpacing.spacing6),
                _buildEmailConfirmation(isDark),
                SizedBox(height: AppSpacing.spacing6),
                _buildActionButtons(isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isPending
              ? AppColors.warning500.withValues(alpha: 0.15)
              : AppColors.success500.withValues(alpha: 0.15),
        ),
        child: Icon(
          widget.isPending ? Icons.schedule : Icons.check_circle,
          size: 64,
          color: widget.isPending ? AppColors.warning500 : AppColors.success500,
        ),
      ),
    );
  }

  Widget _buildHeadline(bool isDark) {
    return Column(
      children: [
        Text(
          widget.isPending ? 'Order\nPlaced!' : 'Purchase\nSuccessful!',
          textAlign: TextAlign.center,
          style: AppTypography.displaySm.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        if (widget.isPending) ...[
          SizedBox(height: AppSpacing.spacing2),
          Text(
            'Pending staff approval',
            textAlign: TextAlign.center,
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.warning500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSubscriptionDetailsCard(bool isDark) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.xl,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderLight,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        children: [
          // Gym image and details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gym image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isDark ? DarkAppColors.surfaceElevated2 : AppColors.backgroundTertiary,
                  borderRadius: AppBorderRadius.lg,
                  image: widget.gymImageUrl != null
                      ? DecorationImage(
                          image: AssetImage(widget.gymImageUrl!),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) {
                            // Handle image loading error
                          },
                        )
                      : null,
                ),
                child: widget.gymImageUrl == null
                    ? Icon(
                        Icons.fitness_center,
                        size: 40,
                        color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                      )
                    : null,
              ),
              SizedBox(width: AppSpacing.spacing4),
              // Gym name and plan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.gymName,
                      style: AppTypography.h5.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: AppSpacing.spacing1),
                    Text(
                      widget.planName,
                      style: AppTypography.bodyMd.copyWith(
                        color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Divider
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.spacing4),
            child: Container(
              height: 1,
              color: isDark ? DarkAppColors.borderDefault : AppColors.borderLight,
            ),
          ),
          // Payment info grid (only for non-pending)
          if (!widget.isPending) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: AppTypography.labelXs.copyWith(
                          color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.spacing1),
                      Text(
                        widget.startDate ?? 'Oct 24, 2023',
                        style: AppTypography.bodyMd.copyWith(
                          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Expires',
                        style: AppTypography.labelXs.copyWith(
                          color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.spacing1),
                      Text(
                        widget.expiryDate ?? 'Nov 24, 2023',
                        style: AppTypography.bodyMd.copyWith(
                          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.spacing3),
          ],
          // Total paid / Amount to pay
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isPending ? 'Amount to Pay at Gym' : 'Total Paid',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${widget.amount.toStringAsFixed(2)}',
                style: AppTypography.h4.copyWith(
                  color: widget.isPending ? AppColors.warning500 : AppColors.primary500,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmailConfirmation(bool isDark) {
    if (widget.isPending) {
      return Container(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        decoration: BoxDecoration(
          color: AppColors.warning500.withValues(alpha: 0.1),
          borderRadius: AppBorderRadius.lg,
          border: Border.all(
            color: AppColors.warning500.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.info_outline,
              size: 32,
              color: AppColors.warning500,
            ),
            SizedBox(height: AppSpacing.spacing2),
            Text(
              'Next Steps',
              style: AppTypography.h6.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSpacing.spacing2),
            Text(
              '1. Visit ${widget.gymName}\n'
              '2. Pay \$${widget.amount.toStringAsFixed(2)} at the front desk\n'
              '3. Wait for staff to approve your subscription\n'
              '4. You\'ll be notified when you can start using the gym',
              textAlign: TextAlign.left,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTypography.bodySm.copyWith(
          color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
        ),
        children: [
          const TextSpan(text: 'Confirmation sent to: '),
          TextSpan(
            text: widget.userEmail ?? 'user@example.com',
            style: TextStyle(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isDark) {
    return Column(
      children: [
        // Primary action - Generate QR Code (only for non-pending)
        if (!widget.isPending)
          AppButton(
            text: 'Generate QR Code',
            icon: const Icon(Icons.qr_code_2, size: 20),
            onPressed: () {
              // TODO: Generate QR code for gym access
            },
            isFullWidth: true,
            variant: ButtonVariant.primary,
          ),
        if (!widget.isPending) SizedBox(height: AppSpacing.spacing3),
        // Secondary action - View subscriptions
        AppButton(
          text: 'View My Subscriptions',
          onPressed: () {
            // Navigate to Subscription History page
            context.push('/subscriptions/history');
          },
          isFullWidth: true,
          variant: widget.isPending ? ButtonVariant.primary : ButtonVariant.outlined,
        ),
        SizedBox(height: AppSpacing.spacing4),
        // Tertiary action - Done
        TextButton(
          onPressed: () {
            context.go('/home');
          },
          child: Text(
            'Done',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
