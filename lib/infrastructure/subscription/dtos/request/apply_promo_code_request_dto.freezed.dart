// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_promo_code_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApplyPromoCodeRequestDto _$ApplyPromoCodeRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _ApplyPromoCodeRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ApplyPromoCodeRequestDto {
  String get promoCode => throw _privateConstructorUsedError;

  /// Serializes this ApplyPromoCodeRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplyPromoCodeRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplyPromoCodeRequestDtoCopyWith<ApplyPromoCodeRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyPromoCodeRequestDtoCopyWith<$Res> {
  factory $ApplyPromoCodeRequestDtoCopyWith(
    ApplyPromoCodeRequestDto value,
    $Res Function(ApplyPromoCodeRequestDto) then,
  ) = _$ApplyPromoCodeRequestDtoCopyWithImpl<$Res, ApplyPromoCodeRequestDto>;
  @useResult
  $Res call({String promoCode});
}

/// @nodoc
class _$ApplyPromoCodeRequestDtoCopyWithImpl<
  $Res,
  $Val extends ApplyPromoCodeRequestDto
>
    implements $ApplyPromoCodeRequestDtoCopyWith<$Res> {
  _$ApplyPromoCodeRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplyPromoCodeRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? promoCode = null}) {
    return _then(
      _value.copyWith(
            promoCode: null == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApplyPromoCodeRequestDtoImplCopyWith<$Res>
    implements $ApplyPromoCodeRequestDtoCopyWith<$Res> {
  factory _$$ApplyPromoCodeRequestDtoImplCopyWith(
    _$ApplyPromoCodeRequestDtoImpl value,
    $Res Function(_$ApplyPromoCodeRequestDtoImpl) then,
  ) = __$$ApplyPromoCodeRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String promoCode});
}

/// @nodoc
class __$$ApplyPromoCodeRequestDtoImplCopyWithImpl<$Res>
    extends
        _$ApplyPromoCodeRequestDtoCopyWithImpl<
          $Res,
          _$ApplyPromoCodeRequestDtoImpl
        >
    implements _$$ApplyPromoCodeRequestDtoImplCopyWith<$Res> {
  __$$ApplyPromoCodeRequestDtoImplCopyWithImpl(
    _$ApplyPromoCodeRequestDtoImpl _value,
    $Res Function(_$ApplyPromoCodeRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplyPromoCodeRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? promoCode = null}) {
    return _then(
      _$ApplyPromoCodeRequestDtoImpl(
        promoCode: null == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplyPromoCodeRequestDtoImpl implements _ApplyPromoCodeRequestDto {
  const _$ApplyPromoCodeRequestDtoImpl({required this.promoCode});

  factory _$ApplyPromoCodeRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplyPromoCodeRequestDtoImplFromJson(json);

  @override
  final String promoCode;

  @override
  String toString() {
    return 'ApplyPromoCodeRequestDto(promoCode: $promoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyPromoCodeRequestDtoImpl &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, promoCode);

  /// Create a copy of ApplyPromoCodeRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyPromoCodeRequestDtoImplCopyWith<_$ApplyPromoCodeRequestDtoImpl>
  get copyWith =>
      __$$ApplyPromoCodeRequestDtoImplCopyWithImpl<
        _$ApplyPromoCodeRequestDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplyPromoCodeRequestDtoImplToJson(this);
  }
}

abstract class _ApplyPromoCodeRequestDto implements ApplyPromoCodeRequestDto {
  const factory _ApplyPromoCodeRequestDto({required final String promoCode}) =
      _$ApplyPromoCodeRequestDtoImpl;

  factory _ApplyPromoCodeRequestDto.fromJson(Map<String, dynamic> json) =
      _$ApplyPromoCodeRequestDtoImpl.fromJson;

  @override
  String get promoCode;

  /// Create a copy of ApplyPromoCodeRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyPromoCodeRequestDtoImplCopyWith<_$ApplyPromoCodeRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
