import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../application/access/state/qr_code_notifier.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';
import '../../config/theme/theme.dart';

/// Bottom sheet for displaying QR code for gym access
class QRCodeBottomSheet extends ConsumerStatefulWidget {
  final String subscriptionId;
  final String gymId;
  final String gymName;
  final String gymLocation;
  final String? gymImageUrl;
  final String userName;
  final String userInitials;

  const QRCodeBottomSheet({
    super.key,
    required this.subscriptionId,
    required this.gymId,
    required this.gymName,
    required this.gymLocation,
    required this.userName,
    required this.userInitials,
    this.gymImageUrl,
  });

  @override
  ConsumerState<QRCodeBottomSheet> createState() => _QRCodeBottomSheetState();
}

class _QRCodeBottomSheetState extends ConsumerState<QRCodeBottomSheet> {
  @override
  void initState() {
    super.initState();
    // Generate QR code when bottom sheet opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateQRCode();
    });
  }

  Future<void> _generateQRCode() async {
    final deviceFingerprint = await _getDeviceFingerprint();

    ref.read(qRCodeGeneratorProvider.notifier).generateQRCode(
      subscriptionId: widget.subscriptionId,
      gymId: widget.gymId,
      deviceFingerprint: deviceFingerprint,
    );
  }

  Future<String> _getDeviceFingerprint() async {
    // Simple timestamp-based fingerprint
    // In production, you'd want to use a proper device identification method
    return 'device-${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Widget build(BuildContext context) {
    final qrState = ref.watch(qRCodeGeneratorProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.surfaceElevated1
            : DarkAppColors.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Access QR Code',
                    style: AppTypography.h4.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Close Button
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: DarkAppColors.surfaceElevated2,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: isDark
                            ? DarkAppColors.textPrimary
                            : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildContent(qrState, isDark),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(QRCodeState qrState, bool isDark) {
    return switch (qrState) {
      QRCodeInitial() || QRCodeLoading() => _buildLoadingView(isDark),
      QRCodeGenerated(:final qrCode, :final secondsRemaining) =>
        _buildActiveQRView(qrCode.code, secondsRemaining, isDark),
      QRCodeExpired() => _buildExpiredView(isDark),
      QRCodeError(:final message) => _buildErrorView(message, isDark),
    };
  }

  Widget _buildLoadingView(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Generating QR Code...',
            style: AppTypography.bodyMd.copyWith(
              color: isDark
                  ? DarkAppColors.textMuted
                  : AppColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveQRView(String qrData, int secondsRemaining, bool isDark) {
    return Column(
      children: [
        const SizedBox(height: 8),

        // Live Indicator
        const Align(
          alignment: Alignment.centerRight,
          child: LiveIndicator(),
        ),
        const SizedBox(height: 16),

        // Gym Info Header
        GymInfoHeader(
          gymName: widget.gymName,
          location: widget.gymLocation,
        ),
        const SizedBox(height: 24),

        // QR Code Display
        QRCodeDisplay(
          data: qrData,
          size: MediaQuery.of(context).size.width * 0.6,
        ),
        const SizedBox(height: 24),

        // Countdown Timer
        CountdownTimer(
          remainingTime: Duration(seconds: secondsRemaining),
        ),
        const SizedBox(height: 24),

        // User Card
        QRUserCard(
          userName: widget.userName,
          userInitials: widget.userInitials,
          validityText: 'Valid for $secondsRemaining seconds',
        ),
        const SizedBox(height: 24),

        // Helper text
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
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildExpiredView(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          // Expired icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.error500.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.timer_off_rounded,
              size: 40,
              color: AppColors.error500,
            ),
          ),
          const SizedBox(height: 24),

          // Message
          Text(
            'QR Code Expired',
            style: AppTypography.h3.copyWith(
              color: isDark
                  ? DarkAppColors.textPrimary
                  : Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'For your security, this code timed out. Please generate a new one to access the facility.',
            style: AppTypography.bodySm.copyWith(
              color: DarkAppColors.textMuted,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Regenerate Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _generateQRCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                ),
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
        ],
      ),
    );
  }

  Widget _buildErrorView(String message, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          // Error icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.error500.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: 40,
              color: AppColors.error500,
            ),
          ),
          const SizedBox(height: 24),

          // Message
          Text(
            'Failed to Generate QR Code',
            style: AppTypography.h3.copyWith(
              color: isDark
                  ? DarkAppColors.textPrimary
                  : Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: AppTypography.bodySm.copyWith(
              color: DarkAppColors.textMuted,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Try Again Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _generateQRCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                ),
              ),
              child: Text(
                'Try Again',
                style: AppTypography.button.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
