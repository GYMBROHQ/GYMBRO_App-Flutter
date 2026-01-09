/// Command to initiate MFA setup
class InitiateMfaSetupCommand {
  const InitiateMfaSetupCommand();
}

/// Command to complete MFA setup with TOTP verification
class CompleteMfaSetupCommand {
  final String mfaToken;
  final String totpCode;
  final String ipAddress;
  final String userAgent;

  const CompleteMfaSetupCommand({
    required this.mfaToken,
    required this.totpCode,
    required this.ipAddress,
    required this.userAgent,
  });
}
