/// Command to logout a user
class LogoutCommand {
  final String sessionId;
  final bool allDevices;

  const LogoutCommand({
    required this.sessionId,
    this.allDevices = false,
  });
}
