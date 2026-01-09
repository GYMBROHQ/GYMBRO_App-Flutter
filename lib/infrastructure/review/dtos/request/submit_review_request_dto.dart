import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_review_request_dto.freezed.dart';
part 'submit_review_request_dto.g.dart';

/// DTO for submitting a review to the API
@freezed
class SubmitReviewRequestDto with _$SubmitReviewRequestDto {
  const factory SubmitReviewRequestDto({
    required double rating,
    String? comment,
  }) = _SubmitReviewRequestDto;

  factory SubmitReviewRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitReviewRequestDtoFromJson(json);
}
