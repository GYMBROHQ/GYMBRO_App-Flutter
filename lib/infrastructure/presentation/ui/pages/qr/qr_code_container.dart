import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../application/access/state/qr_code_notifier.dart';
import 'qr_code_generation_page.dart';

/// Container page that connects QR generation to state management
class QRCodeContainer extends ConsumerStatefulWidget {
  final String subscriptionId;
  final String gymId;
  final String gymName;
  final String gymLocation;
  final String? gymImageUrl;

  const QRCodeContainer({
    super.key,
    required this.subscriptionId,
    required this.gymId,
    required this.gymName,
    required this.gymLocation,
    this.gymImageUrl,
  });

  @override
  ConsumerState<QRCodeContainer> createState() => _QRCodeContainerState();
}

class _QRCodeContainerState extends ConsumerState<QRCodeContainer> {
  @override
  void initState() {
    super.initState();
    // Generate QR code when page loads
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

    return switch (qrState) {
      QRCodeInitial() => _buildLoadingView(),
      QRCodeLoading() => _buildLoadingView(),
      QRCodeGenerated(:final qrCode, :final secondsRemaining) =>
        QRCodeGenerationPage(
          gymName: widget.gymName,
          gymLocation: widget.gymLocation,
          gymImageUrl: widget.gymImageUrl,
          userName: 'User', // TODO: Get from auth state
          userInitials: 'U', // TODO: Get from auth state
          validityText: 'Valid for ${secondsRemaining}s',
          qrData: qrCode.code,
          initialDuration: Duration(seconds: secondsRemaining),
          onGenerateNew: _generateQRCode,
          onClose: () => context.pop(),
        ),
      QRCodeExpired() => QRCodeGenerationPage(
          gymName: widget.gymName,
          gymLocation: widget.gymLocation,
          gymImageUrl: widget.gymImageUrl,
          userName: 'User',
          userInitials: 'U',
          validityText: 'Expired',
          qrData: '', // Empty QR data for expired state
          initialDuration: const Duration(seconds: 0),
          onGenerateNew: _generateQRCode,
          onClose: () => context.pop(),
        ),
      QRCodeError(:final message) => _buildErrorView(message),
    };
  }

  Widget _buildLoadingView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generating QR Code'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorView(String message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Error'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to Generate QR Code',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _generateQRCode,
                child: const Text('Try Again'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
