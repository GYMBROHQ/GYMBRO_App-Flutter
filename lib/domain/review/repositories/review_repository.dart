import '../entities/review.dart';

/// Request data for submitting a review
class SubmitReviewRequest {
  final String gymId;
  final double rating;
  final String? comment;

  const SubmitReviewRequest({
    required this.gymId,
    required this.rating,
    this.comment,
  });
}

/// Repository interface for managing gym reviews
abstract class ReviewRepository {
  /// Get all reviews for a gym with pagination
  Future<ReviewListResult> getGymReviews({
    required String gymId,
    int page = 1,
    int pageSize = 20,
  });

  /// Get the authenticated user's review for a specific gym
  /// Returns null if the user hasn't reviewed the gym
  Future<Review?> getUserReviewForGym(String gymId);

  /// Submit or update a review for a gym
  Future<Review> submitReview(SubmitReviewRequest request);

  /// Delete the user's review for a gym
  Future<void> deleteReview(String gymId);

  /// Check if user is eligible to review a gym
  /// (must have at least one subscription to the gym)
  Future<bool> checkEligibility(String gymId);
}

/// Result object for paginated gym reviews
class ReviewListResult {
  final List<Review> reviews;
  final int totalCount;
  final int page;
  final int pageSize;

  const ReviewListResult({
    required this.reviews,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  });

  bool get hasMore => reviews.length < totalCount;
  int get totalPages => (totalCount / pageSize).ceil();
}
