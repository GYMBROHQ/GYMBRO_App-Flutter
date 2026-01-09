import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../organisms/organisms.dart';
import '../../../config/theme/theme.dart';
import '../../../../providers/providers.dart';
import '../../../../../application/subscription/state/subscriptions_notifier.dart';
import '../../../../../application/gym/state/gym_browse_state.dart';
import '../../../../../domain/subscription/entities/subscription.dart';
import '../../../../../domain/auth/entities/user.dart';
import '../gym/browse_gyms_page.dart';
import '../profile/profile_pages.dart';
import '../subscriptions/subscriptions_pages.dart';

/// Main home screen displaying user subscriptions, quick actions, and nearby gyms
class HomePage extends ConsumerStatefulWidget {
  final int initialTab;

  const HomePage({
    super.key,
    this.initialTab = 0,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late int _currentNavIndex;

  @override
  void initState() {
    super.initState();
    _currentNavIndex = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isAuthenticated = authState is AuthAuthenticated;

    return Scaffold(
      body: IndexedStack(
        index: _currentNavIndex,
        children: [
          // Home tab - show different content based on auth state
          isAuthenticated
              ? _HomeTabContent(
                  onTabChanged: (index) {
                    setState(() {
                      _currentNavIndex = index;
                    });
                  },
                )
              : const _HomeNoAuthContent(),
          const BrowseGymsPage(),
          // My Gyms tab - show subscriptions if authenticated, browse prompt if not
          isAuthenticated
              ? const MySubscriptionsPage()
              : const _MyGymsNoAuthContent(),
          // Profile/Login tab
          isAuthenticated
              ? const ProfilePage()
              : const _LoginPromptContent(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentNavIndex,
        isAuthenticated: isAuthenticated,
        onTap: (index) {
          // If tapping Login tab when not authenticated, go to login page
          if (!isAuthenticated && index == 3) {
            context.push('/login');
            return;
          }
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}

/// Home tab content - the original home page content
class _HomeTabContent extends ConsumerStatefulWidget {
  final ValueChanged<int> onTabChanged;

  const _HomeTabContent({
    required this.onTabChanged,
  });

  @override
  ConsumerState<_HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends ConsumerState<_HomeTabContent> {
  late PageController _subscriptionPageController;
  int _currentSubscriptionPage = 0;

  @override
  void initState() {
    super.initState();
    _subscriptionPageController = PageController();

    // Check if user has completed onboarding and load gyms
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final hasCompleted = ref.read(onboardingNotifierProvider);
      if (!hasCompleted) {
        _showOnboardingModal();
      }

      // Load gyms if not already loaded
      final gymState = ref.read(gymBrowseNotifierProvider);
      if (gymState is! GymBrowseLoaded) {
        ref.read(gymBrowseNotifierProvider.notifier).loadGyms();
      }
    });
  }

  @override
  void dispose() {
    _subscriptionPageController.dispose();
    super.dispose();
  }

  void _handleOnboardingComplete() {
    ref.read(onboardingNotifierProvider.notifier).markAsCompleted();
  }

  void _handleOnboardingSkip() {
    ref.read(onboardingNotifierProvider.notifier).markAsCompleted();
  }

  void _showOnboardingModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => OnboardingModal(
        onComplete: _handleOnboardingComplete,
        onSkip: _handleOnboardingSkip,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Get auth state for user data
    final authState = ref.watch(authNotifierProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    // Get user's first name or fallback to "there"
    final userName = user?.fullName?.split(' ').first ?? 'there';

    // Watch subscriptions
    final subscriptionsAsync = ref.watch(userSubscriptionsProvider(activeOnly: true));

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // App Bar
          _buildAppBar(isDark),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome section
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back, $userName! 👋',
                          style: AppTypography.h4.copyWith(
                            color: isDark
                                ? DarkAppColors.textPrimary
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Ready for your workout today?',
                          style: AppTypography.labelSm.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.textMuted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Alert banner - show only if subscription is expiring soon
                  subscriptionsAsync.when(
                    data: (subscriptions) {
                      final expiringSub = subscriptions.firstWhere(
                        (sub) => sub.isExpiringSoon,
                        orElse: () => subscriptions.first,
                      );

                      if (!expiringSub.isExpiringSoon) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AlertBanner.warning(
                          title: 'Subscription Expiring',
                          subtitle: '${expiringSub.gymName} • ${expiringSub.daysRemaining} days left',
                          actionLabel: 'Renew',
                          onActionPressed: () {
                            context.push('/subscriptions/${expiringSub.id}/details');
                          },
                        ),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, _) => const SizedBox.shrink(),
                  ),

                  subscriptionsAsync.maybeWhen(
                    data: (subscriptions) => subscriptions.any((s) => s.isExpiringSoon)
                        ? const SizedBox(height: 16)
                        : const SizedBox.shrink(),
                    orElse: () => const SizedBox.shrink(),
                  ),

                  // Active Subscription section
                  subscriptionsAsync.when(
                    data: (subscriptions) {
                      if (subscriptions.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return _buildSubscriptionSection(
                        isDark: isDark,
                        subscriptions: subscriptions,
                      );
                    },
                    loading: () => _buildSection(
                      isDark: isDark,
                      title: 'Active Subscription',
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: isDark
                              ? DarkAppColors.surfaceElevated1
                              : AppColors.neutral100,
                          borderRadius: AppBorderRadius.xl,
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 16),

                  // Quick Actions section
                  _buildSection(
                    isDark: isDark,
                    title: 'Quick Actions',
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? DarkAppColors.surfaceElevated1
                            : Colors.white,
                        borderRadius: AppBorderRadius.xl,
                        border: isDark
                            ? null
                            : Border.all(color: AppColors.borderLight),
                      ),
                      child: Column(
                        children: [
                          QuickActionItem(
                            label: 'Find Gyms Nearby',
                            icon: Icons.near_me_rounded,
                            iconColor: AppColors.info500,
                            iconBackgroundColor:
                                AppColors.info500.withValues(alpha: 0.1),
                            onTap: () {
                              // Switch to Browse Gyms tab (index 1)
                              widget.onTabChanged(1);
                            },
                          ),
                          Divider(
                            height: 1,
                            color: isDark
                                ? DarkAppColors.borderDefault
                                : AppColors.borderLight,
                          ),
                          QuickActionItem(
                            label: 'View Map',
                            icon: Icons.map_rounded,
                            iconColor: AppColors.primary500,
                            iconBackgroundColor:
                                AppColors.primary500.withValues(alpha: 0.1),
                            onTap: () {
                              // Navigate to browse gyms (same as nearby for now)
                              context.push('/gyms/browse');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: isDark
                                ? DarkAppColors.borderDefault
                                : AppColors.borderLight,
                          ),
                          QuickActionItem(
                            label: 'Manage Payments',
                            icon: Icons.payment_rounded,
                            iconColor: AppColors.success500,
                            iconBackgroundColor:
                                AppColors.success500.withValues(alpha: 0.1),
                            onTap: () {
                              // Navigate to payment methods
                              context.push('/payment/methods');
                            },
                          ),
                          Divider(
                            height: 1,
                            color: isDark
                                ? DarkAppColors.borderDefault
                                : AppColors.borderLight,
                          ),
                          QuickActionItem(
                            label: 'Check-in History',
                            icon: Icons.history_rounded,
                            iconColor: AppColors.secondary500,
                            iconBackgroundColor:
                                AppColors.secondary500.withValues(alpha: 0.1),
                            onTap: () {
                              // Navigate to access history
                              context.push('/profile/access-history');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Discover Nearby section
                  Builder(
                    builder: (context) {
                      final gymState = ref.watch(gymBrowseNotifierProvider);

                      return switch (gymState) {
                        GymBrowseInitial() || GymBrowseError() => const SizedBox.shrink(),
                        GymBrowseLoading() => _buildSection(
                          isDark: isDark,
                          title: 'Discover Nearby',
                          child: SizedBox(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary500,
                              ),
                            ),
                          ),
                        ),
                        GymBrowseLoaded(:final gyms) => gyms.isEmpty
                            ? const SizedBox.shrink()
                            : _buildSection(
                                isDark: isDark,
                                title: 'Discover Nearby',
                                child: SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    itemCount: gyms.length > 5 ? 5 : gyms.length,
                                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                                    itemBuilder: (context, index) {
                                      final gym = gyms[index];
                                      // Check if gym is 24/7 by checking amenities
                                      final is24Hours = gym.amenities.any(
                                        (amenity) => amenity.toLowerCase().contains('24') ||
                                                     amenity.toLowerCase().contains('24/7') ||
                                                     amenity.toLowerCase().contains('24 hours'),
                                      );

                                      return GymCard(
                                        name: gym.name,
                                        distance: gym.distanceDisplay,
                                        rating: gym.rating ?? 0.0,
                                        tags: is24Hours ? const ['24/7'] : const [],
                                        imageUrl: gym.coverPhotoUrl,
                                        onTap: () {
                                          context.push('/gyms/${gym.id}/details');
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                      };
                    },
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color:
            isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
        border: Border(
          bottom: BorderSide(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderLight,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo
          const AppLogo(size: 24),
          const SizedBox(width: 8),
          Text(
            'GYMBRO',
            style: AppTypography.h5.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          // Actions
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
            iconSize: 20,
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_rounded),
                onPressed: () {},
                iconSize: 20,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.error500,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          const AppAvatar(
            size: 28,
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuC3hKse_oWHTQqZFXYDvRdGecyGmNcl896J-lckyc0hKpPWK1gZcACyqvw2i-n5F-iJXzASM1N7iR1GEAkctcg5bHOlINR9GF2e8l4_7KMw1mIXilhGLEEPJY2VluWYqC05hod6Ep5uZiP8H75lB_ysjGtlsw72wHtpW6c_Q4VuZtT-jpPVJs6nuiAtezh83YAN-SJ8EG2Zra_70AxtdnBDSluSot7YUMP_ZAKEpZ-_5_I6xQ3plBW7dmEwlX_VA4_E1It0QU3_NXg',
            initials: 'JD',
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required bool isDark,
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: AppTypography.labelSm.copyWith(
              color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _buildSubscriptionSection({
    required bool isDark,
    required List subscriptions,
  }) {
    if (subscriptions.length == 1) {
      // Single subscription - show card directly
      final sub = subscriptions.first;
      return _buildSection(
        isDark: isDark,
        title: 'Active Subscription',
        child: SubscriptionCard(
          gymName: sub.gymName,
          expiryDate: _formatExpiryDate(sub.endDate),
          imageUrl: null, // Will use placeholder
          isActive: sub.isActive,
          onShowQRCode: () => _showQRCodeBottomSheet(
            subscription: sub,
            user: (ref.read(authNotifierProvider) as AuthAuthenticated).user,
          ),
        ),
      );
    }

    // Multiple subscriptions - show slider
    return _buildSection(
      isDark: isDark,
      title: 'Active Subscriptions',
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _subscriptionPageController,
              itemCount: subscriptions.length,
              onPageChanged: (index) {
                setState(() {
                  _currentSubscriptionPage = index;
                });
              },
              itemBuilder: (context, index) {
                final sub = subscriptions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SubscriptionCard(
                    gymName: sub.gymName,
                    expiryDate: _formatExpiryDate(sub.endDate),
                    imageUrl: null,
                    isActive: sub.isActive,
                    onShowQRCode: () => _showQRCodeBottomSheet(
                      subscription: sub,
                      user: (ref.read(authNotifierProvider) as AuthAuthenticated).user,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              subscriptions.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentSubscriptionPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentSubscriptionPage == index
                      ? AppColors.primary500
                      : (isDark ? DarkAppColors.neutral600 : AppColors.neutral300),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatExpiryDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  void _showQRCodeBottomSheet({
    required Subscription subscription,
    required User user,
  }) {
    // Get user initials
    final initials = user.fullName != null && user.fullName!.isNotEmpty
        ? user.fullName!
            .split(' ')
            .where((word) => word.isNotEmpty)
            .take(2)
            .map((word) => word[0].toUpperCase())
            .join()
        : 'U';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeBottomSheet(
        subscriptionId: subscription.id,
        gymId: subscription.gymId,
        gymName: subscription.gymName,
        gymLocation: '', // TODO: Add gym location to subscription model
        userName: user.fullName ?? 'User',
        userInitials: initials,
      ),
    );
  }
}

/// Home content for unauthenticated users
class _HomeNoAuthContent extends StatelessWidget {
  const _HomeNoAuthContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // App Bar
          _buildAppBar(context, isDark),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Hero Section
                  _buildHeroSection(context, isDark),

                  const SizedBox(height: 32),

                  // Preview Nearby Gyms Section
                  _buildNearbyGymsSection(context, isDark),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
        border: Border(
          bottom: BorderSide(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderLight,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo
          const AppLogo(size: 24),
          const SizedBox(width: 8),
          Text(
            'GYMBRO',
            style: AppTypography.h5.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          // Account icon for login
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => context.push('/login'),
            iconSize: 24,
            tooltip: 'Log In',
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          // Large logo container
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary500.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: AppLogo(size: 48),
            ),
          ),

          const SizedBox(height: 24),

          // Title
          Text(
            'GYMBRO',
            style: AppTypography.h2.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Your Fitness Journey, Unlimited Possibilities',
            style: AppTypography.bodyLg.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          // Discover Gyms button (Primary)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: () => context.push('/gyms/browse'),
              icon: const Icon(Icons.explore_rounded, size: 20),
              label: const Text('Discover Gyms'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary500,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Sign Up button (Secondary)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/register'),
              icon: const Icon(Icons.person_add_rounded, size: 20),
              label: const Text('Sign Up for Free'),
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                side: BorderSide(
                  color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: AppTypography.labelLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Already have an account? Log In
          GestureDetector(
            onTap: () => context.push('/login'),
            child: RichText(
              text: TextSpan(
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
                children: [
                  const TextSpan(text: 'Already have an account? '),
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyGymsSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PREVIEW NEARBY GYMS',
                style: AppTypography.labelSm.copyWith(
                  color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
              TextButton(
                onPressed: () => context.push('/gyms/browse'),
                child: Text(
                  'See All',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Horizontal gym cards
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              GymCard(
                name: 'Iron Paradise',
                distance: '0.8 mi',
                rating: 4.8,
                tags: const ['24/7'],
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCA4B7i-jv1g9HiQlmWAgvuuTmFpDGZ6laAQvgts9PfgtPWobezQmYpickA3spex1guusSdEYawMw65lgLylRuFmMQ1MrhkXfutdM_OoSHaPg0MTLc7RCyMlasEC3-9-OViA_9luKiB9d4p-brm7cDyAcGOuFEhgq00xZw43Vrc0lF5tkWVUZ1OuFb2eDo82VDm1dzRRJVB3fybNPywOMUZaBbCdAPPnjtUybKlVuH3rX7p0RMy_ObNgqHcsoW2y913e9zWZZY2m70',
              ),
              const SizedBox(width: 12),
              GymCard(
                name: 'Muscle Beach',
                distance: '2.4 mi',
                rating: 4.5,
                tags: const ['Pool'],
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBFWVDbD05ap3HyBoh6NU-eWaVf2fgQGa32ekpOx_zbOCcEoscJPXIIzTPG0ZIUe4zz_fHsvCPnd8QbJ8IwzXPpryN58KgNOha3r4IUPywCH94sol6sy9VJDLonknucTYNJN6lmOwzIymslMJn8JoljmyQFB-u8DpwgWCATkJDqDhVv4c8OYY1XV0x9qY8bpdqWZYuhO4BY-6X9WdK6R6J-68sB6fQQOhXGrkC2N28ndeZA6-B_BbVrmaBA09P3-HmsXGNUSfX5bkE',
              ),
              const SizedBox(width: 12),
              GymCard(
                name: 'Zen Yoga',
                distance: '3.1 mi',
                rating: 4.9,
                tags: const ['Class'],
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCoxWfO_0Tmtmj2DP_688uK0xg8l8wEHzIbieNiKQTvUHSUV73WRVyPzx62FHpqFc9q9SebpoAUQagJ7hqDYABjlH8mR7AOAKlPkpjAbnU0E2FqfqRX77k0-Aa1nDYUDq0SlEsNchABb5fhXEqKFyG4Imn_o24gUn3Vs1d0zlnGgrBB_pIPwglNiPllolJ-bU6oZhM9usz3hgmODql_C4EmGxCZhwowRxTAcn5C59L0uHk9rolRm3eK1Yr9MGoEgL2f2ZLqlnrPxLE',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// My Gyms tab content for unauthenticated users
class _MyGymsNoAuthContent extends StatelessWidget {
  const _MyGymsNoAuthContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.fitness_center_rounded,
                  size: 40,
                  color: AppColors.primary500,
                ),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                'Your Gyms',
                style: AppTypography.h4.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                'Sign in to view and manage your gym subscriptions',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Sign In button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: () => context.push('/login'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),

              const SizedBox(height: 12),

              // Browse Gyms button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => context.push('/gyms/browse'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    side: BorderSide(
                      color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Browse Gyms'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Login prompt content for unauthenticated users on Profile tab
class _LoginPromptContent extends StatelessWidget {
  const _LoginPromptContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 40,
                  color: AppColors.primary500,
                ),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                'Welcome to GYMBRO',
                style: AppTypography.h4.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                'Sign in to access your profile, subscriptions, and more',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Sign In button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: () => context.push('/login'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),

              const SizedBox(height: 12),

              // Create Account button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => context.push('/register'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    side: BorderSide(
                      color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}