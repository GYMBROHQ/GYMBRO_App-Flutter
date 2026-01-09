/// Base class for domain exceptions
abstract class DomainException implements Exception {
  final String message;

  const DomainException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when an invalid email is provided
class InvalidEmailException extends DomainException {
  final String email;

  InvalidEmailException(this.email) : super('Invalid email address: $email');
}

/// Thrown when a password doesn't meet requirements
class InvalidPasswordException extends DomainException {
  final List<String> failedRequirements;

  InvalidPasswordException(this.failedRequirements)
      : super('Password does not meet requirements: ${failedRequirements.join(', ')}');
}

/// Thrown when a TOTP code is invalid
class InvalidTotpCodeException extends DomainException {
  InvalidTotpCodeException() : super('Invalid TOTP code format');
}

/// Thrown when user is not found
class UserNotFoundException extends DomainException {
  UserNotFoundException() : super('User not found');
}

/// Thrown when credentials are invalid
class InvalidCredentialsException extends DomainException {
  InvalidCredentialsException() : super('Invalid email or password');
}

/// Thrown when account is locked
class AccountLockedException extends DomainException {
  final Duration? lockDuration;

  AccountLockedException({this.lockDuration})
      : super(lockDuration != null
            ? 'Account is locked. Try again in ${lockDuration.inMinutes} minutes.'
            : 'Account is locked');
}

/// Thrown when MFA is required but not provided
class MfaRequiredException extends DomainException {
  MfaRequiredException() : super('MFA verification required');
}

/// Thrown when MFA code is invalid
class InvalidMfaCodeException extends DomainException {
  InvalidMfaCodeException() : super('Invalid MFA code');
}

/// Thrown when MFA is already enabled
class MfaAlreadyEnabledException extends DomainException {
  MfaAlreadyEnabledException() : super('MFA is already enabled for this account');
}

/// Thrown when MFA is not enabled but operation requires it
class MfaNotEnabledException extends DomainException {
  MfaNotEnabledException() : super('MFA is not enabled for this account');
}

/// Thrown when a token (reset, MFA, etc.) is invalid or expired
class InvalidTokenException extends DomainException {
  InvalidTokenException() : super('Invalid or expired token');
}
