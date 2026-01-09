/// Command to verify MFA code during login
class VerifyMfaCommand {
  final String mfaToken;
  final String code;
  final String ipAddress;
  final String userAgent;
  final String? deviceId;

  const VerifyMfaCommand({
    required this.mfaToken,
    required this.code,
    required this.ipAddress,
    required this.userAgent,
    this.deviceId,
  });
}
