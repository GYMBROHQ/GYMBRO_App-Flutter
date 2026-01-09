import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';

/// Forgot password page - request password reset
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendResetLink() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authNotifierProvider.notifier).requestPasswordReset(
            email: _emailController.text.trim(),
          );

      if (mounted) {
        setState(() {
          _isLoading = false;
          _emailSent = true;
        });
        // Show success message - the API always returns success for security
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('If an account exists with this email, you will receive a password reset link.'),
          ),
        );
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

  void _handleLogin() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWithBranding(
      showBackButton: true,
      onBackPressed: () => context.pop(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            AppBackButton(onPressed: () => context.pop()),
            const SizedBox(height: AppSpacing.spacing4),
            // Header
            const PageHeader(
              title: 'Forgot Password?',
              subtitle: "Don't worry, we'll send you reset instructions",
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Email field
            AppTextField(
              label: 'Email Address',
              hint: 'Enter your email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleSendResetLink(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
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
            // Success message
            if (_emailSent) ...[
              AlertBanner.success(
                title: 'Reset link sent! Check your email.',
              ),
              const SizedBox(height: AppSpacing.spacing4),
            ],
            // Send reset link button
            AppPrimaryButton(
              text: 'Send Reset Link',
              onPressed: _isLoading ? null : _handleSendResetLink,
              isLoading: _isLoading,
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Back to login link
            AuthFooterLink(
              text: 'Remember password?',
              linkText: 'Log In',
              onLinkTap: _handleLogin,
            ),
          ],
        ),
      ),
    );
  }
}
