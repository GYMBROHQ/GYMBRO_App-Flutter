/// Command to login a user
class LoginCommand {
  final String email;
  final String password;
  final String ipAddress;
  final String userAgent;
  final String? deviceId;

  const LoginCommand({
    required this.email,
    required this.password,
    required this.ipAddress,
    required this.userAgent,
    this.deviceId,
  });
}
