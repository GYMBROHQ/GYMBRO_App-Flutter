// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_review_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitReviewRequestDtoImpl _$$SubmitReviewRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubmitReviewRequestDtoImpl(
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$$SubmitReviewRequestDtoImplToJson(
  _$SubmitReviewRequestDtoImpl instance,
) => <String, dynamic>{'rating': instance.rating, 'comment': instance.comment};
