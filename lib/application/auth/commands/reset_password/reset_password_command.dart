/// Command to reset password with token
class ResetPasswordCommand {
  final String token;
  final String newPassword;
  final String ipAddress;
  final String userAgent;

  const ResetPasswordCommand({
    required this.token,
    required this.newPassword,
    required this.ipAddress,
    required this.userAgent,
  });
}
