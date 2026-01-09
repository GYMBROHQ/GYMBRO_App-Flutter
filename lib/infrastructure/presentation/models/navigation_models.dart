/// Navigation data models for passing complex objects through GoRouter
///
/// These models are used with `state.extra` for routes that need to pass
/// complex data that shouldn't be serialized in URLs.

/// Data model for payment success page
class PaymentSuccessData {
  final String gymName;
  final String planName;
  final double amount;
  final String? gymImageUrl;
  final String? userEmail;
  final String? startDate;
  final String? expiryDate;
  final bool isPending;

  const PaymentSuccessData({
    required this.gymName,
    required this.planName,
    required this.amount,
    this.gymImageUrl,
    this.userEmail,
    this.startDate,
    this.expiryDate,
    this.isPending = false,
  });
}

/// Data model for QR code generation page
class QRGenerationData {
  final String gymName;
  final String gymLocation;
  final String? gymImageUrl;
  final String userName;
  final String userInitials;
  final String validityText;
  final String qrData;

  const QRGenerationData({
    required this.gymName,
    required this.gymLocation,
    this.gymImageUrl,
    required this.userName,
    required this.userInitials,
    required this.validityText,
    required this.qrData,
  });
}
