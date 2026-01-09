/// Command to register a new user
class RegisterCommand {
  final String fullName;
  final String email;
  final String password;
  final DateTime dateOfBirth;
  final DateTime termsAcceptedAt;
  final String ipAddress;
  final String userAgent;

  const RegisterCommand({
    required this.fullName,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.termsAcceptedAt,
    required this.ipAddress,
    required this.userAgent,
  });
}
