import '../exceptions/domain_exceptions.dart';

/// Email value object with validation
class Email {
  final String value;

  const Email._(this.value);

  /// Creates an Email value object with validation
  /// Throws [InvalidEmailException] if the email is invalid
  factory Email.create(String email) {
    final trimmed = email.trim().toLowerCase();
    if (!_isValidEmail(trimmed)) {
      throw InvalidEmailException(email);
    }
    return Email._(trimmed);
  }

  /// Creates an Email without validation (use for trusted sources only)
  factory Email.fromTrusted(String email) {
    return Email._(email.trim().toLowerCase());
  }

  static bool _isValidEmail(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validates an email string without throwing
  static bool isValid(String email) {
    return _isValidEmail(email.trim().toLowerCase());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Email && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
