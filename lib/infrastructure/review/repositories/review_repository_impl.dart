import 'package:dio/dio.dart';
import '../../../domain/review/entities/review.dart';
import '../../../domain/review/repositories/review_repository.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/request/submit_review_request_dto.dart';
import '../dtos/response/review_response_dto.dart';
import '../mappers/review_mapper.dart';

/// Implementation of ReviewRepository using Dio HTTP client
class ReviewRepositoryImpl implements ReviewRepository {
  final Dio dio;

  ReviewRepositoryImpl({required this.dio});

  @override
  Future<ReviewListResult> getGymReviews({
    required String gymId,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.gymReviews(gymId),
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );
      final dto = GymReviewsResponseDto.fromJson(response.data);
      return ReviewMapper.toReviewListResult(dto);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load reviews: $e');
    }
  }

  @override
  Future<Review?> getUserReviewForGym(String gymId) async {
    try {
      final response = await dio.get(ApiEndpoints.myGymReview(gymId));

      // If no review exists, API returns null
      if (response.data == null) {
        return null;
      }

      final dto = ReviewResponseDto.fromJson(response.data);
      return ReviewMapper.toDomain(dto);
    } on DioException catch (e) {
      // 404 means user hasn't reviewed this gym yet
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load user review: $e');
    }
  }

  @override
  Future<Review> submitReview(SubmitReviewRequest request) async {
    try {
      final requestDto = SubmitReviewRequestDto(
        rating: request.rating,
        comment: request.comment,
      );

      await dio.post(
        ApiEndpoints.gymReviews(request.gymId),
        data: requestDto.toJson(),
      );

      // After submitting, get the user's review
      final reviewResponse = await dio.get(
        ApiEndpoints.myGymReview(request.gymId),
      );
      final dto = ReviewResponseDto.fromJson(reviewResponse.data);
      return ReviewMapper.toDomain(dto);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to submit review: $e');
    }
  }

  @override
  Future<void> deleteReview(String gymId) async {
    try {
      await dio.delete(ApiEndpoints.gymReviews(gymId));
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to delete review: $e');
    }
  }

  @override
  Future<bool> checkEligibility(String gymId) async {
    // Eligibility is determined on the backend
    // This will be checked when user tries to submit a review
    // For now, we'll return true and let the backend handle it
    // In a future enhancement, we could call a dedicated eligibility endpoint
    return true;
  }

  /// Handle Dio errors and convert them to user-friendly exceptions
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      switch (statusCode) {
        case 400:
          return Exception(data['message'] ?? 'Invalid request');
        case 401:
          return Exception('Unauthorized. Please log in.');
        case 403:
          return Exception(
            data['message'] ?? 'You must have a subscription to review this gym',
          );
        case 404:
          return Exception(data['message'] ?? 'Review not found');
        case 500:
          return Exception('Server error. Please try again later.');
        default:
          return Exception(data['message'] ?? 'An error occurred');
      }
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception('Connection timeout. Please check your internet.');
    } else if (e.type == DioExceptionType.connectionError) {
      return Exception('No internet connection');
    }
    return Exception('An error occurred: ${e.message}');
  }
}
