// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromoCodeResultDto _$PromoCodeResultDtoFromJson(Map<String, dynamic> json) {
  return _PromoCodeResultDto.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeResultDto {
  String get promoCode => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  double get originalPrice => throw _privateConstructorUsedError;
  double get finalPrice => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this PromoCodeResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoCodeResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoCodeResultDtoCopyWith<PromoCodeResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeResultDtoCopyWith<$Res> {
  factory $PromoCodeResultDtoCopyWith(
    PromoCodeResultDto value,
    $Res Function(PromoCodeResultDto) then,
  ) = _$PromoCodeResultDtoCopyWithImpl<$Res, PromoCodeResultDto>;
  @useResult
  $Res call({
    String promoCode,
    double discountAmount,
    double originalPrice,
    double finalPrice,
    String? message,
  });
}

/// @nodoc
class _$PromoCodeResultDtoCopyWithImpl<$Res, $Val extends PromoCodeResultDto>
    implements $PromoCodeResultDtoCopyWith<$Res> {
  _$PromoCodeResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoCodeResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? discountAmount = null,
    Object? originalPrice = null,
    Object? finalPrice = null,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            promoCode: null == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String,
            discountAmount: null == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            originalPrice: null == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            finalPrice: null == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoCodeResultDtoImplCopyWith<$Res>
    implements $PromoCodeResultDtoCopyWith<$Res> {
  factory _$$PromoCodeResultDtoImplCopyWith(
    _$PromoCodeResultDtoImpl value,
    $Res Function(_$PromoCodeResultDtoImpl) then,
  ) = __$$PromoCodeResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String promoCode,
    double discountAmount,
    double originalPrice,
    double finalPrice,
    String? message,
  });
}

/// @nodoc
class __$$PromoCodeResultDtoImplCopyWithImpl<$Res>
    extends _$PromoCodeResultDtoCopyWithImpl<$Res, _$PromoCodeResultDtoImpl>
    implements _$$PromoCodeResultDtoImplCopyWith<$Res> {
  __$$PromoCodeResultDtoImplCopyWithImpl(
    _$PromoCodeResultDtoImpl _value,
    $Res Function(_$PromoCodeResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoCodeResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? discountAmount = null,
    Object? originalPrice = null,
    Object? finalPrice = null,
    Object? message = freezed,
  }) {
    return _then(
      _$PromoCodeResultDtoImpl(
        promoCode: null == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String,
        discountAmount: null == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        originalPrice: null == originalPrice
            ? _value.originalPrice
            : originalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        finalPrice: null == finalPrice
            ? _value.finalPrice
            : finalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoCodeResultDtoImpl implements _PromoCodeResultDto {
  const _$PromoCodeResultDtoImpl({
    required this.promoCode,
    required this.discountAmount,
    required this.originalPrice,
    required this.finalPrice,
    this.message,
  });

  factory _$PromoCodeResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoCodeResultDtoImplFromJson(json);

  @override
  final String promoCode;
  @override
  final double discountAmount;
  @override
  final double originalPrice;
  @override
  final double finalPrice;
  @override
  final String? message;

  @override
  String toString() {
    return 'PromoCodeResultDto(promoCode: $promoCode, discountAmount: $discountAmount, originalPrice: $originalPrice, finalPrice: $finalPrice, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoCodeResultDtoImpl &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    promoCode,
    discountAmount,
    originalPrice,
    finalPrice,
    message,
  );

  /// Create a copy of PromoCodeResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCodeResultDtoImplCopyWith<_$PromoCodeResultDtoImpl> get copyWith =>
      __$$PromoCodeResultDtoImplCopyWithImpl<_$PromoCodeResultDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoCodeResultDtoImplToJson(this);
  }
}

abstract class _PromoCodeResultDto implements PromoCodeResultDto {
  const factory _PromoCodeResultDto({
    required final String promoCode,
    required final double discountAmount,
    required final double originalPrice,
    required final double finalPrice,
    final String? message,
  }) = _$PromoCodeResultDtoImpl;

  factory _PromoCodeResultDto.fromJson(Map<String, dynamic> json) =
      _$PromoCodeResultDtoImpl.fromJson;

  @override
  String get promoCode;
  @override
  double get discountAmount;
  @override
  double get originalPrice;
  @override
  double get finalPrice;
  @override
  String? get message;

  /// Create a copy of PromoCodeResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoCodeResultDtoImplCopyWith<_$PromoCodeResultDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
