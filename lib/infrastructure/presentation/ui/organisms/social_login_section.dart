import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';

/// Social login section organism - divider + Google + Apple buttons
class SocialLoginSection extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;
  final bool isGoogleLoading;
  final bool isAppleLoading;
  final String dividerText;

  const SocialLoginSection({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
    this.isGoogleLoading = false,
    this.isAppleLoading = false,
    this.dividerText = 'or',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppDividerWithText(text: dividerText),
        GoogleSignInButton(
          onPressed: onGoogleTap,
          isLoading: isGoogleLoading,
        ),
        const SizedBox(height: AppSpacing.spacing3),
        AppleSignInButton(
          onPressed: onAppleTap,
          isLoading: isAppleLoading,
        ),
      ],
    );
  }
}
