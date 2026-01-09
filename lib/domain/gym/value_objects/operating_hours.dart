/// Value object representing a gym's operating hours for a specific day
class OperatingHours {
  final int dayOfWeek; // 0-6 (0=Sunday, 1=Monday, ... 6=Saturday)
  final String dayName;
  final bool isOpen;
  final String? openTime; // HH:MM format
  final String? closeTime; // HH:MM format

  const OperatingHours({
    required this.dayOfWeek,
    required this.dayName,
    required this.isOpen,
    this.openTime,
    this.closeTime,
  });

  /// Get formatted hours string (e.g., "6:00 AM - 10:00 PM" or "Closed")
  String get formattedHours {
    if (!isOpen) return 'Closed';
    if (openTime == null || closeTime == null) return 'Closed';
    return '${_formatTime(openTime!)} - ${_formatTime(closeTime!)}';
  }

  /// Get formatted open time (e.g., "6:00 AM")
  String get formattedOpenTime {
    if (openTime == null) return '';
    return _formatTime(openTime!);
  }

  /// Get formatted close time (e.g., "10:00 PM")
  String get formattedCloseTime {
    if (closeTime == null) return '';
    return _formatTime(closeTime!);
  }

  /// Format time from 24h to 12h format
  String _formatTime(String time) {
    final parts = time.split(':');
    if (parts.length < 2) return time;

    var hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';

    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;

    return '$hour:$minute $period';
  }

  /// Check if the gym is currently open based on current time
  bool isCurrentlyOpen(DateTime now) {
    if (!isOpen) return false;
    if (openTime == null || closeTime == null) return false;

    try {
      final openParts = openTime!.split(':');
      final closeParts = closeTime!.split(':');

      final openHour = int.parse(openParts[0]);
      final openMinute = int.parse(openParts[1]);
      final closeHour = int.parse(closeParts[0]);
      final closeMinute = int.parse(closeParts[1]);

      final currentMinutes = now.hour * 60 + now.minute;
      final openMinutes = openHour * 60 + openMinute;
      final closeMinutes = closeHour * 60 + closeMinute;

      return currentMinutes >= openMinutes && currentMinutes < closeMinutes;
    } catch (e) {
      return false;
    }
  }

  /// Get today's operating hours from a list
  static OperatingHours? getTodayHours(List<OperatingHours> hours, DateTime now) {
    if (hours.isEmpty) return null;

    // DateTime.weekday: 1 = Monday, 7 = Sunday
    // Backend dayOfWeek: 0 = Sunday, 1 = Monday, ... 6 = Saturday
    // Convert: Sunday (7) -> 0, Monday (1) -> 1, etc.
    final todayDayOfWeek = now.weekday % 7;

    try {
      return hours.firstWhere((h) => h.dayOfWeek == todayDayOfWeek);
    } catch (_) {
      return null;
    }
  }

  /// Check if a gym is currently open based on operating hours list
  static bool isGymCurrentlyOpen(List<OperatingHours> hours) {
    final now = DateTime.now();
    final todayHours = getTodayHours(hours, now);
    return todayHours?.isCurrentlyOpen(now) ?? false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatingHours &&
          runtimeType == other.runtimeType &&
          dayOfWeek == other.dayOfWeek &&
          dayName == other.dayName &&
          isOpen == other.isOpen &&
          openTime == other.openTime &&
          closeTime == other.closeTime;

  @override
  int get hashCode =>
      dayOfWeek.hashCode ^
      dayName.hashCode ^
      isOpen.hashCode ^
      openTime.hashCode ^
      closeTime.hashCode;

  @override
  String toString() => 'OperatingHours($dayName: $formattedHours)';
}
