import '../value_objects/email.dart';

/// User entity representing an authenticated user
class User {
  final String id;
  final Email email;
  final bool emailVerified;
  final bool isMfaEnabled;
  final String? fullName;
  final DateTime? dateOfBirth;
  final String? phoneNumber;
  final String? avatarUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.email,
    required this.emailVerified,
    required this.isMfaEnabled,
    this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? id,
    Email? email,
    bool? emailVerified,
    bool? isMfaEnabled,
    String? fullName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      isMfaEnabled: isMfaEnabled ?? this.isMfaEnabled,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User(id: $id, email: ${email.value})';
}
