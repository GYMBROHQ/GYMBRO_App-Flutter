import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

/// QR Code Generation Page - Shows active QR code that expires after a duration
class QRCodeGenerationPage extends StatefulWidget {
  final String gymName;
  final String gymLocation;
  final String? gymImageUrl;
  final String userName;
  final String userInitials;
  final String validityText;
  final String qrData;
  final Duration initialDuration;
  final VoidCallback? onGenerateNew;
  final VoidCallback? onClose;
  final VoidCallback? onMaximizeBrightness;
  final VoidCallback? onViewGym;
  final VoidCallback? onLearnMore;

  const QRCodeGenerationPage({
    super.key,
    required this.gymName,
    required this.gymLocation,
    required this.userName,
    required this.userInitials,
    required this.validityText,
    required this.qrData,
    this.gymImageUrl,
    this.initialDuration = const Duration(seconds: 15),
    this.onGenerateNew,
    this.onClose,
    this.onMaximizeBrightness,
    this.onViewGym,
    this.onLearnMore,
  });

  @override
  State<QRCodeGenerationPage> createState() => _QRCodeGenerationPageState();
}

class _QRCodeGenerationPageState extends State<QRCodeGenerationPage> {
  late Duration _remainingTime;
  Timer? _timer;
  bool _isExpired = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
        } else {
          _timer?.cancel();
          _isExpired = true;
        }
      });
    });
  }

  void _regenerateCode() {
    setState(() {
      _isExpired = false;
      _remainingTime = widget.initialDuration;
    });
    _timer?.cancel();
    _startTimer();
    widget.onGenerateNew?.call();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: DarkAppColors.backgroundPrimary,
      body: SafeArea(
        child: _isExpired ? _buildExpiredView(isDark) : _buildActiveView(isDark),
      ),
    );
  }

  // Active QR Code View
  Widget _buildActiveView(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : DarkAppColors.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Close Button
                GestureDetector(
                  onTap: widget.onClose ?? () => context.pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: DarkAppColors.surfaceElevated2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : Colors.white,
                    ),
                  ),
                ),
                // Live Indicator
                const LiveIndicator(),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  // Gym Info Header
                  GymInfoHeader(
                    gymName: widget.gymName,
                    location: widget.gymLocation,
                  ),
                  const SizedBox(height: 32),

                  // QR Code Display
                  QRCodeDisplay(
                    data: widget.qrData,
                    size: MediaQuery.of(context).size.width * 0.7,
                  ),
                  const SizedBox(height: 32),

                  // Countdown Timer
                  CountdownTimer(remainingTime: _remainingTime),
                  const SizedBox(height: 32),

                  // User Card
                  QRUserCard(
                    userName: widget.userName,
                    userInitials: widget.userInitials,
                    validityText: widget.validityText,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            decoration: BoxDecoration(
              color: isDark
                  ? DarkAppColors.surfaceElevated1
                  : DarkAppColors.backgroundPrimary,
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Show this code to gym staff',
                  style: AppTypography.bodySm.copyWith(
                    color: isDark
                        ? DarkAppColors.textMuted
                        : AppColors.neutral500,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: widget.onMaximizeBrightness,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DarkAppColors.surfaceElevated2,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.xl),
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.brightness_high, size: 22),
                        const SizedBox(width: 10),
                        Text(
                          'Maximize Brightness',
                          style: AppTypography.button.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Expired QR Code View
  Widget _buildExpiredView(bool isDark) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              GestureDetector(
                onTap: widget.onClose ?? () => context.pop(),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : Colors.white.withValues(alpha: 0.9),
                      size: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'QR Code',
                      style: AppTypography.bodyMd.copyWith(
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Menu Button
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: isDark
                      ? DarkAppColors.textPrimary
                      : Colors.white.withValues(alpha: 0.9),
                  size: 28,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // Expired QR Code Display
                ExpiredQRCodeDisplay(
                  data: widget.qrData,
                  size: 280,
                ),
                const SizedBox(height: 32),

                // Status Message
                Column(
                  children: [
                    Text(
                      'QR Code Expired',
                      style: AppTypography.h2.copyWith(
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'For your security, this code timed out after ${widget.initialDuration.inSeconds} seconds. Please generate a new one to access the facility.',
                      style: AppTypography.bodySm.copyWith(
                        color: DarkAppColors.textMuted,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Generate New Code Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _regenerateCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.xl),
                      ),
                      shadowColor: AppColors.primary500.withValues(alpha: 0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.refresh, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          'Generate New Code',
                          style: AppTypography.button.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Learn More Link
                TextButton(
                  onPressed: widget.onLearnMore,
                  child: Text(
                    'Why do QR codes expire?',
                    style: AppTypography.bodyXs.copyWith(
                      color: DarkAppColors.textMuted,
                      decoration: TextDecoration.underline,
                      decorationColor: DarkAppColors.textMuted.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Gym Subscription Card
                GymSubscriptionCard(
                  gymName: widget.gymName,
                  gymImageUrl: widget.gymImageUrl,
                  statusLabel: 'Active Member',
                  isActive: true,
                  onViewTap: widget.onViewGym,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
