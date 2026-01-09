/// State representing the app lock status
enum AppLockStatus {
  unlocked,       // App is accessible
  locked,         // App is locked, awaiting biometric
  authenticating, // Biometric authentication in progress
  failed,         // Authentication failed
}

class AppLockState {
  final AppLockStatus status;
  final int failedAttempts;
  final String? errorMessage;

  const AppLockState({
    required this.status,
    this.failedAttempts = 0,
    this.errorMessage,
  });

  AppLockState copyWith({
    AppLockStatus? status,
    int? failedAttempts,
    String? errorMessage,
  }) {
    return AppLockState(
      status: status ?? this.status,
      failedAttempts: failedAttempts ?? this.failedAttempts,
      errorMessage: errorMessage,
    );
  }

  static const initial = AppLockState(status: AppLockStatus.unlocked);
  static const locked = AppLockState(status: AppLockStatus.locked);
}
