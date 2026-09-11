import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';

/// MFA method enum
enum MfaMethod { biometric, pin, otp }

/// MFA challenge page - multi-factor authentication
class MfaChallengePageParams {
  final MfaMethod initialMethod;
  final String? phoneNumber;
  final double? amount;
  final String? mfaToken;

  const MfaChallengePageParams({
    this.initialMethod = MfaMethod.biometric,
    this.phoneNumber,
    this.amount,
    this.mfaToken,
  });
}

class MfaChallengePage extends ConsumerStatefulWidget {
  final MfaChallengePageParams? params;

  const MfaChallengePage({
    super.key,
    this.params,
  });

  @override
  ConsumerState<MfaChallengePage> createState() => _MfaChallengePageState();
}

class _MfaChallengePageState extends ConsumerState<MfaChallengePage> {
  late MfaMethod _currentMethod;
  bool _isLoading = false;
  String _pinCode = '';
  String _otpCode = '';
  int _resendCountdown = 24;
  Timer? _timer;
  bool _hasError = false;
  // ignore: unused_field
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _currentMethod = widget.params?.initialMethod ?? MfaMethod.biometric;
    if (_currentMethod == MfaMethod.otp) {
      _startResendTimer();
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

  void _switchMethod(MfaMethod method) {
    setState(() {
      _currentMethod = method;
      _hasError = false;
      _pinCode = '';
      _otpCode = '';
    });
    if (method == MfaMethod.otp) {
      _startResendTimer();
    }
  }

  String get _maskedPhone {
    return widget.params?.phoneNumber ?? '***-***-1234';
  }

  // ignore: unused_element
  Future<void> _handleBiometricAuth() async {
    setState(() => _isLoading = true);

    // Simulate biometric auth
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() => _isLoading = false);
      // Navigate on success
    }
  }

  Future<void> _handlePinVerify() async {
    if (_pinCode.length != 6) {
      setState(() => _hasError = true);
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() => _isLoading = false);
      // Navigate on success
    }
  }

  Future<void> _handleOtpVerify() async {
    if (_otpCode.length != 6) {
      setState(() => _hasError = true);
      return;
    }

    // Get MFA token from auth state or params
    final authState = ref.read(authNotifierProvider);
    String? mfaToken = widget.params?.mfaToken;
    if (authState is AuthMfaRequired) {
      mfaToken = authState.challenge.mfaToken;
    }

    if (mfaToken == null) {
      setState(() {
        _hasError = true;
        _errorMessage = 'MFA session expired. Please login again.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
      _errorMessage = null;
    });

    await ref.read(authNotifierProvider.notifier).verifyMfa(
          mfaToken: mfaToken,
          code: _otpCode,
        );
  }

  @override
  Widget build(BuildContext context) {
    // Listen for auth state changes
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        context.go('/home');
      } else if (next is AuthError) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = next.message;
        });
      } else if (next is AuthLoading) {
        setState(() => _isLoading = true);
      }
    });

    return AuthPageTemplate(
      showAppBar: true,
      appBarTitle: _getAppBarTitle(),
      showBackButton: true,
      onBackPressed: () => context.pop(),
      appBarAction: _currentMethod == MfaMethod.pin
          ? TextButton(
              onPressed: () {
                // TODO: Show help
              },
              child: Text(
                'Help?',
                style: AppTypography.labelMd.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          : null,
      child: _buildContent(),
    );
  }

  String _getAppBarTitle() {
    switch (_currentMethod) {
      case MfaMethod.biometric:
        return 'Security Check';
      case MfaMethod.pin:
        return 'Enter PIN';
      case MfaMethod.otp:
        return '';
    }
  }

  Widget _buildContent() {
    switch (_currentMethod) {
      case MfaMethod.biometric:
        return _buildBiometricContent();
      case MfaMethod.pin:
        return _buildPinContent();
      case MfaMethod.otp:
        return _buildOtpContent();
    }
  }

  Widget _buildBiometricContent() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final amount = widget.params?.amount;

    return Column(
      children: [
        const SizedBox(height: AppSpacing.spacing8),
        // Fingerprint icon
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: isDark
                ? DarkAppColors.surfaceElevated1
                : AppColors.primary50,
            borderRadius: AppBorderRadius.xl,
          ),
          child: Icon(
            Icons.fingerprint,
            size: 60,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing6),
        // Title
        Text(
          'Confirm Your Purchase',
          style: AppTypography.h2.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2),
        // Subtitle with amount
        Text(
          'Verify your identity to complete this',
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
          ),
        ),
        if (amount != null)
          Text(
            '\$${amount.toStringAsFixed(2)} payment.',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: AppTypography.weightBold,
            ),
          ),
        const SizedBox(height: AppSpacing.spacing8),
        // Touch sensor prompt
        Text(
          'Touch the fingerprint sensor',
          style: AppTypography.labelMd.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const Spacer(),
        // Use PIN instead
        TextButton(
          onPressed: () => _switchMethod(MfaMethod.pin),
          child: Text(
            'Use PIN Instead',
            style: AppTypography.labelMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Cancel button
        AppSecondaryButton(
          text: 'Cancel',
          onPressed: () => context.pop(),
        ),
        const SizedBox(height: AppSpacing.spacing4),
      ],
    );
  }

  Widget _buildPinContent() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: AppSpacing.spacing8),
        // Title
        Text(
          'Enter Your PIN',
          style: AppTypography.h2.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing8),
        // PIN dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            final isFilled = index < _pinCode.length;
            return Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isFilled
                    ? theme.colorScheme.primary
                    : (isDark
                        ? DarkAppColors.borderDefault
                        : AppColors.neutral300),
              ),
            );
          }),
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Forgot PIN link
        TextButton(
          onPressed: () {
            // TODO: Handle forgot PIN
          },
          child: Text(
            'Forgot PIN?',
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
          ),
        ),
        const Spacer(),
        // Number pad
        _buildNumberPad(
          onNumberTap: (number) {
            if (_pinCode.length < 6) {
              setState(() => _pinCode += number);
              if (_pinCode.length == 6) {
                _handlePinVerify();
              }
            }
          },
          onDelete: () {
            if (_pinCode.isNotEmpty) {
              setState(() => _pinCode = _pinCode.substring(0, _pinCode.length - 1));
            }
          },
          onBiometric: () => _switchMethod(MfaMethod.biometric),
        ),
        const SizedBox(height: AppSpacing.spacing4),
      ],
    );
  }

  Widget _buildOtpContent() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // Back button
        Align(
          alignment: Alignment.centerLeft,
          child: AppBackButton(
            label: null,
            onPressed: () => context.pop(),
          ),
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Verify It's You",
            style: AppTypography.h2.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.spacing2),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We sent a 6-digit code to',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                ),
              ),
              Text(
                _maskedPhone,
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: AppTypography.weightMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.spacing6),
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
            _handleOtpVerify();
          },
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Resend countdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resend code in ${_formatTime(_resendCountdown)}',
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
            TextButton(
              onPressed: _resendCountdown <= 0 ? _startResendTimer : null,
              child: Text(
                'Resend',
                style: AppTypography.labelMd.copyWith(
                  color: _resendCountdown <= 0
                      ? theme.colorScheme.primary
                      : (isDark ? DarkAppColors.textMuted : AppColors.textMuted),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.spacing6),
        // Verify button
        AppPrimaryButton(
          text: 'Verify Code',
          icon: const Icon(Icons.arrow_forward, size: 20),
          onPressed: _handleOtpVerify,
          isLoading: _isLoading,
        ),
        const SizedBox(height: AppSpacing.spacing4),
        // Try another method
        TextButton(
          onPressed: () => _switchMethod(MfaMethod.biometric),
          child: Text(
            'Try another method',
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberPad({
    required Function(String) onNumberTap,
    required VoidCallback onDelete,
    required VoidCallback onBiometric,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bgColor = isDark ? DarkAppColors.surfaceElevated1 : AppColors.neutral100;

    Widget buildKey(String label, {VoidCallback? onTap, Widget? icon}) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 64,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: label.isNotEmpty ? bgColor : Colors.transparent,
              borderRadius: AppBorderRadius.md,
            ),
            child: Center(
              child: icon ??
                  Text(
                    label,
                    style: AppTypography.h3.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            buildKey('1', onTap: () => onNumberTap('1')),
            buildKey('2', onTap: () => onNumberTap('2')),
            buildKey('3', onTap: () => onNumberTap('3')),
          ],
        ),
        Row(
          children: [
            buildKey('4', onTap: () => onNumberTap('4')),
            buildKey('5', onTap: () => onNumberTap('5')),
            buildKey('6', onTap: () => onNumberTap('6')),
          ],
        ),
        Row(
          children: [
            buildKey('7', onTap: () => onNumberTap('7')),
            buildKey('8', onTap: () => onNumberTap('8')),
            buildKey('9', onTap: () => onNumberTap('9')),
          ],
        ),
        Row(
          children: [
            buildKey(
              '',
              onTap: onBiometric,
              icon: Icon(
                Icons.fingerprint,
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
            buildKey('0', onTap: () => onNumberTap('0')),
            buildKey(
              '',
              onTap: onDelete,
              icon: Icon(
                Icons.backspace_outlined,
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
