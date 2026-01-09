/// Command to disable MFA
class DisableMfaCommand {
  final String password;
  final String ipAddress;
  final String userAgent;

  const DisableMfaCommand({
    required this.password,
    required this.ipAddress,
    required this.userAgent,
  });
}
