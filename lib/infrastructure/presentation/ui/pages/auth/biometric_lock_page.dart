import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../../../providers/providers.dart';

class BiometricLockPage extends ConsumerStatefulWidget {
  const BiometricLockPage({super.key});

  @override
  ConsumerState<BiometricLockPage> createState() => _BiometricLockPageState();
}

class _BiometricLockPageState extends ConsumerState<BiometricLockPage> {
  @override
  void initState() {
    super.initState();
    // Auto-trigger biometric prompt on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _attemptUnlock();
    });
  }

  Future<void> _attemptUnlock() async {
    if (!mounted) return;
    final appLockNotifier = ref.read(appLockProvider.notifier);
    await appLockNotifier.attemptBiometricUnlock();
  }

  Future<void> _logout() async {
    if (!mounted) return;
    await ref.read(authNotifierProvider.notifier).logout();
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLockState = ref.watch(appLockProvider);

    final backgroundColor = isDark
        ? DarkAppColors.backgroundPrimary
        : AppColors.backgroundSecondary;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Lock icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: isDark
                      ? DarkAppColors.surfaceElevated1
                      : AppColors.primary50,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  Icons.lock_outline,
                  size: 50,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              // Title
              Text(
                'App Locked',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                'Use biometrics to unlock GYMBRO',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? DarkAppColors.textMuted
                      : AppColors.textMuted,
                ),
              ),
              if (appLockState.errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  appLockState.errorMessage!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const Spacer(),
              // Unlock button
              if (appLockState.status != AppLockStatus.authenticating)
                AppButton(
                  text: 'Unlock',
                  icon: const Icon(Icons.fingerprint),
                  onPressed: _attemptUnlock,
                ),
              if (appLockState.status == AppLockStatus.authenticating)
                const CircularProgressIndicator(),
              const SizedBox(height: 16),
              // Login with password fallback
              TextButton(
                onPressed: _logout,
                child: Text(
                  'Login with Password',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
