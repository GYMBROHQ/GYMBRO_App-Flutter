// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseDtoImpl _$$ReviewResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ReviewResponseDtoImpl(
  id: json['id'] as String,
  authId: json['authId'] as String,
  gymId: json['gymId'] as String,
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  reviewerName: json['reviewerName'] as String?,
);

Map<String, dynamic> _$$ReviewResponseDtoImplToJson(
  _$ReviewResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'authId': instance.authId,
  'gymId': instance.gymId,
  'rating': instance.rating,
  'comment': instance.comment,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'reviewerName': instance.reviewerName,
};

_$GymReviewsResponseDtoImpl _$$GymReviewsResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$GymReviewsResponseDtoImpl(
  reviews: (json['reviews'] as List<dynamic>)
      .map((e) => ReviewResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
);

Map<String, dynamic> _$$GymReviewsResponseDtoImplToJson(
  _$GymReviewsResponseDtoImpl instance,
) => <String, dynamic>{
  'reviews': instance.reviews,
  'totalCount': instance.totalCount,
  'page': instance.page,
  'pageSize': instance.pageSize,
};

_$SubmitReviewResponseDtoImpl _$$SubmitReviewResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SubmitReviewResponseDtoImpl(
  reviewId: json['reviewId'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$$SubmitReviewResponseDtoImplToJson(
  _$SubmitReviewResponseDtoImpl instance,
) => <String, dynamic>{
  'reviewId': instance.reviewId,
  'message': instance.message,
};
