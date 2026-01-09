import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';
import 'mfa_challenge_page.dart' show MfaChallengePageParams, MfaMethod;

/// Login page - user authentication screen
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _errorMessage = null);

    await ref.read(authNotifierProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  void _handleForgotPassword() {
    context.push('/forgot-password');
  }

  void _handleSignUp() {
    context.push('/register');
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _handleAppleSignIn() {
    // TODO: Implement Apple sign in
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AuthLoading;

    // Listen for state changes
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      // Only navigate on fresh login, not on initial cached session load
      if (next is AuthAuthenticated && previous is AuthLoading) {
        // Navigate to home on successful login
        context.go('/home');
      } else if (next is AuthMfaRequired) {
        // Navigate to MFA challenge
        context.push('/mfa-challenge', extra: MfaChallengePageParams(
          initialMethod: MfaMethod.otp,
        ));
      } else if (next is AuthError) {
        setState(() => _errorMessage = next.message);
      }
    });

    return AuthPageTemplate(
      showBackButton: true,
      onBackPressed: () => context.pop(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSpacing.spacing4),
            // Header with logo
            const AuthHeader(
              title: 'Welcome Back!',
              showLogo: true,
            ),
            const SizedBox(height: AppSpacing.spacing8),
            // Error message
            if (_errorMessage != null) ...[
              AlertBanner.error(
                title: _errorMessage!,
              ),
              const SizedBox(height: AppSpacing.spacing4),
            ],
            // Email field
            AppTextField(
              label: 'Email Address',
              hint: 'example@email.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              enabled: !isLoading,
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
            const SizedBox(height: AppSpacing.spacing5),
            // Password field
            AppPasswordField(
              label: 'Password',
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              enabled: !isLoading,
              onSubmitted: (_) => _handleLogin(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.spacing2),
            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: AppLinkText(
                text: 'Forgot Password?',
                onTap: isLoading ? null : _handleForgotPassword,
              ),
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Login button
            AppPrimaryButton(
              text: 'Log In',
              onPressed: isLoading ? null : _handleLogin,
              isLoading: isLoading,
            ),
            // Social login section
            SocialLoginSection(
              onGoogleTap: isLoading ? null : _handleGoogleSignIn,
              onAppleTap: isLoading ? null : _handleAppleSignIn,
            ),
            const SizedBox(height: AppSpacing.spacing8),
            // Sign up link
            AuthFooterLink(
              text: "Don't have an account?",
              linkText: 'Sign Up',
              onLinkTap: isLoading ? null : _handleSignUp,
            ),
            const SizedBox(height: AppSpacing.spacing4),
          ],
        ),
      ),
    );
  }
}
