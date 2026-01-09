import '../exceptions/domain_exceptions.dart';

/// TOTP code value object with validation
class TotpCode {
  final String value;

  const TotpCode._(this.value);

  /// Expected length for TOTP codes
  static const int expectedLength = 6;

  /// Creates a TotpCode value object with validation
  /// Throws [InvalidTotpCodeException] if the code is invalid
  factory TotpCode.create(String code) {
    final trimmed = code.trim();
    if (!_isValidCode(trimmed)) {
      throw InvalidTotpCodeException();
    }
    return TotpCode._(trimmed);
  }

  static bool _isValidCode(String code) {
    if (code.length != expectedLength) return false;
    return RegExp(r'^\d{6}$').hasMatch(code);
  }

  /// Validates a TOTP code string without throwing
  static bool isValid(String code) {
    return _isValidCode(code.trim());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotpCode && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '[REDACTED]';
}
