import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../../config/theme/theme.dart';
import '../../../../providers/providers.dart';
import '../../../../services/biometric_service.dart';

/// Profile page combining user profile information with account settings
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Colors from profile_screen design
    final backgroundColor = isDark
        ? DarkAppColors.backgroundPrimary
        : AppColors.backgroundSecondary;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withValues(alpha: 0.95),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Profile',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // TODO: Show profile options menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),

            // Profile Header Section
            _buildProfileHeader(context, theme),
            const SizedBox(height: 16),

            // Edit Profile Button
            AppButton(
              text: 'Edit Profile',
              icon: const Icon(Icons.edit_square),
              onPressed: () {
                context.push('/profile/edit');
              },
            ),
            const SizedBox(height: 24),

            // Statistics Row
            _buildStatistics(),
            const SizedBox(height: 24),

            // General Section
            _buildSectionHeader('GENERAL', theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.language,
              title: 'Language',
              type: SettingsItemType.valueWithNavigation,
              valueText: 'English (US)',
              onTap: () {
                // TODO: Navigate to language selection
              },
            ),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Push & Email',
              type: SettingsItemType.toggle,
              toggleValue: _notificationsEnabled,
              onToggleChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Security Section
            _buildSectionHeader('SECURITY', theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.lock,
              title: 'Change Password',
              type: SettingsItemType.navigation,
              onTap: () {
                // TODO: Navigate to change password
              },
            ),
            const SizedBox(height: 8),
            _buildBiometricAuthToggle(theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.history,
              title: 'Access History',
              type: SettingsItemType.navigation,
              onTap: () {
                context.push('/profile/access-history');
              },
            ),
            const SizedBox(height: 24),

            // Payments Section
            _buildSectionHeader('PAYMENTS', theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.credit_card,
              title: 'Payment Methods',
              subtitle: 'Manage your cards',
              type: SettingsItemType.navigation,
              onTap: () {
                context.push('/payment/methods');
              },
            ),
            const SizedBox(height: 24),

            // App Preferences Section
            _buildSectionHeader('APP PREFERENCES', theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.straighten,
              title: 'Units',
              type: SettingsItemType.valueWithNavigation,
              valueText: 'Metric (kg)',
              onTap: () {
                // TODO: Navigate to units selection
              },
            ),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.dark_mode,
              title: 'Theme',
              type: SettingsItemType.valueWithNavigation,
              valueText: _getThemeModeLabel(ref.watch(themeNotifierProvider)),
              onTap: () => _showThemeSelectionDialog(),
            ),
            const SizedBox(height: 24),

            // Support Section
            _buildSectionHeader('SUPPORT', theme),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.help,
              title: 'Help Center',
              type: SettingsItemType.externalLink,
              onTap: () {
                // TODO: Open help center
              },
            ),
            const SizedBox(height: 8),
            SettingsListItem(
              icon: Icons.shield,
              title: 'Privacy Policy',
              type: SettingsItemType.navigation,
              onTap: () {
                // TODO: Navigate to privacy policy
              },
            ),
            const SizedBox(height: 32),

            // Logout Button
            _buildLogoutButton(theme),
            const SizedBox(height: 16),

            // Version Info
            _buildVersionInfo(theme),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    final authState = ref.watch(authNotifierProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    // Colors from profile_screen design
    final backgroundColor = isDark
        ? DarkAppColors.backgroundPrimary
        : AppColors.backgroundSecondary;

    return Column(
      children: [
        // Avatar with edit button
        Stack(
          children: [
            AppAvatar(imageUrl: user?.avatarUrl ?? '', size: 96),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: backgroundColor, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.edit, size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Name
        Text(
          user?.fullName ?? 'User',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),

        // Email
        Text(
          user?.email.value ?? '',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isDark ? DarkAppColors.textMuted : AppColors.neutral600,
          ),
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return const Row(
      children: [
        Expanded(
          child: StatCard(label: 'Active Passes', value: '3'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(label: 'Gyms Visited', value: '12'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(label: 'Total Visits', value: '145'),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: theme.textTheme.labelSmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildLogoutButton(ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;

    return OutlinedButton(
      onPressed: () async {
        // Show confirmation dialog
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Log Out'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Log Out'),
              ),
            ],
          ),
        );

        if (confirmed == true && mounted) {
          // Call logout functionality
          await ref.read(authNotifierProvider.notifier).logout();

          // Navigate to login screen
          if (mounted) {
            context.go('/login');
          }
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? DarkAppColors.error500 : AppColors.error500,
        side: BorderSide(
          color: AppColors.error500.withValues(alpha: 0.5),
          width: 2,
        ),
        backgroundColor: AppColors.error500.withValues(alpha: 0.1),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            size: 20,
            color: isDark ? DarkAppColors.error500 : AppColors.error500,
          ),
          const SizedBox(width: 8),
          Text(
            'Log Out',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? DarkAppColors.error500 : AppColors.error500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionInfo(ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Text(
        'Version 2.4.1 (Build 2023)',
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isDark ? DarkAppColors.neutral500 : AppColors.neutral400,
        ),
      ),
    );
  }

  Widget _buildBiometricAuthToggle(ThemeData theme) {
    final biometricAvailable = ref.watch(biometricAvailableProvider);
    final biometricEnabled = ref.watch(biometricEnabledProvider);
    final isDark = theme.brightness == Brightness.dark;

    return biometricAvailable.when(
      data: (available) {
        return SettingsListItem(
          icon: Icons.fingerprint,
          title: 'Biometric Auth',
          subtitle: available ? 'Quick unlock' : 'Not available on this device',
          type: SettingsItemType.toggle,
          toggleValue: biometricEnabled.valueOrNull ?? false,
          onToggleChanged: available
              ? (value) async {
                  if (value) {
                    // Verify biometrics work before enabling
                    final biometricService = ref.read(biometricServiceProvider);
                    final result = await biometricService.authenticate(
                      localizedReason:
                          'Verify your identity to enable biometric unlock',
                    );
                    if (result == BiometricAuthResult.success) {
                      ref
                          .read(biometricEnabledProvider.notifier)
                          .setEnabled(true);
                    } else {
                      // Show error message
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Biometric verification failed',
                            ),
                            backgroundColor: isDark
                                ? DarkAppColors.error500
                                : AppColors.error500,
                          ),
                        );
                      }
                    }
                  } else {
                    ref
                        .read(biometricEnabledProvider.notifier)
                        .setEnabled(false);
                  }
                }
              : (_) {}, // No-op when not available
        );
      },
      loading: () => SettingsListItem(
        icon: Icons.fingerprint,
        title: 'Biometric Auth',
        subtitle: 'Checking availability...',
        type: SettingsItemType.toggle,
        toggleValue: false,
        onToggleChanged: (_) {}, // No-op while loading
      ),
      error: (e, _) => SettingsListItem(
        icon: Icons.fingerprint,
        title: 'Biometric Auth',
        subtitle: 'Error checking availability',
        type: SettingsItemType.toggle,
        toggleValue: false,
        onToggleChanged: (_) {}, // No-op on error
      ),
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  Future<void> _showThemeSelectionDialog() async {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final currentTheme = ref.read(themeNotifierProvider);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark
            ? DarkAppColors.backgroundPrimary
            : AppColors.backgroundPrimary,
        title: Text(
          'Choose Theme',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildThemeOption(
              context,
              theme,
              isDark,
              'Light',
              ThemeMode.light,
              currentTheme == ThemeMode.light,
            ),
            const SizedBox(height: 8),
            _buildThemeOption(
              context,
              theme,
              isDark,
              'Dark',
              ThemeMode.dark,
              currentTheme == ThemeMode.dark,
            ),
            const SizedBox(height: 8),
            _buildThemeOption(
              context,
              theme,
              isDark,
              'System',
              ThemeMode.system,
              currentTheme == ThemeMode.system,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    String label,
    ThemeMode mode,
    bool isSelected,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await ref.read(themeNotifierProvider.notifier).setThemeMode(mode);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark
                      ? DarkAppColors.surfaceElevated2
                      : AppColors.primary50)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? theme.colorScheme.primary
                  : (isDark ? DarkAppColors.neutral700 : AppColors.neutral200),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : (isDark
                              ? DarkAppColors.textPrimary
                              : AppColors.textPrimary),
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
