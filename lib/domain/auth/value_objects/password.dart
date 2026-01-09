import '../exceptions/domain_exceptions.dart';

/// Password strength levels
enum PasswordStrength { weak, fair, medium, good, strong }

/// Password value object with validation and strength checking
class Password {
  final String value;

  const Password._(this.value);

  /// Minimum password length
  static const int minLength = 8;

  /// Creates a Password value object with validation
  /// Throws [InvalidPasswordException] if password doesn't meet requirements
  factory Password.create(String password) {
    final failures = _validatePassword(password);
    if (failures.isNotEmpty) {
      throw InvalidPasswordException(failures);
    }
    return Password._(password);
  }

  /// Creates a Password without validation (use for trusted sources only)
  factory Password.fromTrusted(String password) {
    return Password._(password);
  }

  static List<String> _validatePassword(String password) {
    final failures = <String>[];

    if (password.length < minLength) {
      failures.add('Must be at least $minLength characters');
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      failures.add('Must contain an uppercase letter');
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      failures.add('Must contain a lowercase letter');
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      failures.add('Must contain a number');
    }

    return failures;
  }

  /// Validates a password string without throwing
  static bool isValid(String password) {
    return _validatePassword(password).isEmpty;
  }

  /// Returns list of failed requirements for a password
  static List<String> getFailedRequirements(String password) {
    return _validatePassword(password);
  }

  /// Calculates password strength
  static PasswordStrength calculateStrength(String password) {
    int score = 0;

    if (password.length >= minLength) score++;
    if (password.length >= 12) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[a-z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;

    if (score <= 2) return PasswordStrength.weak;
    if (score == 3) return PasswordStrength.fair;
    if (score == 4) return PasswordStrength.medium;
    if (score == 5) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  PasswordStrength get strength => calculateStrength(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Password && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '[REDACTED]';
}
