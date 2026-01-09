// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscriptionPriceDto _$SubscriptionPriceDtoFromJson(Map<String, dynamic> json) {
  return _SubscriptionPriceDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionPriceDto {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionPriceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionPriceDtoCopyWith<SubscriptionPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPriceDtoCopyWith<$Res> {
  factory $SubscriptionPriceDtoCopyWith(
    SubscriptionPriceDto value,
    $Res Function(SubscriptionPriceDto) then,
  ) = _$SubscriptionPriceDtoCopyWithImpl<$Res, SubscriptionPriceDto>;
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class _$SubscriptionPriceDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionPriceDto
>
    implements $SubscriptionPriceDtoCopyWith<$Res> {
  _$SubscriptionPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionPriceDtoImplCopyWith<$Res>
    implements $SubscriptionPriceDtoCopyWith<$Res> {
  factory _$$SubscriptionPriceDtoImplCopyWith(
    _$SubscriptionPriceDtoImpl value,
    $Res Function(_$SubscriptionPriceDtoImpl) then,
  ) = __$$SubscriptionPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class __$$SubscriptionPriceDtoImplCopyWithImpl<$Res>
    extends _$SubscriptionPriceDtoCopyWithImpl<$Res, _$SubscriptionPriceDtoImpl>
    implements _$$SubscriptionPriceDtoImplCopyWith<$Res> {
  __$$SubscriptionPriceDtoImplCopyWithImpl(
    _$SubscriptionPriceDtoImpl _value,
    $Res Function(_$SubscriptionPriceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _$SubscriptionPriceDtoImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionPriceDtoImpl implements _SubscriptionPriceDto {
  const _$SubscriptionPriceDtoImpl({
    required this.amount,
    required this.currency,
  });

  factory _$SubscriptionPriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionPriceDtoImplFromJson(json);

  @override
  final double amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'SubscriptionPriceDto(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPriceDtoImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of SubscriptionPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPriceDtoImplCopyWith<_$SubscriptionPriceDtoImpl>
  get copyWith =>
      __$$SubscriptionPriceDtoImplCopyWithImpl<_$SubscriptionPriceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionPriceDtoImplToJson(this);
  }
}

abstract class _SubscriptionPriceDto implements SubscriptionPriceDto {
  const factory _SubscriptionPriceDto({
    required final double amount,
    required final String currency,
  }) = _$SubscriptionPriceDtoImpl;

  factory _SubscriptionPriceDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionPriceDtoImpl.fromJson;

  @override
  double get amount;
  @override
  String get currency;

  /// Create a copy of SubscriptionPriceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionPriceDtoImplCopyWith<_$SubscriptionPriceDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DiscountDto _$DiscountDtoFromJson(Map<String, dynamic> json) {
  return _DiscountDto.fromJson(json);
}

/// @nodoc
mixin _$DiscountDto {
  double get amount => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;

  /// Serializes this DiscountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountDtoCopyWith<DiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountDtoCopyWith<$Res> {
  factory $DiscountDtoCopyWith(
    DiscountDto value,
    $Res Function(DiscountDto) then,
  ) = _$DiscountDtoCopyWithImpl<$Res, DiscountDto>;
  @useResult
  $Res call({double amount, String? promoCode});
}

/// @nodoc
class _$DiscountDtoCopyWithImpl<$Res, $Val extends DiscountDto>
    implements $DiscountDtoCopyWith<$Res> {
  _$DiscountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? promoCode = freezed}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            promoCode: freezed == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiscountDtoImplCopyWith<$Res>
    implements $DiscountDtoCopyWith<$Res> {
  factory _$$DiscountDtoImplCopyWith(
    _$DiscountDtoImpl value,
    $Res Function(_$DiscountDtoImpl) then,
  ) = __$$DiscountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String? promoCode});
}

/// @nodoc
class __$$DiscountDtoImplCopyWithImpl<$Res>
    extends _$DiscountDtoCopyWithImpl<$Res, _$DiscountDtoImpl>
    implements _$$DiscountDtoImplCopyWith<$Res> {
  __$$DiscountDtoImplCopyWithImpl(
    _$DiscountDtoImpl _value,
    $Res Function(_$DiscountDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? promoCode = freezed}) {
    return _then(
      _$DiscountDtoImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountDtoImpl implements _DiscountDto {
  const _$DiscountDtoImpl({required this.amount, this.promoCode});

  factory _$DiscountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountDtoImplFromJson(json);

  @override
  final double amount;
  @override
  final String? promoCode;

  @override
  String toString() {
    return 'DiscountDto(amount: $amount, promoCode: $promoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountDtoImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, promoCode);

  /// Create a copy of DiscountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountDtoImplCopyWith<_$DiscountDtoImpl> get copyWith =>
      __$$DiscountDtoImplCopyWithImpl<_$DiscountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountDtoImplToJson(this);
  }
}

abstract class _DiscountDto implements DiscountDto {
  const factory _DiscountDto({
    required final double amount,
    final String? promoCode,
  }) = _$DiscountDtoImpl;

  factory _DiscountDto.fromJson(Map<String, dynamic> json) =
      _$DiscountDtoImpl.fromJson;

  @override
  double get amount;
  @override
  String? get promoCode;

  /// Create a copy of DiscountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountDtoImplCopyWith<_$DiscountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionResponseDto _$SubscriptionResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get authId => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get gymName => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  int get daysRemaining => throw _privateConstructorUsedError;
  SubscriptionPriceDto get price => throw _privateConstructorUsedError;
  DiscountDto? get discountApplied => throw _privateConstructorUsedError;
  String get confirmationNumber => throw _privateConstructorUsedError;
  int get accessCount => throw _privateConstructorUsedError;
  bool get isInGracePeriod => throw _privateConstructorUsedError;
  bool get canRenew => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get paymentMethodType => throw _privateConstructorUsedError;
  String? get pendingPaymentExpiresAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionResponseDtoCopyWith<SubscriptionResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionResponseDtoCopyWith<$Res> {
  factory $SubscriptionResponseDtoCopyWith(
    SubscriptionResponseDto value,
    $Res Function(SubscriptionResponseDto) then,
  ) = _$SubscriptionResponseDtoCopyWithImpl<$Res, SubscriptionResponseDto>;
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    String gymName,
    String planId,
    String planName,
    String status,
    String startDate,
    String endDate,
    int daysRemaining,
    SubscriptionPriceDto price,
    DiscountDto? discountApplied,
    String confirmationNumber,
    int accessCount,
    bool isInGracePeriod,
    bool canRenew,
    String createdAt,
    String updatedAt,
    String? paymentMethodType,
    String? pendingPaymentExpiresAt,
  });

  $SubscriptionPriceDtoCopyWith<$Res> get price;
  $DiscountDtoCopyWith<$Res>? get discountApplied;
}

/// @nodoc
class _$SubscriptionResponseDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionResponseDto
>
    implements $SubscriptionResponseDtoCopyWith<$Res> {
  _$SubscriptionResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? planId = null,
    Object? planName = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? daysRemaining = null,
    Object? price = null,
    Object? discountApplied = freezed,
    Object? confirmationNumber = null,
    Object? accessCount = null,
    Object? isInGracePeriod = null,
    Object? canRenew = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? paymentMethodType = freezed,
    Object? pendingPaymentExpiresAt = freezed,
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
            gymName: null == gymName
                ? _value.gymName
                : gymName // ignore: cast_nullable_to_non_nullable
                      as String,
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            planName: null == planName
                ? _value.planName
                : planName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            daysRemaining: null == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as SubscriptionPriceDto,
            discountApplied: freezed == discountApplied
                ? _value.discountApplied
                : discountApplied // ignore: cast_nullable_to_non_nullable
                      as DiscountDto?,
            confirmationNumber: null == confirmationNumber
                ? _value.confirmationNumber
                : confirmationNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            accessCount: null == accessCount
                ? _value.accessCount
                : accessCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isInGracePeriod: null == isInGracePeriod
                ? _value.isInGracePeriod
                : isInGracePeriod // ignore: cast_nullable_to_non_nullable
                      as bool,
            canRenew: null == canRenew
                ? _value.canRenew
                : canRenew // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMethodType: freezed == paymentMethodType
                ? _value.paymentMethodType
                : paymentMethodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            pendingPaymentExpiresAt: freezed == pendingPaymentExpiresAt
                ? _value.pendingPaymentExpiresAt
                : pendingPaymentExpiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionPriceDtoCopyWith<$Res> get price {
    return $SubscriptionPriceDtoCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscountDtoCopyWith<$Res>? get discountApplied {
    if (_value.discountApplied == null) {
      return null;
    }

    return $DiscountDtoCopyWith<$Res>(_value.discountApplied!, (value) {
      return _then(_value.copyWith(discountApplied: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionResponseDtoImplCopyWith<$Res>
    implements $SubscriptionResponseDtoCopyWith<$Res> {
  factory _$$SubscriptionResponseDtoImplCopyWith(
    _$SubscriptionResponseDtoImpl value,
    $Res Function(_$SubscriptionResponseDtoImpl) then,
  ) = __$$SubscriptionResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    String gymName,
    String planId,
    String planName,
    String status,
    String startDate,
    String endDate,
    int daysRemaining,
    SubscriptionPriceDto price,
    DiscountDto? discountApplied,
    String confirmationNumber,
    int accessCount,
    bool isInGracePeriod,
    bool canRenew,
    String createdAt,
    String updatedAt,
    String? paymentMethodType,
    String? pendingPaymentExpiresAt,
  });

  @override
  $SubscriptionPriceDtoCopyWith<$Res> get price;
  @override
  $DiscountDtoCopyWith<$Res>? get discountApplied;
}

/// @nodoc
class __$$SubscriptionResponseDtoImplCopyWithImpl<$Res>
    extends
        _$SubscriptionResponseDtoCopyWithImpl<
          $Res,
          _$SubscriptionResponseDtoImpl
        >
    implements _$$SubscriptionResponseDtoImplCopyWith<$Res> {
  __$$SubscriptionResponseDtoImplCopyWithImpl(
    _$SubscriptionResponseDtoImpl _value,
    $Res Function(_$SubscriptionResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authId = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? planId = null,
    Object? planName = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? daysRemaining = null,
    Object? price = null,
    Object? discountApplied = freezed,
    Object? confirmationNumber = null,
    Object? accessCount = null,
    Object? isInGracePeriod = null,
    Object? canRenew = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? paymentMethodType = freezed,
    Object? pendingPaymentExpiresAt = freezed,
  }) {
    return _then(
      _$SubscriptionResponseDtoImpl(
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
        gymName: null == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String,
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        planName: null == planName
            ? _value.planName
            : planName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        daysRemaining: null == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as SubscriptionPriceDto,
        discountApplied: freezed == discountApplied
            ? _value.discountApplied
            : discountApplied // ignore: cast_nullable_to_non_nullable
                  as DiscountDto?,
        confirmationNumber: null == confirmationNumber
            ? _value.confirmationNumber
            : confirmationNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        accessCount: null == accessCount
            ? _value.accessCount
            : accessCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isInGracePeriod: null == isInGracePeriod
            ? _value.isInGracePeriod
            : isInGracePeriod // ignore: cast_nullable_to_non_nullable
                  as bool,
        canRenew: null == canRenew
            ? _value.canRenew
            : canRenew // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethodType: freezed == paymentMethodType
            ? _value.paymentMethodType
            : paymentMethodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingPaymentExpiresAt: freezed == pendingPaymentExpiresAt
            ? _value.pendingPaymentExpiresAt
            : pendingPaymentExpiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionResponseDtoImpl implements _SubscriptionResponseDto {
  const _$SubscriptionResponseDtoImpl({
    required this.id,
    required this.authId,
    required this.gymId,
    required this.gymName,
    required this.planId,
    required this.planName,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.daysRemaining,
    required this.price,
    this.discountApplied,
    required this.confirmationNumber,
    required this.accessCount,
    required this.isInGracePeriod,
    required this.canRenew,
    required this.createdAt,
    required this.updatedAt,
    this.paymentMethodType,
    this.pendingPaymentExpiresAt,
  });

  factory _$SubscriptionResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String authId;
  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final String planId;
  @override
  final String planName;
  @override
  final String status;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final int daysRemaining;
  @override
  final SubscriptionPriceDto price;
  @override
  final DiscountDto? discountApplied;
  @override
  final String confirmationNumber;
  @override
  final int accessCount;
  @override
  final bool isInGracePeriod;
  @override
  final bool canRenew;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? paymentMethodType;
  @override
  final String? pendingPaymentExpiresAt;

  @override
  String toString() {
    return 'SubscriptionResponseDto(id: $id, authId: $authId, gymId: $gymId, gymName: $gymName, planId: $planId, planName: $planName, status: $status, startDate: $startDate, endDate: $endDate, daysRemaining: $daysRemaining, price: $price, discountApplied: $discountApplied, confirmationNumber: $confirmationNumber, accessCount: $accessCount, isInGracePeriod: $isInGracePeriod, canRenew: $canRenew, createdAt: $createdAt, updatedAt: $updatedAt, paymentMethodType: $paymentMethodType, pendingPaymentExpiresAt: $pendingPaymentExpiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountApplied, discountApplied) ||
                other.discountApplied == discountApplied) &&
            (identical(other.confirmationNumber, confirmationNumber) ||
                other.confirmationNumber == confirmationNumber) &&
            (identical(other.accessCount, accessCount) ||
                other.accessCount == accessCount) &&
            (identical(other.isInGracePeriod, isInGracePeriod) ||
                other.isInGracePeriod == isInGracePeriod) &&
            (identical(other.canRenew, canRenew) ||
                other.canRenew == canRenew) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType) &&
            (identical(
                  other.pendingPaymentExpiresAt,
                  pendingPaymentExpiresAt,
                ) ||
                other.pendingPaymentExpiresAt == pendingPaymentExpiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    authId,
    gymId,
    gymName,
    planId,
    planName,
    status,
    startDate,
    endDate,
    daysRemaining,
    price,
    discountApplied,
    confirmationNumber,
    accessCount,
    isInGracePeriod,
    canRenew,
    createdAt,
    updatedAt,
    paymentMethodType,
    pendingPaymentExpiresAt,
  ]);

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionResponseDtoImplCopyWith<_$SubscriptionResponseDtoImpl>
  get copyWith =>
      __$$SubscriptionResponseDtoImplCopyWithImpl<
        _$SubscriptionResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionResponseDtoImplToJson(this);
  }
}

abstract class _SubscriptionResponseDto implements SubscriptionResponseDto {
  const factory _SubscriptionResponseDto({
    required final String id,
    required final String authId,
    required final String gymId,
    required final String gymName,
    required final String planId,
    required final String planName,
    required final String status,
    required final String startDate,
    required final String endDate,
    required final int daysRemaining,
    required final SubscriptionPriceDto price,
    final DiscountDto? discountApplied,
    required final String confirmationNumber,
    required final int accessCount,
    required final bool isInGracePeriod,
    required final bool canRenew,
    required final String createdAt,
    required final String updatedAt,
    final String? paymentMethodType,
    final String? pendingPaymentExpiresAt,
  }) = _$SubscriptionResponseDtoImpl;

  factory _SubscriptionResponseDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get authId;
  @override
  String get gymId;
  @override
  String get gymName;
  @override
  String get planId;
  @override
  String get planName;
  @override
  String get status;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  int get daysRemaining;
  @override
  SubscriptionPriceDto get price;
  @override
  DiscountDto? get discountApplied;
  @override
  String get confirmationNumber;
  @override
  int get accessCount;
  @override
  bool get isInGracePeriod;
  @override
  bool get canRenew;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get paymentMethodType;
  @override
  String? get pendingPaymentExpiresAt;

  /// Create a copy of SubscriptionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionResponseDtoImplCopyWith<_$SubscriptionResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionListResponseDto _$SubscriptionListResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionListResponseDto {
  List<SubscriptionResponseDto> get subscriptions =>
      throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionListResponseDtoCopyWith<SubscriptionListResponseDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionListResponseDtoCopyWith<$Res> {
  factory $SubscriptionListResponseDtoCopyWith(
    SubscriptionListResponseDto value,
    $Res Function(SubscriptionListResponseDto) then,
  ) =
      _$SubscriptionListResponseDtoCopyWithImpl<
        $Res,
        SubscriptionListResponseDto
      >;
  @useResult
  $Res call({List<SubscriptionResponseDto> subscriptions, int totalCount});
}

/// @nodoc
class _$SubscriptionListResponseDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionListResponseDto
>
    implements $SubscriptionListResponseDtoCopyWith<$Res> {
  _$SubscriptionListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscriptions = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            subscriptions: null == subscriptions
                ? _value.subscriptions
                : subscriptions // ignore: cast_nullable_to_non_nullable
                      as List<SubscriptionResponseDto>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionListResponseDtoImplCopyWith<$Res>
    implements $SubscriptionListResponseDtoCopyWith<$Res> {
  factory _$$SubscriptionListResponseDtoImplCopyWith(
    _$SubscriptionListResponseDtoImpl value,
    $Res Function(_$SubscriptionListResponseDtoImpl) then,
  ) = __$$SubscriptionListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SubscriptionResponseDto> subscriptions, int totalCount});
}

/// @nodoc
class __$$SubscriptionListResponseDtoImplCopyWithImpl<$Res>
    extends
        _$SubscriptionListResponseDtoCopyWithImpl<
          $Res,
          _$SubscriptionListResponseDtoImpl
        >
    implements _$$SubscriptionListResponseDtoImplCopyWith<$Res> {
  __$$SubscriptionListResponseDtoImplCopyWithImpl(
    _$SubscriptionListResponseDtoImpl _value,
    $Res Function(_$SubscriptionListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscriptions = null, Object? totalCount = null}) {
    return _then(
      _$SubscriptionListResponseDtoImpl(
        subscriptions: null == subscriptions
            ? _value._subscriptions
            : subscriptions // ignore: cast_nullable_to_non_nullable
                  as List<SubscriptionResponseDto>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionListResponseDtoImpl
    implements _SubscriptionListResponseDto {
  const _$SubscriptionListResponseDtoImpl({
    required final List<SubscriptionResponseDto> subscriptions,
    required this.totalCount,
  }) : _subscriptions = subscriptions;

  factory _$SubscriptionListResponseDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SubscriptionListResponseDtoImplFromJson(json);

  final List<SubscriptionResponseDto> _subscriptions;
  @override
  List<SubscriptionResponseDto> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'SubscriptionListResponseDto(subscriptions: $subscriptions, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionListResponseDtoImpl &&
            const DeepCollectionEquality().equals(
              other._subscriptions,
              _subscriptions,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_subscriptions),
    totalCount,
  );

  /// Create a copy of SubscriptionListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionListResponseDtoImplCopyWith<_$SubscriptionListResponseDtoImpl>
  get copyWith =>
      __$$SubscriptionListResponseDtoImplCopyWithImpl<
        _$SubscriptionListResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionListResponseDtoImplToJson(this);
  }
}

abstract class _SubscriptionListResponseDto
    implements SubscriptionListResponseDto {
  const factory _SubscriptionListResponseDto({
    required final List<SubscriptionResponseDto> subscriptions,
    required final int totalCount,
  }) = _$SubscriptionListResponseDtoImpl;

  factory _SubscriptionListResponseDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionListResponseDtoImpl.fromJson;

  @override
  List<SubscriptionResponseDto> get subscriptions;
  @override
  int get totalCount;

  /// Create a copy of SubscriptionListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionListResponseDtoImplCopyWith<_$SubscriptionListResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionResultDto _$SubscriptionResultDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionResultDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionResultDto {
  SubscriptionResponseDto get subscription =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionResultDtoCopyWith<SubscriptionResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionResultDtoCopyWith<$Res> {
  factory $SubscriptionResultDtoCopyWith(
    SubscriptionResultDto value,
    $Res Function(SubscriptionResultDto) then,
  ) = _$SubscriptionResultDtoCopyWithImpl<$Res, SubscriptionResultDto>;
  @useResult
  $Res call({SubscriptionResponseDto subscription, String? message});

  $SubscriptionResponseDtoCopyWith<$Res> get subscription;
}

/// @nodoc
class _$SubscriptionResultDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionResultDto
>
    implements $SubscriptionResultDtoCopyWith<$Res> {
  _$SubscriptionResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscription = null, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            subscription: null == subscription
                ? _value.subscription
                : subscription // ignore: cast_nullable_to_non_nullable
                      as SubscriptionResponseDto,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionResponseDtoCopyWith<$Res> get subscription {
    return $SubscriptionResponseDtoCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionResultDtoImplCopyWith<$Res>
    implements $SubscriptionResultDtoCopyWith<$Res> {
  factory _$$SubscriptionResultDtoImplCopyWith(
    _$SubscriptionResultDtoImpl value,
    $Res Function(_$SubscriptionResultDtoImpl) then,
  ) = __$$SubscriptionResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubscriptionResponseDto subscription, String? message});

  @override
  $SubscriptionResponseDtoCopyWith<$Res> get subscription;
}

/// @nodoc
class __$$SubscriptionResultDtoImplCopyWithImpl<$Res>
    extends
        _$SubscriptionResultDtoCopyWithImpl<$Res, _$SubscriptionResultDtoImpl>
    implements _$$SubscriptionResultDtoImplCopyWith<$Res> {
  __$$SubscriptionResultDtoImplCopyWithImpl(
    _$SubscriptionResultDtoImpl _value,
    $Res Function(_$SubscriptionResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscription = null, Object? message = freezed}) {
    return _then(
      _$SubscriptionResultDtoImpl(
        subscription: null == subscription
            ? _value.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as SubscriptionResponseDto,
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
class _$SubscriptionResultDtoImpl implements _SubscriptionResultDto {
  const _$SubscriptionResultDtoImpl({required this.subscription, this.message});

  factory _$SubscriptionResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionResultDtoImplFromJson(json);

  @override
  final SubscriptionResponseDto subscription;
  @override
  final String? message;

  @override
  String toString() {
    return 'SubscriptionResultDto(subscription: $subscription, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionResultDtoImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subscription, message);

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionResultDtoImplCopyWith<_$SubscriptionResultDtoImpl>
  get copyWith =>
      __$$SubscriptionResultDtoImplCopyWithImpl<_$SubscriptionResultDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionResultDtoImplToJson(this);
  }
}

abstract class _SubscriptionResultDto implements SubscriptionResultDto {
  const factory _SubscriptionResultDto({
    required final SubscriptionResponseDto subscription,
    final String? message,
  }) = _$SubscriptionResultDtoImpl;

  factory _SubscriptionResultDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionResultDtoImpl.fromJson;

  @override
  SubscriptionResponseDto get subscription;
  @override
  String? get message;

  /// Create a copy of SubscriptionResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionResultDtoImplCopyWith<_$SubscriptionResultDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
