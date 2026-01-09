// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Subscription {
  String get id => throw _privateConstructorUsedError;
  String get authId => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get gymName => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get daysRemaining => throw _privateConstructorUsedError;
  SubscriptionPrice get price => throw _privateConstructorUsedError;
  SubscriptionDiscount? get discountApplied =>
      throw _privateConstructorUsedError;
  String get confirmationNumber => throw _privateConstructorUsedError;
  int get accessCount => throw _privateConstructorUsedError;
  bool get isInGracePeriod => throw _privateConstructorUsedError;
  bool get canRenew => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get paymentMethodType => throw _privateConstructorUsedError;
  DateTime? get pendingPaymentExpiresAt => throw _privateConstructorUsedError;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
    Subscription value,
    $Res Function(Subscription) then,
  ) = _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    String gymName,
    String planId,
    String planName,
    SubscriptionStatus status,
    DateTime startDate,
    DateTime endDate,
    int daysRemaining,
    SubscriptionPrice price,
    SubscriptionDiscount? discountApplied,
    String confirmationNumber,
    int accessCount,
    bool isInGracePeriod,
    bool canRenew,
    DateTime createdAt,
    DateTime updatedAt,
    String? paymentMethodType,
    DateTime? pendingPaymentExpiresAt,
  });

  $SubscriptionPriceCopyWith<$Res> get price;
  $SubscriptionDiscountCopyWith<$Res>? get discountApplied;
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subscription
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
                      as SubscriptionStatus,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            daysRemaining: null == daysRemaining
                ? _value.daysRemaining
                : daysRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as SubscriptionPrice,
            discountApplied: freezed == discountApplied
                ? _value.discountApplied
                : discountApplied // ignore: cast_nullable_to_non_nullable
                      as SubscriptionDiscount?,
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
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            paymentMethodType: freezed == paymentMethodType
                ? _value.paymentMethodType
                : paymentMethodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            pendingPaymentExpiresAt: freezed == pendingPaymentExpiresAt
                ? _value.pendingPaymentExpiresAt
                : pendingPaymentExpiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionPriceCopyWith<$Res> get price {
    return $SubscriptionPriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionDiscountCopyWith<$Res>? get discountApplied {
    if (_value.discountApplied == null) {
      return null;
    }

    return $SubscriptionDiscountCopyWith<$Res>(_value.discountApplied!, (
      value,
    ) {
      return _then(_value.copyWith(discountApplied: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
    _$SubscriptionImpl value,
    $Res Function(_$SubscriptionImpl) then,
  ) = __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authId,
    String gymId,
    String gymName,
    String planId,
    String planName,
    SubscriptionStatus status,
    DateTime startDate,
    DateTime endDate,
    int daysRemaining,
    SubscriptionPrice price,
    SubscriptionDiscount? discountApplied,
    String confirmationNumber,
    int accessCount,
    bool isInGracePeriod,
    bool canRenew,
    DateTime createdAt,
    DateTime updatedAt,
    String? paymentMethodType,
    DateTime? pendingPaymentExpiresAt,
  });

  @override
  $SubscriptionPriceCopyWith<$Res> get price;
  @override
  $SubscriptionDiscountCopyWith<$Res>? get discountApplied;
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
    _$SubscriptionImpl _value,
    $Res Function(_$SubscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subscription
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
      _$SubscriptionImpl(
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
                  as SubscriptionStatus,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        daysRemaining: null == daysRemaining
            ? _value.daysRemaining
            : daysRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as SubscriptionPrice,
        discountApplied: freezed == discountApplied
            ? _value.discountApplied
            : discountApplied // ignore: cast_nullable_to_non_nullable
                  as SubscriptionDiscount?,
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
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        paymentMethodType: freezed == paymentMethodType
            ? _value.paymentMethodType
            : paymentMethodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingPaymentExpiresAt: freezed == pendingPaymentExpiresAt
            ? _value.pendingPaymentExpiresAt
            : pendingPaymentExpiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$SubscriptionImpl extends _Subscription {
  const _$SubscriptionImpl({
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
  }) : super._();

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
  final SubscriptionStatus status;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int daysRemaining;
  @override
  final SubscriptionPrice price;
  @override
  final SubscriptionDiscount? discountApplied;
  @override
  final String confirmationNumber;
  @override
  final int accessCount;
  @override
  final bool isInGracePeriod;
  @override
  final bool canRenew;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? paymentMethodType;
  @override
  final DateTime? pendingPaymentExpiresAt;

  @override
  String toString() {
    return 'Subscription(id: $id, authId: $authId, gymId: $gymId, gymName: $gymName, planId: $planId, planName: $planName, status: $status, startDate: $startDate, endDate: $endDate, daysRemaining: $daysRemaining, price: $price, discountApplied: $discountApplied, confirmationNumber: $confirmationNumber, accessCount: $accessCount, isInGracePeriod: $isInGracePeriod, canRenew: $canRenew, createdAt: $createdAt, updatedAt: $updatedAt, paymentMethodType: $paymentMethodType, pendingPaymentExpiresAt: $pendingPaymentExpiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
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

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);
}

abstract class _Subscription extends Subscription {
  const factory _Subscription({
    required final String id,
    required final String authId,
    required final String gymId,
    required final String gymName,
    required final String planId,
    required final String planName,
    required final SubscriptionStatus status,
    required final DateTime startDate,
    required final DateTime endDate,
    required final int daysRemaining,
    required final SubscriptionPrice price,
    final SubscriptionDiscount? discountApplied,
    required final String confirmationNumber,
    required final int accessCount,
    required final bool isInGracePeriod,
    required final bool canRenew,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final String? paymentMethodType,
    final DateTime? pendingPaymentExpiresAt,
  }) = _$SubscriptionImpl;
  const _Subscription._() : super._();

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
  SubscriptionStatus get status;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get daysRemaining;
  @override
  SubscriptionPrice get price;
  @override
  SubscriptionDiscount? get discountApplied;
  @override
  String get confirmationNumber;
  @override
  int get accessCount;
  @override
  bool get isInGracePeriod;
  @override
  bool get canRenew;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get paymentMethodType;
  @override
  DateTime? get pendingPaymentExpiresAt;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubscriptionPrice {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionPriceCopyWith<SubscriptionPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPriceCopyWith<$Res> {
  factory $SubscriptionPriceCopyWith(
    SubscriptionPrice value,
    $Res Function(SubscriptionPrice) then,
  ) = _$SubscriptionPriceCopyWithImpl<$Res, SubscriptionPrice>;
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class _$SubscriptionPriceCopyWithImpl<$Res, $Val extends SubscriptionPrice>
    implements $SubscriptionPriceCopyWith<$Res> {
  _$SubscriptionPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionPrice
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
abstract class _$$SubscriptionPriceImplCopyWith<$Res>
    implements $SubscriptionPriceCopyWith<$Res> {
  factory _$$SubscriptionPriceImplCopyWith(
    _$SubscriptionPriceImpl value,
    $Res Function(_$SubscriptionPriceImpl) then,
  ) = __$$SubscriptionPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class __$$SubscriptionPriceImplCopyWithImpl<$Res>
    extends _$SubscriptionPriceCopyWithImpl<$Res, _$SubscriptionPriceImpl>
    implements _$$SubscriptionPriceImplCopyWith<$Res> {
  __$$SubscriptionPriceImplCopyWithImpl(
    _$SubscriptionPriceImpl _value,
    $Res Function(_$SubscriptionPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _$SubscriptionPriceImpl(
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

class _$SubscriptionPriceImpl implements _SubscriptionPrice {
  const _$SubscriptionPriceImpl({required this.amount, required this.currency});

  @override
  final double amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'SubscriptionPrice(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of SubscriptionPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPriceImplCopyWith<_$SubscriptionPriceImpl> get copyWith =>
      __$$SubscriptionPriceImplCopyWithImpl<_$SubscriptionPriceImpl>(
        this,
        _$identity,
      );
}

abstract class _SubscriptionPrice implements SubscriptionPrice {
  const factory _SubscriptionPrice({
    required final double amount,
    required final String currency,
  }) = _$SubscriptionPriceImpl;

  @override
  double get amount;
  @override
  String get currency;

  /// Create a copy of SubscriptionPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionPriceImplCopyWith<_$SubscriptionPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubscriptionDiscount {
  double get amount => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDiscountCopyWith<SubscriptionDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDiscountCopyWith<$Res> {
  factory $SubscriptionDiscountCopyWith(
    SubscriptionDiscount value,
    $Res Function(SubscriptionDiscount) then,
  ) = _$SubscriptionDiscountCopyWithImpl<$Res, SubscriptionDiscount>;
  @useResult
  $Res call({double amount, String? promoCode});
}

/// @nodoc
class _$SubscriptionDiscountCopyWithImpl<
  $Res,
  $Val extends SubscriptionDiscount
>
    implements $SubscriptionDiscountCopyWith<$Res> {
  _$SubscriptionDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDiscount
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
abstract class _$$SubscriptionDiscountImplCopyWith<$Res>
    implements $SubscriptionDiscountCopyWith<$Res> {
  factory _$$SubscriptionDiscountImplCopyWith(
    _$SubscriptionDiscountImpl value,
    $Res Function(_$SubscriptionDiscountImpl) then,
  ) = __$$SubscriptionDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String? promoCode});
}

/// @nodoc
class __$$SubscriptionDiscountImplCopyWithImpl<$Res>
    extends _$SubscriptionDiscountCopyWithImpl<$Res, _$SubscriptionDiscountImpl>
    implements _$$SubscriptionDiscountImplCopyWith<$Res> {
  __$$SubscriptionDiscountImplCopyWithImpl(
    _$SubscriptionDiscountImpl _value,
    $Res Function(_$SubscriptionDiscountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? promoCode = freezed}) {
    return _then(
      _$SubscriptionDiscountImpl(
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

class _$SubscriptionDiscountImpl implements _SubscriptionDiscount {
  const _$SubscriptionDiscountImpl({required this.amount, this.promoCode});

  @override
  final double amount;
  @override
  final String? promoCode;

  @override
  String toString() {
    return 'SubscriptionDiscount(amount: $amount, promoCode: $promoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDiscountImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, promoCode);

  /// Create a copy of SubscriptionDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDiscountImplCopyWith<_$SubscriptionDiscountImpl>
  get copyWith =>
      __$$SubscriptionDiscountImplCopyWithImpl<_$SubscriptionDiscountImpl>(
        this,
        _$identity,
      );
}

abstract class _SubscriptionDiscount implements SubscriptionDiscount {
  const factory _SubscriptionDiscount({
    required final double amount,
    final String? promoCode,
  }) = _$SubscriptionDiscountImpl;

  @override
  double get amount;
  @override
  String? get promoCode;

  /// Create a copy of SubscriptionDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDiscountImplCopyWith<_$SubscriptionDiscountImpl>
  get copyWith => throw _privateConstructorUsedError;
}
