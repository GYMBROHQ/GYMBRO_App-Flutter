import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme/theme.dart';

/// Onboarding modal with three-step carousel
class OnboardingModal extends StatefulWidget {
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;

  const OnboardingModal({
    super.key,
    this.onComplete,
    this.onSkip,
  });

  @override
  State<OnboardingModal> createState() => _OnboardingModalState();
}

class _OnboardingModalState extends State<OnboardingModal> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingStepData> _steps = [
    OnboardingStepData(
      title: 'Discover Gyms Nearby',
      description:
          'Browse hundreds of gyms in your area. Filter by price, amenities, and equipment.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAvvP4AQkh8_Frem6HTJoZf8jDF1mh7-DsaQaD22rDeFK4CXSIZDyhr29tYVg4h3RNP7iWZtSl8s-t39D7fIJLW7NAc8OtJ4QncUuCfeUM2KgUuzkmDjZkefpuamPxQTlmf1HtuJ_N-gF7fjbsv8K5cCPO5zGFnDcfTxFHvAEBk81liI-IAoUGKHRh9xktXw19lUKrIByKqTxfxWabUZgoLVLgQX8E9IQmpPhEUIca3aYlNF81W6EZBojV7ncaLeC-LOhzepybNF4I',
    ),
    OnboardingStepData(
      title: 'One App, Multiple Gyms',
      description:
          'Subscribe to any gym and access it instantly. Switch between gyms as you travel or your routine changes.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD42jRGnUn7avkAqJmar2yuIuPCdNifxjZwr1FTsSbLIAN6IUeHwtojGXHfX4ss2IjTUpjWkcrvPLdpjncDMFD3aU-ZJswOqUy4NagwL-epSnshl72zT9uAnHWfukcCg028vb5yI-thqkYeqjg093ucaBDQgIdi1lWbuuMQkvzJnMeOA7BOYJvHqwYNe07lNlTCF221_LRG21JCSkiAGwkEjbXVmLhah3iq8LLr6eUetp_lRIR-9XvfEnLj9VQkBTPfJTQNto89jTU',
    ),
    OnboardingStepData(
      title: 'Seamless Check-In',
      description:
          'Generate a secure QR code and show it at the gym entrance. It\'s that simple! No cards, no hassle.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA_HipROcxBN9QkOQWPYLQTPLdBf3fA_l7uI20VAkXgaXFPrcASt5THWkilQ2dAiudcdF9v681QE4IJwK1K3wvtGCo-ZYu7gMQr2VH1u3SWht1U4SdMRgkXQuOshzHCeZAGyAK6RE2WhH7ALBF6W3apdu61iNM52vxlYivu8HrnEAGeG9eUSkF03mNmuTwrvbWdBSdCgDHLls4W4aGIPqO8FfAf2Zm0ZyCWb032tZ3JRkUeBG0TAlciVojPIdmMasFIRxLDJ5wBmtc',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _complete();
    }
  }

  void _complete() {
    context.pop();
    widget.onComplete?.call();
  }

  void _skip() {
    context.pop();
    widget.onSkip?.call();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 680),
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.surfaceElevated1 : Colors.white,
          borderRadius: AppBorderRadius.modal,
        ),
        child: Column(
          children: [
            // Header with skip button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: Text(
                      'Skip',
                      style: AppTypography.labelLg.copyWith(
                        color: isDark
                            ? DarkAppColors.textMuted
                            : AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  return _OnboardingStep(
                    data: _steps[index],
                    isDark: isDark,
                  );
                },
              ),
            ),

            // Footer with pagination and button
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Pagination dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _steps.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == _currentPage ? 24 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? AppColors.primary500
                              : (isDark
                                  ? DarkAppColors.neutral300
                                  : AppColors.neutral300),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        _currentPage == _steps.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: AppTypography.button,
                      ),
                    ),
                  ),

                  // Footer link for last step
                  if (_currentPage == _steps.length - 1) ...[
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                        // Navigate to sign in if needed
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: AppTypography.labelMd.copyWith(
                            color: isDark
                                ? DarkAppColors.textMuted
                                : AppColors.textMuted,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: AppTypography.labelMd.copyWith(
                                color: AppColors.primary500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingStep extends StatelessWidget {
  final OnboardingStepData data;
  final bool isDark;

  const _OnboardingStep({
    required this.data,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.xl,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Text content
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  data.title,
                  style: AppTypography.displaySm.copyWith(
                    color: isDark
                        ? DarkAppColors.textPrimary
                        : AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  data.description,
                  style: AppTypography.bodyMd.copyWith(
                    color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingStepData {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingStepData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
