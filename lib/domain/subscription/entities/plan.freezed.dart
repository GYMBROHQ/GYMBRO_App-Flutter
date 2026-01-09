// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Plan {
  String get id => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  PlanPrice get price => throw _privateConstructorUsedError;
  PlanDuration get duration => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get accessType => throw _privateConstructorUsedError;
  int? get maxVisitsPerPeriod => throw _privateConstructorUsedError;
  String? get visitPeriod => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res, Plan>;
  @useResult
  $Res call({
    String id,
    String gymId,
    String name,
    String description,
    PlanPrice price,
    PlanDuration duration,
    List<String> features,
    String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    bool isActive,
    int sortOrder,
    DateTime createdAt,
    DateTime updatedAt,
  });

  $PlanPriceCopyWith<$Res> get price;
  $PlanDurationCopyWith<$Res> get duration;
}

/// @nodoc
class _$PlanCopyWithImpl<$Res, $Val extends Plan>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gymId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? duration = null,
    Object? features = null,
    Object? accessType = null,
    Object? maxVisitsPerPeriod = freezed,
    Object? visitPeriod = freezed,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as PlanPrice,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as PlanDuration,
            features: null == features
                ? _value.features
                : features // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            accessType: null == accessType
                ? _value.accessType
                : accessType // ignore: cast_nullable_to_non_nullable
                      as String,
            maxVisitsPerPeriod: freezed == maxVisitsPerPeriod
                ? _value.maxVisitsPerPeriod
                : maxVisitsPerPeriod // ignore: cast_nullable_to_non_nullable
                      as int?,
            visitPeriod: freezed == visitPeriod
                ? _value.visitPeriod
                : visitPeriod // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanPriceCopyWith<$Res> get price {
    return $PlanPriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanDurationCopyWith<$Res> get duration {
    return $PlanDurationCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlanImplCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$$PlanImplCopyWith(
    _$PlanImpl value,
    $Res Function(_$PlanImpl) then,
  ) = __$$PlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String gymId,
    String name,
    String description,
    PlanPrice price,
    PlanDuration duration,
    List<String> features,
    String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    bool isActive,
    int sortOrder,
    DateTime createdAt,
    DateTime updatedAt,
  });

  @override
  $PlanPriceCopyWith<$Res> get price;
  @override
  $PlanDurationCopyWith<$Res> get duration;
}

/// @nodoc
class __$$PlanImplCopyWithImpl<$Res>
    extends _$PlanCopyWithImpl<$Res, _$PlanImpl>
    implements _$$PlanImplCopyWith<$Res> {
  __$$PlanImplCopyWithImpl(_$PlanImpl _value, $Res Function(_$PlanImpl) _then)
    : super(_value, _then);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gymId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? duration = null,
    Object? features = null,
    Object? accessType = null,
    Object? maxVisitsPerPeriod = freezed,
    Object? visitPeriod = freezed,
    Object? isActive = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PlanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as PlanPrice,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as PlanDuration,
        features: null == features
            ? _value._features
            : features // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        accessType: null == accessType
            ? _value.accessType
            : accessType // ignore: cast_nullable_to_non_nullable
                  as String,
        maxVisitsPerPeriod: freezed == maxVisitsPerPeriod
            ? _value.maxVisitsPerPeriod
            : maxVisitsPerPeriod // ignore: cast_nullable_to_non_nullable
                  as int?,
        visitPeriod: freezed == visitPeriod
            ? _value.visitPeriod
            : visitPeriod // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$PlanImpl implements _Plan {
  const _$PlanImpl({
    required this.id,
    required this.gymId,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required final List<String> features,
    required this.accessType,
    this.maxVisitsPerPeriod,
    this.visitPeriod,
    required this.isActive,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  }) : _features = features;

  @override
  final String id;
  @override
  final String gymId;
  @override
  final String name;
  @override
  final String description;
  @override
  final PlanPrice price;
  @override
  final PlanDuration duration;
  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String accessType;
  @override
  final int? maxVisitsPerPeriod;
  @override
  final String? visitPeriod;
  @override
  final bool isActive;
  @override
  final int sortOrder;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Plan(id: $id, gymId: $gymId, name: $name, description: $description, price: $price, duration: $duration, features: $features, accessType: $accessType, maxVisitsPerPeriod: $maxVisitsPerPeriod, visitPeriod: $visitPeriod, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.accessType, accessType) ||
                other.accessType == accessType) &&
            (identical(other.maxVisitsPerPeriod, maxVisitsPerPeriod) ||
                other.maxVisitsPerPeriod == maxVisitsPerPeriod) &&
            (identical(other.visitPeriod, visitPeriod) ||
                other.visitPeriod == visitPeriod) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    gymId,
    name,
    description,
    price,
    duration,
    const DeepCollectionEquality().hash(_features),
    accessType,
    maxVisitsPerPeriod,
    visitPeriod,
    isActive,
    sortOrder,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      __$$PlanImplCopyWithImpl<_$PlanImpl>(this, _$identity);
}

abstract class _Plan implements Plan {
  const factory _Plan({
    required final String id,
    required final String gymId,
    required final String name,
    required final String description,
    required final PlanPrice price,
    required final PlanDuration duration,
    required final List<String> features,
    required final String accessType,
    final int? maxVisitsPerPeriod,
    final String? visitPeriod,
    required final bool isActive,
    required final int sortOrder,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$PlanImpl;

  @override
  String get id;
  @override
  String get gymId;
  @override
  String get name;
  @override
  String get description;
  @override
  PlanPrice get price;
  @override
  PlanDuration get duration;
  @override
  List<String> get features;
  @override
  String get accessType;
  @override
  int? get maxVisitsPerPeriod;
  @override
  String? get visitPeriod;
  @override
  bool get isActive;
  @override
  int get sortOrder;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlanPrice {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of PlanPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanPriceCopyWith<PlanPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanPriceCopyWith<$Res> {
  factory $PlanPriceCopyWith(PlanPrice value, $Res Function(PlanPrice) then) =
      _$PlanPriceCopyWithImpl<$Res, PlanPrice>;
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class _$PlanPriceCopyWithImpl<$Res, $Val extends PlanPrice>
    implements $PlanPriceCopyWith<$Res> {
  _$PlanPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanPrice
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
abstract class _$$PlanPriceImplCopyWith<$Res>
    implements $PlanPriceCopyWith<$Res> {
  factory _$$PlanPriceImplCopyWith(
    _$PlanPriceImpl value,
    $Res Function(_$PlanPriceImpl) then,
  ) = __$$PlanPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class __$$PlanPriceImplCopyWithImpl<$Res>
    extends _$PlanPriceCopyWithImpl<$Res, _$PlanPriceImpl>
    implements _$$PlanPriceImplCopyWith<$Res> {
  __$$PlanPriceImplCopyWithImpl(
    _$PlanPriceImpl _value,
    $Res Function(_$PlanPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _$PlanPriceImpl(
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

class _$PlanPriceImpl implements _PlanPrice {
  const _$PlanPriceImpl({required this.amount, required this.currency});

  @override
  final double amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'PlanPrice(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of PlanPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanPriceImplCopyWith<_$PlanPriceImpl> get copyWith =>
      __$$PlanPriceImplCopyWithImpl<_$PlanPriceImpl>(this, _$identity);
}

abstract class _PlanPrice implements PlanPrice {
  const factory _PlanPrice({
    required final double amount,
    required final String currency,
  }) = _$PlanPriceImpl;

  @override
  double get amount;
  @override
  String get currency;

  /// Create a copy of PlanPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanPriceImplCopyWith<_$PlanPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlanDuration {
  int get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Create a copy of PlanDuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanDurationCopyWith<PlanDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanDurationCopyWith<$Res> {
  factory $PlanDurationCopyWith(
    PlanDuration value,
    $Res Function(PlanDuration) then,
  ) = _$PlanDurationCopyWithImpl<$Res, PlanDuration>;
  @useResult
  $Res call({int value, String unit});
}

/// @nodoc
class _$PlanDurationCopyWithImpl<$Res, $Val extends PlanDuration>
    implements $PlanDurationCopyWith<$Res> {
  _$PlanDurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanDuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? unit = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as int,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanDurationImplCopyWith<$Res>
    implements $PlanDurationCopyWith<$Res> {
  factory _$$PlanDurationImplCopyWith(
    _$PlanDurationImpl value,
    $Res Function(_$PlanDurationImpl) then,
  ) = __$$PlanDurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String unit});
}

/// @nodoc
class __$$PlanDurationImplCopyWithImpl<$Res>
    extends _$PlanDurationCopyWithImpl<$Res, _$PlanDurationImpl>
    implements _$$PlanDurationImplCopyWith<$Res> {
  __$$PlanDurationImplCopyWithImpl(
    _$PlanDurationImpl _value,
    $Res Function(_$PlanDurationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanDuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? unit = null}) {
    return _then(
      _$PlanDurationImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PlanDurationImpl extends _PlanDuration {
  const _$PlanDurationImpl({required this.value, required this.unit})
    : super._();

  @override
  final int value;
  @override
  final String unit;

  @override
  String toString() {
    return 'PlanDuration(value: $value, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanDurationImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  /// Create a copy of PlanDuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanDurationImplCopyWith<_$PlanDurationImpl> get copyWith =>
      __$$PlanDurationImplCopyWithImpl<_$PlanDurationImpl>(this, _$identity);
}

abstract class _PlanDuration extends PlanDuration {
  const factory _PlanDuration({
    required final int value,
    required final String unit,
  }) = _$PlanDurationImpl;
  const _PlanDuration._() : super._();

  @override
  int get value;
  @override
  String get unit;

  /// Create a copy of PlanDuration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanDurationImplCopyWith<_$PlanDurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
