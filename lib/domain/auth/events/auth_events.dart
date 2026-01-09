import '../entities/user.dart';

/// Base class for auth domain events
abstract class AuthEvent {
  final DateTime occurredAt;

  AuthEvent() : occurredAt = DateTime.now();
}

/// Event fired when a user successfully logs in
class UserLoggedInEvent extends AuthEvent {
  final User user;
  final String? deviceId;
  final String? ipAddress;

  UserLoggedInEvent({
    required this.user,
    this.deviceId,
    this.ipAddress,
  });
}

/// Event fired when a user logs out
class UserLoggedOutEvent extends AuthEvent {
  final String userId;
  final bool allDevices;

  UserLoggedOutEvent({
    required this.userId,
    this.allDevices = false,
  });
}

/// Event fired when MFA is enabled for a user
class MfaEnabledEvent extends AuthEvent {
  final String userId;

  MfaEnabledEvent({required this.userId});
}

/// Event fired when MFA is disabled for a user
class MfaDisabledEvent extends AuthEvent {
  final String userId;

  MfaDisabledEvent({required this.userId});
}

/// Event fired when a password reset is requested
class PasswordResetRequestedEvent extends AuthEvent {
  final String email;

  PasswordResetRequestedEvent({required this.email});
}

/// Event fired when a password is successfully reset
class PasswordResetCompletedEvent extends AuthEvent {
  final String userId;

  PasswordResetCompletedEvent({required this.userId});
}

/// Event fired when a user registers
class UserRegisteredEvent extends AuthEvent {
  final User user;

  UserRegisteredEvent({required this.user});
}
