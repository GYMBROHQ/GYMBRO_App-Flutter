import '../entities/user.dart';
import '../value_objects/email.dart';

/// Factory for creating User entities
class UserFactory {
  /// Creates a User entity from raw data (typically from API response)
  static User create({
    required String id,
    required String email,
    required bool emailVerified,
    required bool isMfaEnabled,
    String? fullName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id,
      email: Email.fromTrusted(email),
      emailVerified: emailVerified,
      isMfaEnabled: isMfaEnabled,
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
