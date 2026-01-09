/// Command to request password reset
class RequestPasswordResetCommand {
  final String email;
  final String ipAddress;
  final String userAgent;

  const RequestPasswordResetCommand({
    required this.email,
    required this.ipAddress,
    required this.userAgent,
  });
}
