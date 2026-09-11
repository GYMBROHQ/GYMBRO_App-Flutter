import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';
import '../../../../../domain/auth/auth.dart';

/// Steps in the MFA setup process
enum MfaSetupStep {
  loading,
  qrCode,
  verification,
  success,
}

/// Single-page MFA setup flow with QR code, verification, and success states
class MfaSetupPage extends ConsumerStatefulWidget {
  const MfaSetupPage({super.key});

  @override
  ConsumerState<MfaSetupPage> createState() => _MfaSetupPageState();
}

class _MfaSetupPageState extends ConsumerState<MfaSetupPage> {
  MfaSetupStep _currentStep = MfaSetupStep.loading;
  Timer? _timer;
  int _resendCountdown = 24;
  bool _isResending = false;
  String _otpCode = '';
  bool _hasError = false;
  // ignore: unused_field
  String? _errorMessage;
  // ignore: unused_field
  MfaSetup? _mfaSetup;
  // ignore: unused_field
  MfaBackupCodes? _backupCodes;

  @override
  void initState() {
    super.initState();
    _initiateMfaSetup();
  }

  Future<void> _initiateMfaSetup() async {
    final mfaSetup = await ref.read(authNotifierProvider.notifier).initiateMfaSetup();

    if (mounted) {
      if (mfaSetup != null) {
        setState(() {
          _mfaSetup = mfaSetup;
          _currentStep = MfaSetupStep.qrCode;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to initiate MFA setup. Please try again.';
          _currentStep = MfaSetupStep.qrCode;
        });
      }
    }
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

  Future<void> _handleCopyCode() async {
    final code = _mfaSetup?.secret ?? '';
    if (code.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code copied to clipboard')),
      );
    }
  }

  void _handleNextToVerification() {
    setState(() {
      _currentStep = MfaSetupStep.verification;
    });
    _startResendTimer();
  }

  Future<void> _handleVerify() async {
    if (_otpCode.length != 6) {
      setState(() => _hasError = true);
      return;
    }

    final mfaToken = _mfaSetup?.mfaToken;
    if (mfaToken == null) {
      setState(() {
        _hasError = true;
        _errorMessage = 'MFA session expired. Please try again.';
      });
      return;
    }

    setState(() {
      _hasError = false;
      _isResending = true;
    });

    final backupCodes = await ref.read(authNotifierProvider.notifier).completeMfaSetup(
          mfaToken: mfaToken,
          totpCode: _otpCode,
        );

    if (mounted) {
      if (backupCodes != null) {
        setState(() {
          _backupCodes = backupCodes;
          _currentStep = MfaSetupStep.success;
          _isResending = false;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _hasError = true;
          _errorMessage = 'Invalid code. Please try again.';
          _isResending = false;
        });
      }
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

  String _getTitle() {
    switch (_currentStep) {
      case MfaSetupStep.loading:
        return 'MFA Setup';
      case MfaSetupStep.qrCode:
        return 'MFA Setup';
      case MfaSetupStep.verification:
        return 'MFA Verification';
      case MfaSetupStep.success:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentStep == MfaSetupStep.qrCode,
      child: AuthPageTemplate(
        showAppBar: _currentStep != MfaSetupStep.success,
        appBarTitle: _getTitle(),
        showBackButton: _currentStep == MfaSetupStep.qrCode,
        child: _buildStepContent(),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case MfaSetupStep.loading:
        return const Center(child: CircularProgressIndicator());
      case MfaSetupStep.qrCode:
        return _buildQrStep();
      case MfaSetupStep.verification:
        return _buildVerificationStep();
      case MfaSetupStep.success:
        return _buildSuccessStep();
    }
  }

  Widget _buildQrStep() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final qrData = _mfaSetup?.qrCodeUri ?? '';
    final manualCode = _mfaSetup?.secret ?? '';

    return Column(
      children: [
        const SizedBox(height: AppSpacing.spacing8),
        // Icon with badge
        const IconWithBadge(
          icon: Icons.security,
          iconSize: 88,
          badgeIcon: Icons.check,
          badgeColor: AppColors.success500,
        ),
        const SizedBox(height: AppSpacing.spacing6),
        // Title
        Text(
          'Set Up Two-Factor Authentication',
          style: AppTypography.h2.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.spacing2),
        // Subtitle
        Text(
          'Scan the QR code below with your authenticator app',
          style: AppTypography.bodySm.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.spacing8),
        // QR Code in white container
        Container(
          padding: const EdgeInsets.all(AppSpacing.spacing3),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.xl,
            boxShadow: AppShadows.lg,
          ),
          child: QRCodeDisplay(
            data: qrData,
            size: 240,
            showScanningAnimation: false,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing6),
        // Manual code section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
          child: Column(
            children: [
              Text(
                "Can't scan? Enter this code manually:",
                style: AppTypography.bodyXs.copyWith(
                  color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.spacing3),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spacing3),
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.surfaceElevated1
                      : AppColors.neutral100,
                  borderRadius: AppBorderRadius.lg,
                  border: Border.all(
                    color: isDark
                        ? DarkAppColors.borderDefault
                        : AppColors.neutral300,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SelectableText(
                        manualCode,
                        style: AppTypography.labelLg.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: AppTypography.weightBold,
                          letterSpacing: 2,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spacing3),
                    IconButton(
                      icon: const Icon(Icons.content_copy, size: 20),
                      onPressed: _handleCopyCode,
                      tooltip: 'Copy to clipboard',
                      color: isDark
                          ? DarkAppColors.textMuted
                          : AppColors.neutral600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Help link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.help_outline,
              size: 14,
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
            const SizedBox(width: AppSpacing.spacing1),
            Text(
              'Why MFA?',
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
          ],
        ),
        const Spacer(),
        // Next button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
          child: AppButton(
            text: 'Next: Verify Code',
            icon: const Icon(Icons.arrow_forward),
            onPressed: _handleNextToVerification,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing4),
      ],
    );
  }

  Widget _buildVerificationStep() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: AppSpacing.spacing8),
        // Icon with badge
        const IconWithBadge(
          icon: Icons.phonelink_lock,
          iconSize: 80,
          badgeIcon: Icons.check,
          badgeColor: AppColors.success500,
        ),
        const SizedBox(height: AppSpacing.spacing6),
        // Title
        Text(
          'Verify Your Authenticator',
          style: AppTypography.h2.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2),
        // Subtitle
        Text(
          'Enter the 6-digit code from your app',
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
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
        // Try another method link
        TextButton(
          onPressed: () {
            // TODO: Implement alternative method
          },
          child: Text(
            'Try Another Method',
            style: AppTypography.labelMd.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2),
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
              'Why verify?',
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
                Icons.lock_outline,
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
                      'Multi-Factor Authentication secures your account.',
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
    );
  }

  Widget _buildSuccessStep() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Success icon with glow
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.success500,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.success500.withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.check_circle,
              size: 60,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing8),
          // Title
          Text(
            'MFA Setup Complete!',
            style: AppTypography.h1.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: AppTypography.weightBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.spacing3),
          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing6),
            child: Text(
              'Two-Factor Authentication is now enabled on your account. Your security has been enhanced.',
              style: AppTypography.bodyMd.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing8),
          // Warning banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
            padding: const EdgeInsets.all(AppSpacing.spacing4),
            decoration: BoxDecoration(
              color: isDark
                  ? DarkAppColors.surfaceElevated1
                  : AppColors.warning50,
              borderRadius: AppBorderRadius.lg,
              border: Border(
                left: BorderSide(
                  color: AppColors.warning500,
                  width: 4,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning_amber,
                  size: 24,
                  color: AppColors.warning500,
                ),
                const SizedBox(width: AppSpacing.spacing3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Important Security Alert',
                        style: AppTypography.labelMd.copyWith(
                          color: isDark
                              ? DarkAppColors.textPrimary
                              : AppColors.textPrimary,
                          fontWeight: AppTypography.weightBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Please ensure you have backed up your authenticator app data and saved your backup codes in a secure location.',
                        style: AppTypography.bodySm.copyWith(
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
          const Spacer(),
          // Continue button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
            child: AppButton(
              text: 'Continue to Dashboard',
              onPressed: () => context.go('/home'),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing3),
          // Manage backup codes link
          TextButton(
            onPressed: () {
              // TODO: Navigate to backup codes management
            },
            child: Text(
              'Manage Backup Codes',
              style: AppTypography.labelMd.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.spacing6),
        ],
      ),
    );
  }
}
