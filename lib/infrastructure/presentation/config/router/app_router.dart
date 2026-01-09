import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../ui/pages/auth/auth_pages.dart';
import '../../ui/pages/home/home_pages.dart';
import '../../ui/pages/profile/profile_pages.dart';
import '../../ui/pages/gym/gym_pages.dart';
import '../../ui/pages/payment/payment_checkout_page.dart';
import '../../ui/pages/payment/payment_success_page.dart';
import '../../ui/pages/payment/payment_methods_page.dart';
import '../../ui/pages/payment/payment_method_selection_page.dart';
import '../../ui/pages/payment/add_card_page.dart';
import '../../ui/pages/subscriptions/subscriptions_pages.dart';
import '../../ui/pages/qr/qr_pages.dart';
import '../../ui/pages/qr/qr_code_container.dart';
import '../../models/navigation_models.dart';
import '../../../providers/providers.dart';

/// Provider for the GoRouter instance
final routerProvider = Provider<GoRouter>((ref) {
  // Use ref.read instead of ref.watch to avoid rebuilding the router
  // The router will still refresh via refreshListenable

  return GoRouter(
    navigatorKey: AppRouter._rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(ref.read(authNotifierProvider.notifier).stream),
    redirect: (BuildContext context, GoRouterState state) {
      // Read current auth state in the redirect function
      final authState = ref.read(authNotifierProvider);
      final isAuthenticated = authState is AuthAuthenticated;
      final isAuthRoute = AppRouter._isAuthRoute(state.matchedLocation);
      final isPublicRoute = AppRouter._isPublicRoute(state.matchedLocation);
      final isMfaRequired = authState is AuthMfaRequired;

      // If MFA is required, redirect to MFA challenge
      if (isMfaRequired && state.matchedLocation != '/mfa-challenge') {
        return '/mfa-challenge';
      }

      // Redirect to login if not authenticated and trying to access protected route
      // (not a public route and not an auth route)
      if (!isAuthenticated && !isMfaRequired && !isAuthRoute && !isPublicRoute) {
        return '/login';
      }

      // Redirect to home if authenticated and on auth route (except MFA setup)
      if (isAuthenticated && isAuthRoute && state.matchedLocation != '/mfa-setup') {
        return '/home';
      }

      // No redirect needed
      return null;
    },
    routes: AppRouter._routes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri.path}'),
      ),
    ),
  );
});

/// Helper class to convert Stream to Listenable for GoRouter refresh
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// App router configuration using go_router
class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Shared routes list used by both router and routerProvider
  static List<RouteBase> get _routes => [
      // Home routes
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const HomePage();
        },
      ),

      // Profile routes
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),

      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/registration',
        name: 'registration',
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/reset-password',
        name: 'resetPassword',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: '/password-reset-success',
        name: 'passwordResetSuccess',
        builder: (context, state) => const PasswordResetSuccessPage(),
      ),
      GoRoute(
        path: '/device-verification',
        name: 'deviceVerification',
        builder: (context, state) {
          final email = state.uri.queryParameters['email'];
          return DeviceVerificationPage(email: email);
        },
      ),
      GoRoute(
        path: '/mfa-challenge',
        name: 'mfaChallenge',
        builder: (context, state) {
          final params = state.extra as MfaChallengePageParams?;
          return MfaChallengePage(params: params);
        },
      ),
      GoRoute(
        path: '/mfa-setup',
        name: 'mfaSetup',
        builder: (context, state) => const MfaSetupPage(),
      ),

      // Gym routes
      GoRoute(
        path: '/gyms/browse',
        name: 'browseGyms',
        builder: (context, state) => const BrowseGymsPage(),
      ),
      GoRoute(
        path: '/gyms/:gymId/details',
        name: 'gymDetails',
        builder: (context, state) {
          final gymId = state.pathParameters['gymId']!;
          return GymDetailsPage(gymId: gymId);
        },
      ),
      GoRoute(
        path: '/gyms/:gymId/plans',
        name: 'planSelection',
        builder: (context, state) {
          final gymId = state.pathParameters['gymId']!;
          return PlanSelectionPage(gymId: gymId);
        },
      ),
      GoRoute(
        path: '/gyms/:gymId/plans/:planId/payment-method',
        name: 'paymentMethodSelection',
        builder: (context, state) {
          final gymId = state.pathParameters['gymId']!;
          final planId = state.pathParameters['planId']!;
          return PaymentMethodSelectionPage(
            gymId: gymId,
            planId: planId,
          );
        },
      ),
      GoRoute(
        path: '/gyms/:gymId/plans/:planId/checkout',
        name: 'paymentCheckout',
        builder: (context, state) {
          final gymId = state.pathParameters['gymId']!;
          final planId = state.pathParameters['planId']!;
          return PaymentCheckoutPage(
            gymId: gymId,
            planId: planId,
          );
        },
      ),

      // Payment routes
      GoRoute(
        path: '/payment/success',
        name: 'paymentSuccess',
        builder: (context, state) {
          final data = state.extra as PaymentSuccessData;
          return PaymentSuccessPage(
            gymName: data.gymName,
            planName: data.planName,
            amount: data.amount,
            gymImageUrl: data.gymImageUrl,
            userEmail: data.userEmail,
            startDate: data.startDate,
            expiryDate: data.expiryDate,
          );
        },
      ),
      GoRoute(
        path: '/payment/methods',
        name: 'paymentMethods',
        builder: (context, state) => const PaymentMethodsPage(),
      ),
      GoRoute(
        path: '/payment/add-card',
        name: 'addCard',
        redirect: (context, state) {
          // Redirect to payment methods if no client secret is provided
          if (state.extra == null || state.extra is! String) {
            return '/payment/methods';
          }
          return null;
        },
        builder: (context, state) {
          final clientSecret = state.extra as String;
          return AddCardPage(clientSecret: clientSecret);
        },
      ),

      // Subscription routes
      GoRoute(
        path: '/subscriptions/my-subscriptions',
        name: 'mySubscriptions',
        builder: (context, state) => const MySubscriptionsPage(),
      ),
      GoRoute(
        path: '/subscriptions/history',
        name: 'subscriptionHistory',
        builder: (context, state) => const SubscriptionHistoryPage(),
      ),
      GoRoute(
        path: '/subscriptions/:subscriptionId/details',
        name: 'subscriptionDetails',
        builder: (context, state) {
          final subscriptionId = state.pathParameters['subscriptionId']!;
          return SubscriptionDetailsPage(
            subscriptionId: subscriptionId,
          );
        },
      ),
      GoRoute(
        path: '/subscriptions/:subscriptionId/qr',
        name: 'subscriptionQR',
        builder: (context, state) {
          final subscriptionId = state.pathParameters['subscriptionId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return QRCodeContainer(
            subscriptionId: subscriptionId,
            gymId: extra?['gymId'] ?? '',
            gymName: extra?['gymName'] ?? '',
            gymLocation: extra?['gymLocation'] ?? '',
            gymImageUrl: extra?['gymImageUrl'],
          );
        },
      ),

      // Profile sub-routes
      GoRoute(
        path: '/profile/edit',
        name: 'editProfile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/profile/access-history',
        name: 'accessHistory',
        builder: (context, state) => const AccessHistoryPage(),
      ),

      // QR routes
      GoRoute(
        path: '/qr/generate',
        name: 'qrGenerate',
        builder: (context, state) {
          final data = state.extra as QRGenerationData;
          return QRCodeGenerationPage(
            gymName: data.gymName,
            gymLocation: data.gymLocation,
            gymImageUrl: data.gymImageUrl,
            userName: data.userName,
            userInitials: data.userInitials,
            validityText: data.validityText,
            qrData: data.qrData,
          );
        },
      ),
    ];

  /// Check if the given route is an authentication route
  static bool _isAuthRoute(String location) {
    final authRoutes = [
      '/login',
      '/register',
      '/registration',
      '/forgot-password',
      '/reset-password',
      '/password-reset-success',
      '/device-verification',
      '/mfa-challenge',
      '/mfa-setup',
    ];
    return authRoutes.any((route) => location.startsWith(route));
  }

  /// Check if the given route is publicly accessible without authentication
  static bool _isPublicRoute(String location) {
    final publicRoutes = [
      '/home',
      '/gyms/browse',
      '/gyms/', // Allow viewing gym details
    ];
    return publicRoutes.any((route) => location.startsWith(route));
  }
}

/// Route names for type-safe navigation
class AppRoutes {
  AppRoutes._();

  // Home routes
  static const String home = '/home';
  static const String homeWithOnboarding = '/home?onboarding=true';

  // Profile routes
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String accessHistory = '/profile/access-history';

  // Auth routes
  static const String login = '/login';
  static const String register = '/register';
  static const String registration = '/registration';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String passwordResetSuccess = '/password-reset-success';
  static const String deviceVerification = '/device-verification';
  static const String mfaChallenge = '/mfa-challenge';
  static const String mfaSetup = '/mfa-setup';

  // Gym routes
  static const String browseGyms = '/gyms/browse';
  static String gymDetails(String gymId) => '/gyms/$gymId/details';
  static String planSelection(String gymId) => '/gyms/$gymId/plans';
  static String paymentMethodSelection(String gymId, String planId) =>
      '/gyms/$gymId/plans/$planId/payment-method';
  static String paymentCheckout(String gymId, String planId) =>
      '/gyms/$gymId/plans/$planId/checkout';

  // Payment routes
  static const String paymentSuccess = '/payment/success';
  static const String paymentMethods = '/payment/methods';

  // Subscription routes
  static const String mySubscriptions = '/subscriptions/my-subscriptions';
  static const String subscriptionHistory = '/subscriptions/history';
  static String subscriptionDetails(String subscriptionId) =>
      '/subscriptions/$subscriptionId/details';

  // QR routes
  static const String qrGenerate = '/qr/generate';
}
