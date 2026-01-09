import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';

/// Reset password page - create new password
class ResetPasswordPage extends ConsumerStatefulWidget {
  final String? token;

  const ResetPasswordPage({super.key, this.token});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  PasswordStrength _passwordStrength = PasswordStrength.weak;
  List<PasswordRequirement> _requirements = [];

  @override
  void initState() {
    super.initState();
    _updatePasswordRequirements('');
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    _updatePasswordRequirements(_passwordController.text);
  }

  void _updatePasswordRequirements(String password) {
    final hasMinLength = password.length >= 8;
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));

    int score = 0;
    if (hasMinLength) score++;
    if (hasSpecialChar) score++;
    if (hasUppercase && hasLowercase) score++;
    if (hasNumber) score++;
    if (password.length >= 12) score++;

    PasswordStrength strength;
    if (score <= 1) {
      strength = PasswordStrength.weak;
    } else if (score == 2) {
      strength = PasswordStrength.fair;
    } else if (score == 3) {
      strength = PasswordStrength.medium;
    } else if (score == 4) {
      strength = PasswordStrength.good;
    } else {
      strength = PasswordStrength.strong;
    }

    setState(() {
      _passwordStrength = strength;
      _requirements = [
        PasswordRequirement(label: 'At least 8 characters', isMet: hasMinLength),
        PasswordRequirement(label: 'Contains a number', isMet: hasNumber),
        PasswordRequirement(
          label: 'Uppercase & lowercase letters',
          isMet: hasUppercase && hasLowercase,
        ),
        PasswordRequirement(label: 'Contains a special character', isMet: hasSpecialChar),
      ];
    });
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    final token = widget.token;
    if (token == null || token.isEmpty) {
      setState(() => _errorMessage = 'Invalid reset token. Please request a new password reset link.');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final success = await ref.read(authNotifierProvider.notifier).resetPassword(
            token: token,
            newPassword: _passwordController.text,
          );

      if (mounted) {
        setState(() => _isLoading = false);
        if (success) {
          context.go('/password-reset-success');
        } else {
          setState(() => _errorMessage = 'Failed to reset password. The link may have expired.');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
  }

  void _handleBackToLogin() {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWithBranding(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const PageHeader(
              title: 'Reset Password',
              subtitle: 'Create a strong password for your account to get back to your gains.',
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // New password field
            AppPasswordField(
              label: 'New Password',
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.spacing3),
            // Password strength indicator
            PasswordStrengthIndicator(
              strength: _passwordStrength,
              requirements: _requirements,
            ),
            const SizedBox(height: AppSpacing.spacing5),
            // Confirm password field
            AppPasswordField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleResetPassword(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Error message
            if (_errorMessage != null) ...[
              AlertBanner.error(
                title: _errorMessage!,
              ),
              const SizedBox(height: AppSpacing.spacing4),
            ],
            // Reset password button
            AppPrimaryButton(
              text: 'Reset Password',
              onPressed: _isLoading ? null : _handleResetPassword,
              isLoading: _isLoading,
            ),
            const SizedBox(height: AppSpacing.spacing4),
            // Back to login link
            Center(
              child: AppBackButton(
                label: 'Back to Login',
                onPressed: _handleBackToLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
