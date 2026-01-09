import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../config/theme/theme.dart';

/// QR Code display atom with animated scanning line
class QRCodeDisplay extends StatefulWidget {
  final String data;
  final double size;
  final bool showScanningAnimation;

  const QRCodeDisplay({
    super.key,
    required this.data,
    this.size = 280,
    this.showScanningAnimation = true,
  });

  @override
  State<QRCodeDisplay> createState() => _QRCodeDisplayState();
}

class _QRCodeDisplayState extends State<QRCodeDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.05, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.25),
            blurRadius: 50,
            spreadRadius: -10,
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.spacing5),
      child: Stack(
        children: [
          // QR Code
          QrImageView(
            data: widget.data,
            version: QrVersions.auto,
            size: widget.size - 40,
            backgroundColor: Colors.white,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Colors.black,
            ),
          ),

          // Scanning animation line
          if (widget.showScanningAnimation)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: 0,
                  right: 0,
                  top: _animation.value * (widget.size - 40),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primary500,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.8),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          // Corner markers
          _buildCornerMarker(Alignment.topLeft),
          _buildCornerMarker(Alignment.topRight),
          _buildCornerMarker(Alignment.bottomLeft),
          _buildCornerMarker(Alignment.bottomRight),
        ],
      ),
    );
  }

  Widget _buildCornerMarker(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          border: Border(
            top: alignment == Alignment.topLeft || alignment == Alignment.topRight
                ? const BorderSide(color: Colors.black26, width: 4)
                : BorderSide.none,
            bottom: alignment == Alignment.bottomLeft ||
                    alignment == Alignment.bottomRight
                ? const BorderSide(color: Colors.black26, width: 4)
                : BorderSide.none,
            left: alignment == Alignment.topLeft ||
                    alignment == Alignment.bottomLeft
                ? const BorderSide(color: Colors.black26, width: 4)
                : BorderSide.none,
            right: alignment == Alignment.topRight ||
                    alignment == Alignment.bottomRight
                ? const BorderSide(color: Colors.black26, width: 4)
                : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: alignment == Alignment.topLeft
                ? Radius.circular(AppRadius.sm)
                : Radius.zero,
            topRight: alignment == Alignment.topRight
                ? Radius.circular(AppRadius.sm)
                : Radius.zero,
            bottomLeft: alignment == Alignment.bottomLeft
                ? Radius.circular(AppRadius.sm)
                : Radius.zero,
            bottomRight: alignment == Alignment.bottomRight
                ? Radius.circular(AppRadius.sm)
                : Radius.zero,
          ),
        ),
      ),
    );
  }
}
