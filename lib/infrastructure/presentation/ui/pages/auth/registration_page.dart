import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import '../../organisms/organisms.dart';
import '../../templates/templates.dart';
import '../../../../providers/providers.dart';

/// Registration page - create new account screen
class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();
  DateTime? _selectedDateOfBirth;
  bool _termsAccepted = false;
  PasswordStrength _passwordStrength = PasswordStrength.weak;
  List<PasswordRequirement> _requirements = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _updatePasswordRequirements('');
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    _updatePasswordRequirements(_passwordController.text);
  }

  void _updatePasswordRequirements(String password) {
    final hasMinLength = password.length >= 8;
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));

    int score = 0;
    if (hasMinLength) score++;
    if (hasSpecialChar) score++;
    if (hasUppercase) score++;
    if (hasNumber) score++;
    if (password.length >= 12) score++;

    PasswordStrength strength;
    if (score <= 1) {
      strength = PasswordStrength.weak;
    } else if (score == 2) {
      strength = PasswordStrength.fair;
    } else if (score == 3) {
      strength = PasswordStrength.medium;
    } else if (score == 4) {
      strength = PasswordStrength.good;
    } else {
      strength = PasswordStrength.strong;
    }

    setState(() {
      _passwordStrength = strength;
      _requirements = [
        PasswordRequirement(label: '8+ characters', isMet: hasMinLength),
        PasswordRequirement(label: 'Special character', isMet: hasSpecialChar),
        PasswordRequirement(label: 'Uppercase letter', isMet: hasUppercase),
      ];
    });
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDateOfBirth == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your date of birth'),
        ),
      );
      return;
    }

    if (!_isOldEnough(_selectedDateOfBirth!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must be at least 16 years old to register'),
        ),
      );
      return;
    }

    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the Terms of Service and Privacy Policy'),
        ),
      );
      return;
    }

    setState(() => _errorMessage = null);

    await ref.read(authNotifierProvider.notifier).register(
          fullName: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          dateOfBirth: _selectedDateOfBirth!,
        );
  }

  void _handleLogin() {
    context.pop();
  }

  void _handleGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _handleAppleSignIn() {
    // TODO: Implement Apple sign in
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _selectedDateOfBirth = date;
        _dobController.text =
            '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
      });
    }
  }

  bool _isOldEnough(DateTime dateOfBirth) {
    final today = DateTime.now();
    final minBirthDate = DateTime(today.year - 16, today.month, today.day);
    return dateOfBirth.isBefore(minBirthDate) || dateOfBirth.isAtSameMomentAs(minBirthDate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AuthLoading;

    // Listen for state changes
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        context.go('/home');
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const PageHeader(
              title: 'Create Account',
              subtitle: 'Start your fitness journey today.',
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Full Name field
            AppTextField(
              label: 'Full Name',
              hint: 'Enter your full name',
              controller: _fullNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.spacing5),
            // Email field
            AppTextField(
              label: 'Email Address',
              hint: 'Enter your email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              hint: 'Create a password',
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.spacing3),
            // Password strength indicator
            PasswordStrengthBar(strength: _passwordStrength),
            const SizedBox(height: AppSpacing.spacing2),
            // Password requirements
            Wrap(
              spacing: AppSpacing.spacing4,
              runSpacing: AppSpacing.spacing2,
              children: _requirements.map((req) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (req.isMet)
                      Icon(
                        Icons.check,
                        size: 14,
                        color: AppColors.success500,
                      )
                    else
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.textMuted,
                          ),
                        ),
                      ),
                    const SizedBox(width: 4),
                    Text(
                      req.label,
                      style: AppTypography.labelXs.copyWith(
                        color: req.isMet
                            ? AppColors.success500
                            : (isDark
                                ? DarkAppColors.textMuted
                                : AppColors.textMuted),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.spacing5),
            // Date of Birth field
            GestureDetector(
              onTap: _selectDate,
              child: AbsorbPointer(
                child: AppTextField(
                  label: 'Date of Birth',
                  hint: 'mm/dd/yyyy',
                  controller: _dobController,
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.spacing5),
            // Terms checkbox
            CheckboxField(
              value: _termsAccepted,
              onChanged: (value) => setState(() => _termsAccepted = value ?? false),
              label: AppRichTextWithLinks(
                text: 'I agree to the Terms of Service and Privacy Policy.',
                textAlign: TextAlign.start,
                links: {
                  'Terms of Service': () {
                    // TODO: Open terms
                  },
                  'Privacy Policy': () {
                    // TODO: Open privacy policy
                  },
                },
              ),
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Error message
            if (_errorMessage != null) ...[
              AlertBanner.error(
                title: _errorMessage!,
              ),
              const SizedBox(height: AppSpacing.spacing4),
            ],
            // Create account button
            AppPrimaryButton(
              text: 'Create Account',
              onPressed: isLoading ? null : _handleRegister,
              isLoading: isLoading,
            ),
            // Social login section
            SocialLoginSection(
              onGoogleTap: isLoading ? null : _handleGoogleSignIn,
              onAppleTap: isLoading ? null : _handleAppleSignIn,
            ),
            const SizedBox(height: AppSpacing.spacing6),
            // Login link
            AuthFooterLink(
              text: 'Already have an account?',
              linkText: 'Log In',
              onLinkTap: _handleLogin,
            ),
            const SizedBox(height: AppSpacing.spacing4),
          ],
        ),
      ),
    );
  }
}
