import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response_dto.freezed.dart';
part 'review_response_dto.g.dart';

/// DTO for single review response from API
@freezed
class ReviewResponseDto with _$ReviewResponseDto {
  const factory ReviewResponseDto({
    required String id,
    required String authId,
    required String gymId,
    required double rating,
    String? comment,
    required String createdAt,
    required String updatedAt,
    String? reviewerName,
  }) = _ReviewResponseDto;

  factory ReviewResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseDtoFromJson(json);
}

/// DTO for gym reviews list response from API
@freezed
class GymReviewsResponseDto with _$GymReviewsResponseDto {
  const factory GymReviewsResponseDto({
    required List<ReviewResponseDto> reviews,
    required int totalCount,
    required int page,
    required int pageSize,
  }) = _GymReviewsResponseDto;

  factory GymReviewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GymReviewsResponseDtoFromJson(json);
}

/// DTO for submit review response from API
@freezed
class SubmitReviewResponseDto with _$SubmitReviewResponseDto {
  const factory SubmitReviewResponseDto({
    required String reviewId,
    required String message,
  }) = _SubmitReviewResponseDto;

  factory SubmitReviewResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitReviewResponseDtoFromJson(json);
}
