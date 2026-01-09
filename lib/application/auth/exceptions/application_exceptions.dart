/// Base class for application exceptions
abstract class ApplicationException implements Exception {
  final String message;
  final String? code;

  const ApplicationException(this.message, {this.code});

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when a network error occurs
class NetworkException extends ApplicationException {
  final int? statusCode;

  NetworkException(super.message, {this.statusCode, super.code});
}

/// Thrown when the server returns an error
class ServerException extends ApplicationException {
  final int statusCode;

  ServerException(super.message, {required this.statusCode, super.code});
}

/// Thrown when authentication fails
class AuthenticationException extends ApplicationException {
  AuthenticationException(super.message, {super.code});
}

/// Thrown when authorization fails (not enough permissions)
class AuthorizationException extends ApplicationException {
  AuthorizationException(super.message, {super.code});
}

/// Thrown when a session expires
class SessionExpiredException extends ApplicationException {
  SessionExpiredException() : super('Session expired. Please login again.');
}

/// Thrown when validation fails
class ValidationException extends ApplicationException {
  final Map<String, List<String>> errors;

  ValidationException(super.message, {required this.errors, super.code});
}

/// Thrown when a resource is not found
class NotFoundException extends ApplicationException {
  NotFoundException(super.message, {super.code});
}

/// Thrown when there's a conflict (e.g., email already exists)
class ConflictException extends ApplicationException {
  ConflictException(super.message, {super.code});
}

/// Thrown when rate limit is exceeded
class RateLimitException extends ApplicationException {
  final Duration? retryAfter;

  RateLimitException({this.retryAfter})
      : super(retryAfter != null
            ? 'Too many requests. Try again in ${retryAfter.inSeconds} seconds.'
            : 'Too many requests. Please try again later.');
}

/// Thrown when storage operations fail
class StorageException extends ApplicationException {
  StorageException(super.message, {super.code});
}
