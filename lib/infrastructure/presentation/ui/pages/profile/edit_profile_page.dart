import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../../../providers/auth_providers.dart';
import '../../../../providers/auth_state.dart';

/// Edit profile page for updating user information
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  String _countryCode = '+1';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final authState = ref.read(authNotifierProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    // Parse fullName into first/last
    final nameParts = (user?.fullName ?? '').split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts.first : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    _firstNameController = TextEditingController(text: firstName);
    _lastNameController = TextEditingController(text: lastName);
    _phoneController = TextEditingController(text: user?.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Colors from edit_profile_screen design
    final backgroundColor = isDark
        ? DarkAppColors.backgroundPrimary
        : AppColors.backgroundSecondary;

    final inputBackground = isDark
        ? DarkAppColors.surfaceElevated1
        : Colors.white;

    final borderColor = isDark
        ? DarkAppColors.borderDefault
        : AppColors.neutral300;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withValues(alpha: 0.95),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveProfile,
            child: _isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    'Save',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Photo Section
            _buildProfilePhotoSection(context, theme, isDark, backgroundColor),
            const SizedBox(height: 32),

            // Personal Information Section
            _buildSectionHeader('PERSONAL INFORMATION', isDark),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'First Name',
              controller: _firstNameController,
              isDark: isDark,
              inputBackground: inputBackground,
              borderColor: borderColor,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Last Name',
              controller: _lastNameController,
              isDark: isDark,
              inputBackground: inputBackground,
              borderColor: borderColor,
            ),
            const SizedBox(height: 16),
            _buildPhoneField(isDark, inputBackground, borderColor),
            const SizedBox(height: 32),

            // Account Settings Section
            _buildSectionHeader('ACCOUNT SETTINGS', isDark),
            const SizedBox(height: 20),
            _buildEmailField(isDark, inputBackground, borderColor),
            const SizedBox(height: 20),
            _buildChangePasswordButton(isDark, inputBackground, borderColor),
            const SizedBox(height: 32),

            // Delete Account Section
            Container(
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? DarkAppColors.surfaceElevated2
                        : AppColors.neutral200,
                  ),
                ),
              ),
              child: _buildDeleteAccountButton(isDark),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSection(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    Color backgroundColor,
  ) {
    return Column(
      children: [
        // Avatar with camera button
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? DarkAppColors.surfaceElevated2
                      : Colors.white,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDF-U0nJ4shfliXAFsYX97pktOwwIz06aF-ylMAGpn3q5wsN0EP0aswqGbYc0l4dY7tcWNq7Yb9AB0xnwiYdFDfY7-JhvUzHcXvnjzUO4E83L4fucyAuqplMgDWxupw2TGmXXtYCAi-IovTLVa0zwBiur6TOw7abLs4x3K0fjyTXLaygjJa9qEgpLvqzap1Y2f__UR0_nkNr5o-CB_BvFsUaahBVgSHHbT2Yfio2Ow4fjy4mn3cil2hJpmUP4UBvKxUXkqik3Vi_2I',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: DarkAppColors.surfaceElevated2,
                      child: const Icon(
                        Icons.person,
                        size: 48,
                        color: Colors.white54,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: backgroundColor,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.photo_camera,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // TODO: Open photo picker
          },
          child: Text(
            'Change Photo',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark
              ? DarkAppColors.textMuted // slate-400
              : AppColors.neutral600, // slate-500
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool isDark,
    required Color inputBackground,
    required Color borderColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.neutral300
                  : AppColors.neutral800,
            ),
          ),
        ),
        TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.white : AppColors.neutral900,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: inputBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.primary500,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.cancel, size: 20),
              color: DarkAppColors.textMuted,
              onPressed: () => controller.clear(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField(bool isDark, Color inputBackground, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.neutral300
                  : AppColors.neutral800,
            ),
          ),
        ),
        Row(
          children: [
            // Country code dropdown
            Container(
              width: 88,
              height: 52,
              decoration: BoxDecoration(
                color: inputBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _countryCode,
                  icon: const Icon(Icons.expand_more, size: 18),
                  iconEnabledColor: AppColors.neutral600,
                  dropdownColor: inputBackground,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  borderRadius: BorderRadius.circular(8),
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white : AppColors.neutral900,
                  ),
                  items: const [
                    DropdownMenuItem(value: '+1', child: Text('+1')),
                    DropdownMenuItem(value: '+44', child: Text('+44')),
                    DropdownMenuItem(value: '+91', child: Text('+91')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _countryCode = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Phone number field
            Expanded(
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white : AppColors.neutral900,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: inputBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.primary500,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel, size: 20),
                    color: DarkAppColors.textMuted,
                    onPressed: () => _phoneController.clear(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailField(bool isDark, Color inputBackground, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Email Address',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.neutral300
                  : AppColors.neutral800,
            ),
          ),
        ),
        TextField(
          enabled: false,
          style: TextStyle(
            fontSize: 16,
            color: isDark
                ? DarkAppColors.textMuted // slate-400
                : AppColors.neutral600, // slate-500
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? DarkAppColors.surfaceElevated1.withValues(alpha: 0.6)
                : AppColors.neutral100, // slate-100
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark
                    ? DarkAppColors.borderDefault
                    : AppColors.neutral200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark
                    ? DarkAppColors.borderDefault
                    : AppColors.neutral200,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark
                    ? DarkAppColors.borderDefault
                    : AppColors.neutral200,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    size: 20,
                    color: AppColors.warning500, // amber-500
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.lock,
                    size: 20,
                    color: DarkAppColors.textMuted,
                  ),
                ],
              ),
            ),
          ),
          controller: TextEditingController(text: 'alex@email.com'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 8),
          child: Row(
            children: [
              const Icon(
                Icons.info,
                size: 14,
                color: AppColors.warning600, // amber-600
              ),
              const SizedBox(width: 6),
              Text(
                'Please verify your email address',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.warning500
                      : AppColors.warning600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton(
    bool isDark,
    Color inputBackground,
    Color borderColor,
  ) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to change password page
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: inputBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : AppColors.neutral900,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isDark
                  ? DarkAppColors.textMuted
                  : AppColors.neutral600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton(bool isDark) {
    return OutlinedButton(
      onPressed: () {
        // TODO: Show delete account confirmation dialog
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark
            ? AppColors.error500 // red-500
            : AppColors.error600, // red-600
        backgroundColor: isDark
            ? AppColors.error500.withValues(alpha: 0.1)
            : AppColors.error50, // red-50
        side: BorderSide(
          color: isDark
              ? AppColors.error500.withValues(alpha: 0.2)
              : AppColors.error100, // red-200
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Delete Account',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDark
              ? AppColors.error500 // red-500
              : AppColors.error600, // red-600
        ),
      ),
    );
  }

  Future<void> _saveProfile() async {
    setState(() => _isLoading = true);

    final fullName =
        '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}'
            .trim();
    final phoneNumber =
        _phoneController.text.isNotEmpty ? _phoneController.text : null;

    final success = await ref.read(authNotifierProvider.notifier).updateProfile(
          fullName: fullName.isNotEmpty ? fullName : null,
          phoneNumber: phoneNumber,
        );

    setState(() => _isLoading = false);

    if (success && mounted) {
      context.pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update profile')),
      );
    }
  }
}
