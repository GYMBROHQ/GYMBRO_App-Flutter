/// Command to refresh auth tokens
class RefreshSessionCommand {
  final String refreshToken;
  final String ipAddress;
  final String userAgent;

  const RefreshSessionCommand({
    required this.refreshToken,
    required this.ipAddress,
    required this.userAgent,
  });
}
