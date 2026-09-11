import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';

/// Device verification page - verify new device with OTP
class DeviceVerificationPage extends StatefulWidget {
  final String? email;

  const DeviceVerificationPage({
    super.key,
    this.email,
  });

  @override
  State<DeviceVerificationPage> createState() => _DeviceVerificationPageState();
}

class _DeviceVerificationPageState extends State<DeviceVerificationPage> {
  // ignore: unused_field
  bool _isVerifying = false;
  bool _isResending = false;
  int _resendCountdown = 24;
  Timer? _timer;
  String _otpCode = '';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _resendCountdown = 24;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCountdown > 0) {
        setState(() => _resendCountdown--);
      } else {
        timer.cancel();
      }
    });
  }

  String get _maskedEmail {
    final email = widget.email ?? 'j***@gmail.com';
    if (email.contains('@')) {
      final parts = email.split('@');
      if (parts[0].length > 1) {
        return '${parts[0][0]}***@${parts[1]}';
      }
    }
    return email;
  }

  Future<void> _handleVerify() async {
    if (_otpCode.length != 6) {
      setState(() => _hasError = true);
      return;
    }

    setState(() {
      _isVerifying = true;
      _hasError = false;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isVerifying = false);
      // Navigate to home or show success
    }
  }

  Future<void> _handleResendCode() async {
    if (_resendCountdown > 0) return;

    setState(() => _isResending = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() => _isResending = false);
      _startResendTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification code sent!')),
      );
    }
  }

  void _handleSendViaSms() {
    // TODO: Implement SMS fallback
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AuthPageTemplate(
      showAppBar: true,
      appBarTitle: 'Device Verification',
      showBackButton: true,
      onBackPressed: () => context.pop(),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.spacing8),
          // Lock icon with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.surfaceElevated1
                      : AppColors.primary100,
                  borderRadius: AppBorderRadius.xl,
                ),
                child: Icon(
                  Icons.lock_outline,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
              ),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.success500,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? DarkAppColors.backgroundPrimary
                          : AppColors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 14,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.spacing6),
          // Title
          Text(
            'Verify This Device',
            style: AppTypography.h2.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing2),
          // Subtitle
          Text(
            'We sent a 6-digit code to',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
          ),
          Text(
            _maskedEmail,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: AppTypography.weightMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing8),
          // OTP input
          OtpInputGroup(
            length: 6,
            hasError: _hasError,
            onChanged: (code) {
              setState(() {
                _otpCode = code;
                _hasError = false;
              });
            },
            onCompleted: (code) {
              _otpCode = code;
              _handleVerify();
            },
          ),
          if (_hasError) ...[
            const SizedBox(height: AppSpacing.spacing2),
            Text(
              'Invalid code. Please try again.',
              style: AppTypography.bodySm.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.spacing6),
          // Resend button
          ResendCodeButton(
            remainingSeconds: _resendCountdown,
            isLoading: _isResending,
            onResend: _handleResendCode,
          ),
          const SizedBox(height: AppSpacing.spacing4),
          // Send via SMS link
          TextButton(
            onPressed: _handleSendViaSms,
            child: Text(
              'Send via SMS instead',
              style: AppTypography.labelMd.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing4),
          // Help link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.help_outline,
                size: 16,
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
              const SizedBox(width: AppSpacing.spacing1),
              Text(
                'Why verify devices?',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Security notice
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.spacing4),
            decoration: BoxDecoration(
              color: isDark
                  ? DarkAppColors.surfaceElevated1
                  : AppColors.neutral50,
              borderRadius: AppBorderRadius.lg,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shield_outlined,
                  size: 24,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.spacing3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SECURITY CHECK',
                        style: AppTypography.labelSm.copyWith(
                          color: isDark
                              ? DarkAppColors.textPrimary
                              : AppColors.textPrimary,
                          fontWeight: AppTypography.weightBold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'GYMBRO limits access to 3 active devices to protect your QR entry codes from unauthorized sharing.',
                        style: AppTypography.bodyXs.copyWith(
                          color: isDark
                              ? DarkAppColors.textMuted
                              : AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.spacing4),
        ],
      ),
    );
  }
}
