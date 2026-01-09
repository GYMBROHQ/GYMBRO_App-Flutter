/// MFA setup data returned when initiating TOTP setup
class MfaSetup {
  final String secret;
  final String qrCodeUri;
  final String mfaToken;

  const MfaSetup({
    required this.secret,
    required this.qrCodeUri,
    required this.mfaToken,
  });

  @override
  String toString() => 'MfaSetup(secret: [REDACTED], qrCodeUri: $qrCodeUri)';
}

/// Backup codes returned after completing MFA setup
class MfaBackupCodes {
  final List<String> codes;

  const MfaBackupCodes({required this.codes});

  int get remainingCodes => codes.length;

  @override
  String toString() => 'MfaBackupCodes(count: ${codes.length})';
}
