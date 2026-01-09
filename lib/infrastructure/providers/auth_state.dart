import '../../domain/auth/auth.dart';

/// Sealed class representing authentication states
sealed class AuthState {
  const AuthState();
}

/// Initial state when app starts
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state during auth operations
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated state with user info
class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);
}

/// Unauthenticated state
class AuthUnauthenticated extends AuthState {
  final String? message;

  const AuthUnauthenticated({this.message});
}

/// MFA verification required state
class AuthMfaRequired extends AuthState {
  final MfaChallenge challenge;

  const AuthMfaRequired(this.challenge);
}

/// Error state
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}
