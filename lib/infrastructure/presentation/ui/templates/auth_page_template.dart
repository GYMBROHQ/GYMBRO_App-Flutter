import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';

/// Auth page template - common layout for auth screens
class AuthPageTemplate extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool showAppBar;
  final String? appBarTitle;
  final Widget? appBarAction;
  final bool centerContent;
  final EdgeInsetsGeometry? padding;

  const AuthPageTemplate({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.onBackPressed,
    this.showAppBar = false,
    this.appBarTitle,
    this.appBarAction,
    this.centerContent = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget content = SingleChildScrollView(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing6,
            vertical: AppSpacing.spacing4,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBackButton && !showAppBar) ...[
            AppBackButton(onPressed: onBackPressed),
            const SizedBox(height: AppSpacing.spacing4),
          ],
          child,
        ],
      ),
    );

    if (centerContent) {
      content = Center(child: content);
    }

    return Scaffold(
      backgroundColor: isDark
          ? DarkAppColors.backgroundPrimary
          : AppColors.backgroundPrimary,
      appBar: showAppBar
          ? AppBar(
              leading: showBackButton
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: onBackPressed ??
                          () { if (context.canPop()) context.pop(); },
                    )
                  : null,
              title: appBarTitle != null
                  ? Text(
                      appBarTitle!,
                      style: AppTypography.h5.copyWith(
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : AppColors.textPrimary,
                      ),
                    )
                  : null,
              actions: appBarAction != null ? [appBarAction!] : null,
            )
          : null,
      body: SafeArea(child: content),
    );
  }
}

/// Auth page template with header branding
class AuthPageWithBranding extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AuthPageWithBranding({
    super.key,
    required this.child,
    this.showBackButton = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? DarkAppColors.backgroundPrimary
          : AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing4,
                vertical: AppSpacing.spacing3,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? DarkAppColors.borderDefault
                        : AppColors.borderLight,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const AppLogoHorizontal(),
                  const Spacer(),
                  if (showBackButton)
                    AppBackButton(onPressed: onBackPressed),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.spacing6),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
