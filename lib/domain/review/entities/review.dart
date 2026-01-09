import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

/// Domain entity representing a user's review of a gym
@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required String authId,
    required String gymId,
    required double rating,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? reviewerName,
  }) = _Review;

  const Review._();

  /// Check if review has a comment
  bool get hasComment => comment != null && comment!.isNotEmpty;

  /// Get formatted date string
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }
}
