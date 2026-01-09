import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'infrastructure/presentation/config/theme/theme.dart';
import 'infrastructure/presentation/config/router/router.dart';
import 'infrastructure/services/stripe_service.dart';
import 'infrastructure/core/storage/app_preferences_service.dart';
import 'infrastructure/providers/providers.dart';
import 'infrastructure/presentation/ui/widgets/app_lifecycle_observer.dart';
import 'infrastructure/presentation/ui/pages/auth/biometric_lock_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Google Fonts uses Inter as the default font
  GoogleFonts.config.allowRuntimeFetching = true;

  // Initialize app preferences
  await AppPreferencesService.init();

  // Initialize Stripe
  await StripeService.initialize('pk_test_51SUJqkA8oJFkWs7fulTkNBVUsKaCI98QPPPNkXthgOxvdwjlDtfeFhfKebonQY74nUkeHQ8TreJLIDFiIsRhSRT600fxyOFx8W');

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeNotifierProvider);
    final appLockState = ref.watch(appLockProvider);
    final authState = ref.watch(authNotifierProvider);

    return AppLifecycleObserver(
      child: MaterialApp.router(
        title: 'GYMBRO',
        debugShowCheckedModeBanner: false,
        // Light theme
        theme: AppTheme.lightTheme,
        // Dark theme
        darkTheme: AppTheme.darkTheme,
        // Dynamic theme mode from provider
        themeMode: themeMode,
        // Router configuration with auth guards
        routerConfig: router,
        // Overlay lock screen when app is locked (only for authenticated users)
        builder: (context, child) {
          final isAuthenticated = authState is AuthAuthenticated;
          if (isAuthenticated && appLockState.status != AppLockStatus.unlocked) {
            return const BiometricLockPage();
          }
          return child ?? const SizedBox.shrink();
        },
      ),
    );
  }
}
