// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReviewResponseDto _$ReviewResponseDtoFromJson(Map<String, dynamic> json) {
  return _ReviewResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get authId => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get reviewerName => throw _privateConstructorUsedError;

  /// Serializes this ReviewResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewResponseDtoCopyWith<ReviewResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseDtoCopyWith<$Res> {
  factory $ReviewResponseDtoCopyWith(
    ReviewResponseDto value,
    $Res Function(ReviewResponseDto) then,
  ) = _$ReviewResponseDtoCopyWithImpl<$Res, ReviewResponseDto>;
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    double rating,
    String? comment,
    String createdAt,
    String updatedAt,
    String? reviewerName,
  });
}

/// @nodoc
class _$ReviewResponseDtoCopyWithImpl<$Res, $Val extends ReviewResponseDto>
    implements $ReviewResponseDtoCopyWith<$Res> {
  _$ReviewResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? gymId = null,
    Object? rating = null,
    Object? comment = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reviewerName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            authId: null == authId
                ? _value.authId
                : authId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            reviewerName: freezed == reviewerName
                ? _value.reviewerName
                : reviewerName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewResponseDtoImplCopyWith<$Res>
    implements $ReviewResponseDtoCopyWith<$Res> {
  factory _$$ReviewResponseDtoImplCopyWith(
    _$ReviewResponseDtoImpl value,
    $Res Function(_$ReviewResponseDtoImpl) then,
  ) = __$$ReviewResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    double rating,
    String? comment,
    String createdAt,
    String updatedAt,
    String? reviewerName,
  });
}

/// @nodoc
class __$$ReviewResponseDtoImplCopyWithImpl<$Res>
    extends _$ReviewResponseDtoCopyWithImpl<$Res, _$ReviewResponseDtoImpl>
    implements _$$ReviewResponseDtoImplCopyWith<$Res> {
  __$$ReviewResponseDtoImplCopyWithImpl(
    _$ReviewResponseDtoImpl _value,
    $Res Function(_$ReviewResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? gymId = null,
    Object? rating = null,
    Object? comment = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reviewerName = freezed,
  }) {
    return _then(
      _$ReviewResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authId: null == authId
            ? _value.authId
            : authId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        reviewerName: freezed == reviewerName
            ? _value.reviewerName
            : reviewerName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseDtoImpl implements _ReviewResponseDto {
  const _$ReviewResponseDtoImpl({
    required this.id,
    required this.authId,
    required this.gymId,
    required this.rating,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
    this.reviewerName,
  });

  factory _$ReviewResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String authId;
  @override
  final String gymId;
  @override
  final double rating;
  @override
  final String? comment;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? reviewerName;

  @override
  String toString() {
    return 'ReviewResponseDto(id: $id, authId: $authId, gymId: $gymId, rating: $rating, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt, reviewerName: $reviewerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authId,
    gymId,
    rating,
    comment,
    createdAt,
    updatedAt,
    reviewerName,
  );

  /// Create a copy of ReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseDtoImplCopyWith<_$ReviewResponseDtoImpl> get copyWith =>
      __$$ReviewResponseDtoImplCopyWithImpl<_$ReviewResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseDtoImplToJson(this);
  }
}

abstract class _ReviewResponseDto implements ReviewResponseDto {
  const factory _ReviewResponseDto({
    required final String id,
    required final String authId,
    required final String gymId,
    required final double rating,
    final String? comment,
    required final String createdAt,
    required final String updatedAt,
    final String? reviewerName,
  }) = _$ReviewResponseDtoImpl;

  factory _ReviewResponseDto.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get authId;
  @override
  String get gymId;
  @override
  double get rating;
  @override
  String? get comment;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get reviewerName;

  /// Create a copy of ReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewResponseDtoImplCopyWith<_$ReviewResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GymReviewsResponseDto _$GymReviewsResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _GymReviewsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$GymReviewsResponseDto {
  List<ReviewResponseDto> get reviews => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  /// Serializes this GymReviewsResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GymReviewsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GymReviewsResponseDtoCopyWith<GymReviewsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GymReviewsResponseDtoCopyWith<$Res> {
  factory $GymReviewsResponseDtoCopyWith(
    GymReviewsResponseDto value,
    $Res Function(GymReviewsResponseDto) then,
  ) = _$GymReviewsResponseDtoCopyWithImpl<$Res, GymReviewsResponseDto>;
  @useResult
  $Res call({
    List<ReviewResponseDto> reviews,
    int totalCount,
    int page,
    int pageSize,
  });
}

/// @nodoc
class _$GymReviewsResponseDtoCopyWithImpl<
  $Res,
  $Val extends GymReviewsResponseDto
>
    implements $GymReviewsResponseDtoCopyWith<$Res> {
  _$GymReviewsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GymReviewsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? totalCount = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(
      _value.copyWith(
            reviews: null == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<ReviewResponseDto>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            pageSize: null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GymReviewsResponseDtoImplCopyWith<$Res>
    implements $GymReviewsResponseDtoCopyWith<$Res> {
  factory _$$GymReviewsResponseDtoImplCopyWith(
    _$GymReviewsResponseDtoImpl value,
    $Res Function(_$GymReviewsResponseDtoImpl) then,
  ) = __$$GymReviewsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ReviewResponseDto> reviews,
    int totalCount,
    int page,
    int pageSize,
  });
}

/// @nodoc
class __$$GymReviewsResponseDtoImplCopyWithImpl<$Res>
    extends
        _$GymReviewsResponseDtoCopyWithImpl<$Res, _$GymReviewsResponseDtoImpl>
    implements _$$GymReviewsResponseDtoImplCopyWith<$Res> {
  __$$GymReviewsResponseDtoImplCopyWithImpl(
    _$GymReviewsResponseDtoImpl _value,
    $Res Function(_$GymReviewsResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GymReviewsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? totalCount = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(
      _$GymReviewsResponseDtoImpl(
        reviews: null == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<ReviewResponseDto>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GymReviewsResponseDtoImpl implements _GymReviewsResponseDto {
  const _$GymReviewsResponseDtoImpl({
    required final List<ReviewResponseDto> reviews,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  }) : _reviews = reviews;

  factory _$GymReviewsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GymReviewsResponseDtoImplFromJson(json);

  final List<ReviewResponseDto> _reviews;
  @override
  List<ReviewResponseDto> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final int totalCount;
  @override
  final int page;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'GymReviewsResponseDto(reviews: $reviews, totalCount: $totalCount, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GymReviewsResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_reviews),
    totalCount,
    page,
    pageSize,
  );

  /// Create a copy of GymReviewsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GymReviewsResponseDtoImplCopyWith<_$GymReviewsResponseDtoImpl>
  get copyWith =>
      __$$GymReviewsResponseDtoImplCopyWithImpl<_$GymReviewsResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GymReviewsResponseDtoImplToJson(this);
  }
}

abstract class _GymReviewsResponseDto implements GymReviewsResponseDto {
  const factory _GymReviewsResponseDto({
    required final List<ReviewResponseDto> reviews,
    required final int totalCount,
    required final int page,
    required final int pageSize,
  }) = _$GymReviewsResponseDtoImpl;

  factory _GymReviewsResponseDto.fromJson(Map<String, dynamic> json) =
      _$GymReviewsResponseDtoImpl.fromJson;

  @override
  List<ReviewResponseDto> get reviews;
  @override
  int get totalCount;
  @override
  int get page;
  @override
  int get pageSize;

  /// Create a copy of GymReviewsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GymReviewsResponseDtoImplCopyWith<_$GymReviewsResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubmitReviewResponseDto _$SubmitReviewResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubmitReviewResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitReviewResponseDto {
  String get reviewId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this SubmitReviewResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitReviewResponseDtoCopyWith<SubmitReviewResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReviewResponseDtoCopyWith<$Res> {
  factory $SubmitReviewResponseDtoCopyWith(
    SubmitReviewResponseDto value,
    $Res Function(SubmitReviewResponseDto) then,
  ) = _$SubmitReviewResponseDtoCopyWithImpl<$Res, SubmitReviewResponseDto>;
  @useResult
  $Res call({String reviewId, String message});
}

/// @nodoc
class _$SubmitReviewResponseDtoCopyWithImpl<
  $Res,
  $Val extends SubmitReviewResponseDto
>
    implements $SubmitReviewResponseDtoCopyWith<$Res> {
  _$SubmitReviewResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reviewId = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            reviewId: null == reviewId
                ? _value.reviewId
                : reviewId // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubmitReviewResponseDtoImplCopyWith<$Res>
    implements $SubmitReviewResponseDtoCopyWith<$Res> {
  factory _$$SubmitReviewResponseDtoImplCopyWith(
    _$SubmitReviewResponseDtoImpl value,
    $Res Function(_$SubmitReviewResponseDtoImpl) then,
  ) = __$$SubmitReviewResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewId, String message});
}

/// @nodoc
class __$$SubmitReviewResponseDtoImplCopyWithImpl<$Res>
    extends
        _$SubmitReviewResponseDtoCopyWithImpl<
          $Res,
          _$SubmitReviewResponseDtoImpl
        >
    implements _$$SubmitReviewResponseDtoImplCopyWith<$Res> {
  __$$SubmitReviewResponseDtoImplCopyWithImpl(
    _$SubmitReviewResponseDtoImpl _value,
    $Res Function(_$SubmitReviewResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubmitReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reviewId = null, Object? message = null}) {
    return _then(
      _$SubmitReviewResponseDtoImpl(
        reviewId: null == reviewId
            ? _value.reviewId
            : reviewId // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitReviewResponseDtoImpl implements _SubmitReviewResponseDto {
  const _$SubmitReviewResponseDtoImpl({
    required this.reviewId,
    required this.message,
  });

  factory _$SubmitReviewResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitReviewResponseDtoImplFromJson(json);

  @override
  final String reviewId;
  @override
  final String message;

  @override
  String toString() {
    return 'SubmitReviewResponseDto(reviewId: $reviewId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitReviewResponseDtoImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewId, message);

  /// Create a copy of SubmitReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitReviewResponseDtoImplCopyWith<_$SubmitReviewResponseDtoImpl>
  get copyWith =>
      __$$SubmitReviewResponseDtoImplCopyWithImpl<
        _$SubmitReviewResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitReviewResponseDtoImplToJson(this);
  }
}

abstract class _SubmitReviewResponseDto implements SubmitReviewResponseDto {
  const factory _SubmitReviewResponseDto({
    required final String reviewId,
    required final String message,
  }) = _$SubmitReviewResponseDtoImpl;

  factory _SubmitReviewResponseDto.fromJson(Map<String, dynamic> json) =
      _$SubmitReviewResponseDtoImpl.fromJson;

  @override
  String get reviewId;
  @override
  String get message;

  /// Create a copy of SubmitReviewResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitReviewResponseDtoImplCopyWith<_$SubmitReviewResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
