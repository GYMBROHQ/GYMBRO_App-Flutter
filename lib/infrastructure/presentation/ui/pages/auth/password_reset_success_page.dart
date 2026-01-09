import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';

/// Password reset success page - confirmation screen
class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  void _handleLogin(BuildContext context) {
    context.go('/login');
  }

  void _handleContactSupport(BuildContext context) {
    // TODO: Open support
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AuthPageWithBranding(
      showBackButton: false,
      child: Center(
        child: SuccessCard(
          title: 'Password Reset Success!',
          message: 'Your password has been successfully reset. You can now access your GYMBRO account.',
          primaryAction: AppPrimaryButton(
            text: 'Log In Now',
            icon: const Icon(Icons.login, size: 20),
            onPressed: () => _handleLogin(context),
          ),
          secondaryAction: TextButton(
            onPressed: () => _handleContactSupport(context),
            child: Text(
              'Need help? Contact Support',
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
