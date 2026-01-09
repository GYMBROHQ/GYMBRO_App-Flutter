// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_review_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubmitReviewRequestDto _$SubmitReviewRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubmitReviewRequestDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitReviewRequestDto {
  double get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this SubmitReviewRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitReviewRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitReviewRequestDtoCopyWith<SubmitReviewRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReviewRequestDtoCopyWith<$Res> {
  factory $SubmitReviewRequestDtoCopyWith(
    SubmitReviewRequestDto value,
    $Res Function(SubmitReviewRequestDto) then,
  ) = _$SubmitReviewRequestDtoCopyWithImpl<$Res, SubmitReviewRequestDto>;
  @useResult
  $Res call({double rating, String? comment});
}

/// @nodoc
class _$SubmitReviewRequestDtoCopyWithImpl<
  $Res,
  $Val extends SubmitReviewRequestDto
>
    implements $SubmitReviewRequestDtoCopyWith<$Res> {
  _$SubmitReviewRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitReviewRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = null, Object? comment = freezed}) {
    return _then(
      _value.copyWith(
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubmitReviewRequestDtoImplCopyWith<$Res>
    implements $SubmitReviewRequestDtoCopyWith<$Res> {
  factory _$$SubmitReviewRequestDtoImplCopyWith(
    _$SubmitReviewRequestDtoImpl value,
    $Res Function(_$SubmitReviewRequestDtoImpl) then,
  ) = __$$SubmitReviewRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double rating, String? comment});
}

/// @nodoc
class __$$SubmitReviewRequestDtoImplCopyWithImpl<$Res>
    extends
        _$SubmitReviewRequestDtoCopyWithImpl<$Res, _$SubmitReviewRequestDtoImpl>
    implements _$$SubmitReviewRequestDtoImplCopyWith<$Res> {
  __$$SubmitReviewRequestDtoImplCopyWithImpl(
    _$SubmitReviewRequestDtoImpl _value,
    $Res Function(_$SubmitReviewRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubmitReviewRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = null, Object? comment = freezed}) {
    return _then(
      _$SubmitReviewRequestDtoImpl(
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitReviewRequestDtoImpl implements _SubmitReviewRequestDto {
  const _$SubmitReviewRequestDtoImpl({required this.rating, this.comment});

  factory _$SubmitReviewRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitReviewRequestDtoImplFromJson(json);

  @override
  final double rating;
  @override
  final String? comment;

  @override
  String toString() {
    return 'SubmitReviewRequestDto(rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitReviewRequestDtoImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, comment);

  /// Create a copy of SubmitReviewRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitReviewRequestDtoImplCopyWith<_$SubmitReviewRequestDtoImpl>
  get copyWith =>
      __$$SubmitReviewRequestDtoImplCopyWithImpl<_$SubmitReviewRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitReviewRequestDtoImplToJson(this);
  }
}

abstract class _SubmitReviewRequestDto implements SubmitReviewRequestDto {
  const factory _SubmitReviewRequestDto({
    required final double rating,
    final String? comment,
  }) = _$SubmitReviewRequestDtoImpl;

  factory _SubmitReviewRequestDto.fromJson(Map<String, dynamic> json) =
      _$SubmitReviewRequestDtoImpl.fromJson;

  @override
  double get rating;
  @override
  String? get comment;

  /// Create a copy of SubmitReviewRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitReviewRequestDtoImplCopyWith<_$SubmitReviewRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
