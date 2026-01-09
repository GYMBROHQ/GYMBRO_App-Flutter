import '../../../domain/review/entities/review.dart';
import '../../../domain/review/repositories/review_repository.dart';
import '../dtos/response/review_response_dto.dart';

/// Mapper for converting Review DTOs to domain entities
class ReviewMapper {
  /// Convert Review DTO to domain entity
  static Review toDomain(ReviewResponseDto dto) {
    return Review(
      id: dto.id,
      authId: dto.authId,
      gymId: dto.gymId,
      rating: dto.rating,
      comment: dto.comment,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
      reviewerName: dto.reviewerName,
    );
  }

  /// Convert list of Review DTOs to domain entities
  static List<Review> toDomainList(List<ReviewResponseDto> dtos) {
    return dtos.map(toDomain).toList();
  }

  /// Convert GymReviewsResponseDto to ReviewListResult
  static ReviewListResult toReviewListResult(GymReviewsResponseDto dto) {
    return ReviewListResult(
      reviews: toDomainList(dto.reviews),
      totalCount: dto.totalCount,
      page: dto.page,
      pageSize: dto.pageSize,
    );
  }
}
