import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_log.freezed.dart';

/// Domain entity representing an access log entry
@freezed
class AccessLog with _$AccessLog {
  const factory AccessLog({
    required String id,
    required String subscriptionId,
    required String gymId,
    required String gymName,
    required AccessResult result,
    required DateTime timestamp,
    String? deniedReason,
  }) = _AccessLog;

  const AccessLog._();

  /// Check if access was granted
  bool get wasGranted => result == AccessResult.granted;
}

/// Access result enum
enum AccessResult {
  granted,
  denied;

  String get displayName {
    switch (this) {
      case AccessResult.granted:
        return 'Granted';
      case AccessResult.denied:
        return 'Denied';
    }
  }
}
