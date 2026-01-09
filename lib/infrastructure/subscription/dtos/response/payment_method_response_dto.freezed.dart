// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaymentMethodResponseDto _$PaymentMethodResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _PaymentMethodResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // Flattened card fields (from backend)
  String? get last4 => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_month')
  int? get expMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_year')
  int? get expYear => throw _privateConstructorUsedError;
  bool? get isDefault =>
      throw _privateConstructorUsedError; // Legacy nested card object (for Stripe direct responses)
  PaymentMethodCardDto? get card => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String? get customerId => throw _privateConstructorUsedError;
  int? get created => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodResponseDtoCopyWith<PaymentMethodResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodResponseDtoCopyWith<$Res> {
  factory $PaymentMethodResponseDtoCopyWith(
    PaymentMethodResponseDto value,
    $Res Function(PaymentMethodResponseDto) then,
  ) = _$PaymentMethodResponseDtoCopyWithImpl<$Res, PaymentMethodResponseDto>;
  @useResult
  $Res call({
    String id,
    String type,
    String? last4,
    String? brand,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    bool? isDefault,
    PaymentMethodCardDto? card,
    @JsonKey(name: 'customer_id') String? customerId,
    int? created,
  });

  $PaymentMethodCardDtoCopyWith<$Res>? get card;
}

/// @nodoc
class _$PaymentMethodResponseDtoCopyWithImpl<
  $Res,
  $Val extends PaymentMethodResponseDto
>
    implements $PaymentMethodResponseDtoCopyWith<$Res> {
  _$PaymentMethodResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? last4 = freezed,
    Object? brand = freezed,
    Object? expMonth = freezed,
    Object? expYear = freezed,
    Object? isDefault = freezed,
    Object? card = freezed,
    Object? customerId = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            last4: freezed == last4
                ? _value.last4
                : last4 // ignore: cast_nullable_to_non_nullable
                      as String?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            expMonth: freezed == expMonth
                ? _value.expMonth
                : expMonth // ignore: cast_nullable_to_non_nullable
                      as int?,
            expYear: freezed == expYear
                ? _value.expYear
                : expYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDefault: freezed == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool?,
            card: freezed == card
                ? _value.card
                : card // ignore: cast_nullable_to_non_nullable
                      as PaymentMethodCardDto?,
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            created: freezed == created
                ? _value.created
                : created // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCardDtoCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $PaymentMethodCardDtoCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodResponseDtoImplCopyWith<$Res>
    implements $PaymentMethodResponseDtoCopyWith<$Res> {
  factory _$$PaymentMethodResponseDtoImplCopyWith(
    _$PaymentMethodResponseDtoImpl value,
    $Res Function(_$PaymentMethodResponseDtoImpl) then,
  ) = __$$PaymentMethodResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String? last4,
    String? brand,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    bool? isDefault,
    PaymentMethodCardDto? card,
    @JsonKey(name: 'customer_id') String? customerId,
    int? created,
  });

  @override
  $PaymentMethodCardDtoCopyWith<$Res>? get card;
}

/// @nodoc
class __$$PaymentMethodResponseDtoImplCopyWithImpl<$Res>
    extends
        _$PaymentMethodResponseDtoCopyWithImpl<
          $Res,
          _$PaymentMethodResponseDtoImpl
        >
    implements _$$PaymentMethodResponseDtoImplCopyWith<$Res> {
  __$$PaymentMethodResponseDtoImplCopyWithImpl(
    _$PaymentMethodResponseDtoImpl _value,
    $Res Function(_$PaymentMethodResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? last4 = freezed,
    Object? brand = freezed,
    Object? expMonth = freezed,
    Object? expYear = freezed,
    Object? isDefault = freezed,
    Object? card = freezed,
    Object? customerId = freezed,
    Object? created = freezed,
  }) {
    return _then(
      _$PaymentMethodResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        last4: freezed == last4
            ? _value.last4
            : last4 // ignore: cast_nullable_to_non_nullable
                  as String?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        expMonth: freezed == expMonth
            ? _value.expMonth
            : expMonth // ignore: cast_nullable_to_non_nullable
                  as int?,
        expYear: freezed == expYear
            ? _value.expYear
            : expYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDefault: freezed == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool?,
        card: freezed == card
            ? _value.card
            : card // ignore: cast_nullable_to_non_nullable
                  as PaymentMethodCardDto?,
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        created: freezed == created
            ? _value.created
            : created // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodResponseDtoImpl implements _PaymentMethodResponseDto {
  const _$PaymentMethodResponseDtoImpl({
    required this.id,
    required this.type,
    this.last4,
    this.brand,
    @JsonKey(name: 'exp_month') this.expMonth,
    @JsonKey(name: 'exp_year') this.expYear,
    this.isDefault,
    this.card,
    @JsonKey(name: 'customer_id') this.customerId,
    this.created,
  });

  factory _$PaymentMethodResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  // Flattened card fields (from backend)
  @override
  final String? last4;
  @override
  final String? brand;
  @override
  @JsonKey(name: 'exp_month')
  final int? expMonth;
  @override
  @JsonKey(name: 'exp_year')
  final int? expYear;
  @override
  final bool? isDefault;
  // Legacy nested card object (for Stripe direct responses)
  @override
  final PaymentMethodCardDto? card;
  @override
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @override
  final int? created;

  @override
  String toString() {
    return 'PaymentMethodResponseDto(id: $id, type: $type, last4: $last4, brand: $brand, expMonth: $expMonth, expYear: $expYear, isDefault: $isDefault, card: $card, customerId: $customerId, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    last4,
    brand,
    expMonth,
    expYear,
    isDefault,
    card,
    customerId,
    created,
  );

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodResponseDtoImplCopyWith<_$PaymentMethodResponseDtoImpl>
  get copyWith =>
      __$$PaymentMethodResponseDtoImplCopyWithImpl<
        _$PaymentMethodResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodResponseDtoImplToJson(this);
  }
}

abstract class _PaymentMethodResponseDto implements PaymentMethodResponseDto {
  const factory _PaymentMethodResponseDto({
    required final String id,
    required final String type,
    final String? last4,
    final String? brand,
    @JsonKey(name: 'exp_month') final int? expMonth,
    @JsonKey(name: 'exp_year') final int? expYear,
    final bool? isDefault,
    final PaymentMethodCardDto? card,
    @JsonKey(name: 'customer_id') final String? customerId,
    final int? created,
  }) = _$PaymentMethodResponseDtoImpl;

  factory _PaymentMethodResponseDto.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get type; // Flattened card fields (from backend)
  @override
  String? get last4;
  @override
  String? get brand;
  @override
  @JsonKey(name: 'exp_month')
  int? get expMonth;
  @override
  @JsonKey(name: 'exp_year')
  int? get expYear;
  @override
  bool? get isDefault; // Legacy nested card object (for Stripe direct responses)
  @override
  PaymentMethodCardDto? get card;
  @override
  @JsonKey(name: 'customer_id')
  String? get customerId;
  @override
  int? get created;

  /// Create a copy of PaymentMethodResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodResponseDtoImplCopyWith<_$PaymentMethodResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentMethodCardDto _$PaymentMethodCardDtoFromJson(Map<String, dynamic> json) {
  return _PaymentMethodCardDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodCardDto {
  String get brand => throw _privateConstructorUsedError;
  String get last4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_month')
  int? get expMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_year')
  int? get expYear => throw _privateConstructorUsedError;
  String? get funding => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodCardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCardDtoCopyWith<PaymentMethodCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCardDtoCopyWith<$Res> {
  factory $PaymentMethodCardDtoCopyWith(
    PaymentMethodCardDto value,
    $Res Function(PaymentMethodCardDto) then,
  ) = _$PaymentMethodCardDtoCopyWithImpl<$Res, PaymentMethodCardDto>;
  @useResult
  $Res call({
    String brand,
    String last4,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    String? funding,
    String? country,
  });
}

/// @nodoc
class _$PaymentMethodCardDtoCopyWithImpl<
  $Res,
  $Val extends PaymentMethodCardDto
>
    implements $PaymentMethodCardDtoCopyWith<$Res> {
  _$PaymentMethodCardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = freezed,
    Object? expYear = freezed,
    Object? funding = freezed,
    Object? country = freezed,
  }) {
    return _then(
      _value.copyWith(
            brand: null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String,
            last4: null == last4
                ? _value.last4
                : last4 // ignore: cast_nullable_to_non_nullable
                      as String,
            expMonth: freezed == expMonth
                ? _value.expMonth
                : expMonth // ignore: cast_nullable_to_non_nullable
                      as int?,
            expYear: freezed == expYear
                ? _value.expYear
                : expYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            funding: freezed == funding
                ? _value.funding
                : funding // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodCardDtoImplCopyWith<$Res>
    implements $PaymentMethodCardDtoCopyWith<$Res> {
  factory _$$PaymentMethodCardDtoImplCopyWith(
    _$PaymentMethodCardDtoImpl value,
    $Res Function(_$PaymentMethodCardDtoImpl) then,
  ) = __$$PaymentMethodCardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String brand,
    String last4,
    @JsonKey(name: 'exp_month') int? expMonth,
    @JsonKey(name: 'exp_year') int? expYear,
    String? funding,
    String? country,
  });
}

/// @nodoc
class __$$PaymentMethodCardDtoImplCopyWithImpl<$Res>
    extends _$PaymentMethodCardDtoCopyWithImpl<$Res, _$PaymentMethodCardDtoImpl>
    implements _$$PaymentMethodCardDtoImplCopyWith<$Res> {
  __$$PaymentMethodCardDtoImplCopyWithImpl(
    _$PaymentMethodCardDtoImpl _value,
    $Res Function(_$PaymentMethodCardDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = freezed,
    Object? expYear = freezed,
    Object? funding = freezed,
    Object? country = freezed,
  }) {
    return _then(
      _$PaymentMethodCardDtoImpl(
        brand: null == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String,
        last4: null == last4
            ? _value.last4
            : last4 // ignore: cast_nullable_to_non_nullable
                  as String,
        expMonth: freezed == expMonth
            ? _value.expMonth
            : expMonth // ignore: cast_nullable_to_non_nullable
                  as int?,
        expYear: freezed == expYear
            ? _value.expYear
            : expYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        funding: freezed == funding
            ? _value.funding
            : funding // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodCardDtoImpl implements _PaymentMethodCardDto {
  const _$PaymentMethodCardDtoImpl({
    required this.brand,
    required this.last4,
    @JsonKey(name: 'exp_month') this.expMonth,
    @JsonKey(name: 'exp_year') this.expYear,
    this.funding,
    this.country,
  });

  factory _$PaymentMethodCardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodCardDtoImplFromJson(json);

  @override
  final String brand;
  @override
  final String last4;
  @override
  @JsonKey(name: 'exp_month')
  final int? expMonth;
  @override
  @JsonKey(name: 'exp_year')
  final int? expYear;
  @override
  final String? funding;
  @override
  final String? country;

  @override
  String toString() {
    return 'PaymentMethodCardDto(brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, funding: $funding, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodCardDtoImpl &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.funding, funding) || other.funding == funding) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    brand,
    last4,
    expMonth,
    expYear,
    funding,
    country,
  );

  /// Create a copy of PaymentMethodCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodCardDtoImplCopyWith<_$PaymentMethodCardDtoImpl>
  get copyWith =>
      __$$PaymentMethodCardDtoImplCopyWithImpl<_$PaymentMethodCardDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodCardDtoImplToJson(this);
  }
}

abstract class _PaymentMethodCardDto implements PaymentMethodCardDto {
  const factory _PaymentMethodCardDto({
    required final String brand,
    required final String last4,
    @JsonKey(name: 'exp_month') final int? expMonth,
    @JsonKey(name: 'exp_year') final int? expYear,
    final String? funding,
    final String? country,
  }) = _$PaymentMethodCardDtoImpl;

  factory _PaymentMethodCardDto.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodCardDtoImpl.fromJson;

  @override
  String get brand;
  @override
  String get last4;
  @override
  @JsonKey(name: 'exp_month')
  int? get expMonth;
  @override
  @JsonKey(name: 'exp_year')
  int? get expYear;
  @override
  String? get funding;
  @override
  String? get country;

  /// Create a copy of PaymentMethodCardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodCardDtoImplCopyWith<_$PaymentMethodCardDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentMethodListDto _$PaymentMethodListDtoFromJson(Map<String, dynamic> json) {
  return _PaymentMethodListDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodListDto {
  List<PaymentMethodResponseDto> get methods =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodListDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodListDtoCopyWith<PaymentMethodListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodListDtoCopyWith<$Res> {
  factory $PaymentMethodListDtoCopyWith(
    PaymentMethodListDto value,
    $Res Function(PaymentMethodListDto) then,
  ) = _$PaymentMethodListDtoCopyWithImpl<$Res, PaymentMethodListDto>;
  @useResult
  $Res call({List<PaymentMethodResponseDto> methods});
}

/// @nodoc
class _$PaymentMethodListDtoCopyWithImpl<
  $Res,
  $Val extends PaymentMethodListDto
>
    implements $PaymentMethodListDtoCopyWith<$Res> {
  _$PaymentMethodListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null}) {
    return _then(
      _value.copyWith(
            methods: null == methods
                ? _value.methods
                : methods // ignore: cast_nullable_to_non_nullable
                      as List<PaymentMethodResponseDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodListDtoImplCopyWith<$Res>
    implements $PaymentMethodListDtoCopyWith<$Res> {
  factory _$$PaymentMethodListDtoImplCopyWith(
    _$PaymentMethodListDtoImpl value,
    $Res Function(_$PaymentMethodListDtoImpl) then,
  ) = __$$PaymentMethodListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaymentMethodResponseDto> methods});
}

/// @nodoc
class __$$PaymentMethodListDtoImplCopyWithImpl<$Res>
    extends _$PaymentMethodListDtoCopyWithImpl<$Res, _$PaymentMethodListDtoImpl>
    implements _$$PaymentMethodListDtoImplCopyWith<$Res> {
  __$$PaymentMethodListDtoImplCopyWithImpl(
    _$PaymentMethodListDtoImpl _value,
    $Res Function(_$PaymentMethodListDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? methods = null}) {
    return _then(
      _$PaymentMethodListDtoImpl(
        methods: null == methods
            ? _value._methods
            : methods // ignore: cast_nullable_to_non_nullable
                  as List<PaymentMethodResponseDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodListDtoImpl implements _PaymentMethodListDto {
  const _$PaymentMethodListDtoImpl({
    required final List<PaymentMethodResponseDto> methods,
  }) : _methods = methods;

  factory _$PaymentMethodListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodListDtoImplFromJson(json);

  final List<PaymentMethodResponseDto> _methods;
  @override
  List<PaymentMethodResponseDto> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  @override
  String toString() {
    return 'PaymentMethodListDto(methods: $methods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodListDtoImpl &&
            const DeepCollectionEquality().equals(other._methods, _methods));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_methods));

  /// Create a copy of PaymentMethodListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodListDtoImplCopyWith<_$PaymentMethodListDtoImpl>
  get copyWith =>
      __$$PaymentMethodListDtoImplCopyWithImpl<_$PaymentMethodListDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodListDtoImplToJson(this);
  }
}

abstract class _PaymentMethodListDto implements PaymentMethodListDto {
  const factory _PaymentMethodListDto({
    required final List<PaymentMethodResponseDto> methods,
  }) = _$PaymentMethodListDtoImpl;

  factory _PaymentMethodListDto.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodListDtoImpl.fromJson;

  @override
  List<PaymentMethodResponseDto> get methods;

  /// Create a copy of PaymentMethodListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodListDtoImplCopyWith<_$PaymentMethodListDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SetupIntentDto _$SetupIntentDtoFromJson(Map<String, dynamic> json) {
  return _SetupIntentDto.fromJson(json);
}

/// @nodoc
mixin _$SetupIntentDto {
  String get clientSecret => throw _privateConstructorUsedError;

  /// Serializes this SetupIntentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetupIntentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetupIntentDtoCopyWith<SetupIntentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupIntentDtoCopyWith<$Res> {
  factory $SetupIntentDtoCopyWith(
    SetupIntentDto value,
    $Res Function(SetupIntentDto) then,
  ) = _$SetupIntentDtoCopyWithImpl<$Res, SetupIntentDto>;
  @useResult
  $Res call({String clientSecret});
}

/// @nodoc
class _$SetupIntentDtoCopyWithImpl<$Res, $Val extends SetupIntentDto>
    implements $SetupIntentDtoCopyWith<$Res> {
  _$SetupIntentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetupIntentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clientSecret = null}) {
    return _then(
      _value.copyWith(
            clientSecret: null == clientSecret
                ? _value.clientSecret
                : clientSecret // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SetupIntentDtoImplCopyWith<$Res>
    implements $SetupIntentDtoCopyWith<$Res> {
  factory _$$SetupIntentDtoImplCopyWith(
    _$SetupIntentDtoImpl value,
    $Res Function(_$SetupIntentDtoImpl) then,
  ) = __$$SetupIntentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clientSecret});
}

/// @nodoc
class __$$SetupIntentDtoImplCopyWithImpl<$Res>
    extends _$SetupIntentDtoCopyWithImpl<$Res, _$SetupIntentDtoImpl>
    implements _$$SetupIntentDtoImplCopyWith<$Res> {
  __$$SetupIntentDtoImplCopyWithImpl(
    _$SetupIntentDtoImpl _value,
    $Res Function(_$SetupIntentDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetupIntentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? clientSecret = null}) {
    return _then(
      _$SetupIntentDtoImpl(
        clientSecret: null == clientSecret
            ? _value.clientSecret
            : clientSecret // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SetupIntentDtoImpl implements _SetupIntentDto {
  const _$SetupIntentDtoImpl({required this.clientSecret});

  factory _$SetupIntentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetupIntentDtoImplFromJson(json);

  @override
  final String clientSecret;

  @override
  String toString() {
    return 'SetupIntentDto(clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupIntentDtoImpl &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientSecret);

  /// Create a copy of SetupIntentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupIntentDtoImplCopyWith<_$SetupIntentDtoImpl> get copyWith =>
      __$$SetupIntentDtoImplCopyWithImpl<_$SetupIntentDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SetupIntentDtoImplToJson(this);
  }
}

abstract class _SetupIntentDto implements SetupIntentDto {
  const factory _SetupIntentDto({required final String clientSecret}) =
      _$SetupIntentDtoImpl;

  factory _SetupIntentDto.fromJson(Map<String, dynamic> json) =
      _$SetupIntentDtoImpl.fromJson;

  @override
  String get clientSecret;

  /// Create a copy of SetupIntentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetupIntentDtoImplCopyWith<_$SetupIntentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
