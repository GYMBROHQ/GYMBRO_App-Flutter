import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/review/entities/review.dart';
import '../../../domain/review/repositories/review_repository.dart';
import '../../../infrastructure/review/repositories/review_repository_impl.dart';
import '../../../infrastructure/core/network/api_client.dart';

part 'review_notifier.g.dart';

/// Provider for ReviewRepository
@riverpod
ReviewRepository reviewRepository(ReviewRepositoryRef ref) {
  final dio = ApiClient.createDio();
  return ReviewRepositoryImpl(dio: dio);
}

/// Notifier for managing gym reviews list
@riverpod
class GymReviews extends _$GymReviews {
  late String _gymId;
  int _currentPage = 1;
  static const int _pageSize = 20;

  @override
  Future<ReviewListResult> build(String gymId) async {
    _gymId = gymId;
    final repository = ref.read(reviewRepositoryProvider);
    return await repository.getGymReviews(
      gymId: gymId,
      page: _currentPage,
      pageSize: _pageSize,
    );
  }

  /// Load next page of reviews
  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null || !currentState.hasMore) return;

    _currentPage++;
    final repository = ref.read(reviewRepositoryProvider);

    try {
      final nextPage = await repository.getGymReviews(
        gymId: _gymId,
        page: _currentPage,
        pageSize: _pageSize,
      );

      // Combine old and new reviews
      state = AsyncData(
        ReviewListResult(
          reviews: [...currentState.reviews, ...nextPage.reviews],
          totalCount: nextPage.totalCount,
          page: _currentPage,
          pageSize: _pageSize,
        ),
      );
    } catch (e, st) {
      // Keep current state but add error
      state = AsyncError(e, st);
    }
  }

  /// Refresh reviews list
  Future<void> refresh() async {
    _currentPage = 1;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(_gymId));
  }
}

/// Notifier for managing user's review for a gym
@riverpod
class UserReviewForGym extends _$UserReviewForGym {
  late String _gymId;

  @override
  Future<Review?> build(String gymId) async {
    _gymId = gymId;
    final repository = ref.read(reviewRepositoryProvider);
    return await repository.getUserReviewForGym(gymId);
  }

  /// Submit or update a review
  Future<void> submitReview({
    required double rating,
    String? comment,
  }) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(reviewRepositoryProvider);
      final review = await repository.submitReview(
        SubmitReviewRequest(
          gymId: _gymId,
          rating: rating,
          comment: comment,
        ),
      );

      state = AsyncData(review);

      // Refresh the gym reviews list
      ref.invalidate(gymReviewsProvider(_gymId));
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// Delete user's review
  Future<void> deleteReview() async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(reviewRepositoryProvider);
      await repository.deleteReview(_gymId);

      state = const AsyncData(null);

      // Refresh the gym reviews list
      ref.invalidate(gymReviewsProvider(_gymId));
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  /// Refresh user's review
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(_gymId));
  }
}
