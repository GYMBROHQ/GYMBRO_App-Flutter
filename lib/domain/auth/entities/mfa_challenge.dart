/// MFA challenge returned when login requires two-factor authentication
class MfaChallenge {
  final String mfaToken;
  final String userId;
  final DateTime expiresAt;

  const MfaChallenge({
    required this.mfaToken,
    required this.userId,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  @override
  String toString() => 'MfaChallenge(userId: $userId, expires: $expiresAt)';
}
