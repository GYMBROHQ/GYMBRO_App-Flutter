// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return _PriceDto.fromJson(json);
}

/// @nodoc
mixin _$PriceDto {
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this PriceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceDtoCopyWith<PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDtoCopyWith<$Res> {
  factory $PriceDtoCopyWith(PriceDto value, $Res Function(PriceDto) then) =
      _$PriceDtoCopyWithImpl<$Res, PriceDto>;
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class _$PriceDtoCopyWithImpl<$Res, $Val extends PriceDto>
    implements $PriceDtoCopyWith<$Res> {
  _$PriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceDto
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
abstract class _$$PriceDtoImplCopyWith<$Res>
    implements $PriceDtoCopyWith<$Res> {
  factory _$$PriceDtoImplCopyWith(
    _$PriceDtoImpl value,
    $Res Function(_$PriceDtoImpl) then,
  ) = __$$PriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String currency});
}

/// @nodoc
class __$$PriceDtoImplCopyWithImpl<$Res>
    extends _$PriceDtoCopyWithImpl<$Res, _$PriceDtoImpl>
    implements _$$PriceDtoImplCopyWith<$Res> {
  __$$PriceDtoImplCopyWithImpl(
    _$PriceDtoImpl _value,
    $Res Function(_$PriceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PriceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? currency = null}) {
    return _then(
      _$PriceDtoImpl(
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
class _$PriceDtoImpl implements _PriceDto {
  const _$PriceDtoImpl({required this.amount, required this.currency});

  factory _$PriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceDtoImplFromJson(json);

  @override
  final double amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'PriceDto(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceDtoImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  /// Create a copy of PriceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      __$$PriceDtoImplCopyWithImpl<_$PriceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceDtoImplToJson(this);
  }
}

abstract class _PriceDto implements PriceDto {
  const factory _PriceDto({
    required final double amount,
    required final String currency,
  }) = _$PriceDtoImpl;

  factory _PriceDto.fromJson(Map<String, dynamic> json) =
      _$PriceDtoImpl.fromJson;

  @override
  double get amount;
  @override
  String get currency;

  /// Create a copy of PriceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DurationDto _$DurationDtoFromJson(Map<String, dynamic> json) {
  return _DurationDto.fromJson(json);
}

/// @nodoc
mixin _$DurationDto {
  int get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this DurationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DurationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DurationDtoCopyWith<DurationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationDtoCopyWith<$Res> {
  factory $DurationDtoCopyWith(
    DurationDto value,
    $Res Function(DurationDto) then,
  ) = _$DurationDtoCopyWithImpl<$Res, DurationDto>;
  @useResult
  $Res call({int value, String unit});
}

/// @nodoc
class _$DurationDtoCopyWithImpl<$Res, $Val extends DurationDto>
    implements $DurationDtoCopyWith<$Res> {
  _$DurationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DurationDto
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
abstract class _$$DurationDtoImplCopyWith<$Res>
    implements $DurationDtoCopyWith<$Res> {
  factory _$$DurationDtoImplCopyWith(
    _$DurationDtoImpl value,
    $Res Function(_$DurationDtoImpl) then,
  ) = __$$DurationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String unit});
}

/// @nodoc
class __$$DurationDtoImplCopyWithImpl<$Res>
    extends _$DurationDtoCopyWithImpl<$Res, _$DurationDtoImpl>
    implements _$$DurationDtoImplCopyWith<$Res> {
  __$$DurationDtoImplCopyWithImpl(
    _$DurationDtoImpl _value,
    $Res Function(_$DurationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DurationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? unit = null}) {
    return _then(
      _$DurationDtoImpl(
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
@JsonSerializable()
class _$DurationDtoImpl implements _DurationDto {
  const _$DurationDtoImpl({required this.value, required this.unit});

  factory _$DurationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationDtoImplFromJson(json);

  @override
  final int value;
  @override
  final String unit;

  @override
  String toString() {
    return 'DurationDto(value: $value, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationDtoImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  /// Create a copy of DurationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationDtoImplCopyWith<_$DurationDtoImpl> get copyWith =>
      __$$DurationDtoImplCopyWithImpl<_$DurationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationDtoImplToJson(this);
  }
}

abstract class _DurationDto implements DurationDto {
  const factory _DurationDto({
    required final int value,
    required final String unit,
  }) = _$DurationDtoImpl;

  factory _DurationDto.fromJson(Map<String, dynamic> json) =
      _$DurationDtoImpl.fromJson;

  @override
  int get value;
  @override
  String get unit;

  /// Create a copy of DurationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DurationDtoImplCopyWith<_$DurationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanResponseDto _$PlanResponseDtoFromJson(Map<String, dynamic> json) {
  return _PlanResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PlanResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  PriceDto get price => throw _privateConstructorUsedError;
  DurationDto get duration => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get accessType => throw _privateConstructorUsedError;
  int? get maxVisitsPerPeriod => throw _privateConstructorUsedError;
  String? get visitPeriod => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PlanResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanResponseDtoCopyWith<PlanResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanResponseDtoCopyWith<$Res> {
  factory $PlanResponseDtoCopyWith(
    PlanResponseDto value,
    $Res Function(PlanResponseDto) then,
  ) = _$PlanResponseDtoCopyWithImpl<$Res, PlanResponseDto>;
  @useResult
  $Res call({
    String id,
    String gymId,
    String name,
    String description,
    PriceDto price,
    DurationDto duration,
    List<String> features,
    String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    bool isActive,
    int sortOrder,
    String createdAt,
    String updatedAt,
  });

  $PriceDtoCopyWith<$Res> get price;
  $DurationDtoCopyWith<$Res> get duration;
}

/// @nodoc
class _$PlanResponseDtoCopyWithImpl<$Res, $Val extends PlanResponseDto>
    implements $PlanResponseDtoCopyWith<$Res> {
  _$PlanResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanResponseDto
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
                      as PriceDto,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as DurationDto,
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
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriceDtoCopyWith<$Res> get price {
    return $PriceDtoCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of PlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DurationDtoCopyWith<$Res> get duration {
    return $DurationDtoCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlanResponseDtoImplCopyWith<$Res>
    implements $PlanResponseDtoCopyWith<$Res> {
  factory _$$PlanResponseDtoImplCopyWith(
    _$PlanResponseDtoImpl value,
    $Res Function(_$PlanResponseDtoImpl) then,
  ) = __$$PlanResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String gymId,
    String name,
    String description,
    PriceDto price,
    DurationDto duration,
    List<String> features,
    String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    bool isActive,
    int sortOrder,
    String createdAt,
    String updatedAt,
  });

  @override
  $PriceDtoCopyWith<$Res> get price;
  @override
  $DurationDtoCopyWith<$Res> get duration;
}

/// @nodoc
class __$$PlanResponseDtoImplCopyWithImpl<$Res>
    extends _$PlanResponseDtoCopyWithImpl<$Res, _$PlanResponseDtoImpl>
    implements _$$PlanResponseDtoImplCopyWith<$Res> {
  __$$PlanResponseDtoImplCopyWithImpl(
    _$PlanResponseDtoImpl _value,
    $Res Function(_$PlanResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanResponseDto
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
      _$PlanResponseDtoImpl(
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
                  as PriceDto,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as DurationDto,
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
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanResponseDtoImpl implements _PlanResponseDto {
  const _$PlanResponseDtoImpl({
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

  factory _$PlanResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String gymId;
  @override
  final String name;
  @override
  final String description;
  @override
  final PriceDto price;
  @override
  final DurationDto duration;
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
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'PlanResponseDto(id: $id, gymId: $gymId, name: $name, description: $description, price: $price, duration: $duration, features: $features, accessType: $accessType, maxVisitsPerPeriod: $maxVisitsPerPeriod, visitPeriod: $visitPeriod, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanResponseDtoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of PlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanResponseDtoImplCopyWith<_$PlanResponseDtoImpl> get copyWith =>
      __$$PlanResponseDtoImplCopyWithImpl<_$PlanResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanResponseDtoImplToJson(this);
  }
}

abstract class _PlanResponseDto implements PlanResponseDto {
  const factory _PlanResponseDto({
    required final String id,
    required final String gymId,
    required final String name,
    required final String description,
    required final PriceDto price,
    required final DurationDto duration,
    required final List<String> features,
    required final String accessType,
    final int? maxVisitsPerPeriod,
    final String? visitPeriod,
    required final bool isActive,
    required final int sortOrder,
    required final String createdAt,
    required final String updatedAt,
  }) = _$PlanResponseDtoImpl;

  factory _PlanResponseDto.fromJson(Map<String, dynamic> json) =
      _$PlanResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get gymId;
  @override
  String get name;
  @override
  String get description;
  @override
  PriceDto get price;
  @override
  DurationDto get duration;
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
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of PlanResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanResponseDtoImplCopyWith<_$PlanResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanListResponseDto _$PlanListResponseDtoFromJson(Map<String, dynamic> json) {
  return _PlanListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PlanListResponseDto {
  List<PlanResponseDto> get plans => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this PlanListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanListResponseDtoCopyWith<PlanListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanListResponseDtoCopyWith<$Res> {
  factory $PlanListResponseDtoCopyWith(
    PlanListResponseDto value,
    $Res Function(PlanListResponseDto) then,
  ) = _$PlanListResponseDtoCopyWithImpl<$Res, PlanListResponseDto>;
  @useResult
  $Res call({List<PlanResponseDto> plans, int totalCount});
}

/// @nodoc
class _$PlanListResponseDtoCopyWithImpl<$Res, $Val extends PlanListResponseDto>
    implements $PlanListResponseDtoCopyWith<$Res> {
  _$PlanListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? plans = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            plans: null == plans
                ? _value.plans
                : plans // ignore: cast_nullable_to_non_nullable
                      as List<PlanResponseDto>,
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
abstract class _$$PlanListResponseDtoImplCopyWith<$Res>
    implements $PlanListResponseDtoCopyWith<$Res> {
  factory _$$PlanListResponseDtoImplCopyWith(
    _$PlanListResponseDtoImpl value,
    $Res Function(_$PlanListResponseDtoImpl) then,
  ) = __$$PlanListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlanResponseDto> plans, int totalCount});
}

/// @nodoc
class __$$PlanListResponseDtoImplCopyWithImpl<$Res>
    extends _$PlanListResponseDtoCopyWithImpl<$Res, _$PlanListResponseDtoImpl>
    implements _$$PlanListResponseDtoImplCopyWith<$Res> {
  __$$PlanListResponseDtoImplCopyWithImpl(
    _$PlanListResponseDtoImpl _value,
    $Res Function(_$PlanListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? plans = null, Object? totalCount = null}) {
    return _then(
      _$PlanListResponseDtoImpl(
        plans: null == plans
            ? _value._plans
            : plans // ignore: cast_nullable_to_non_nullable
                  as List<PlanResponseDto>,
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
class _$PlanListResponseDtoImpl implements _PlanListResponseDto {
  const _$PlanListResponseDtoImpl({
    required final List<PlanResponseDto> plans,
    required this.totalCount,
  }) : _plans = plans;

  factory _$PlanListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanListResponseDtoImplFromJson(json);

  final List<PlanResponseDto> _plans;
  @override
  List<PlanResponseDto> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'PlanListResponseDto(plans: $plans, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanListResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_plans),
    totalCount,
  );

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanListResponseDtoImplCopyWith<_$PlanListResponseDtoImpl> get copyWith =>
      __$$PlanListResponseDtoImplCopyWithImpl<_$PlanListResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanListResponseDtoImplToJson(this);
  }
}

abstract class _PlanListResponseDto implements PlanListResponseDto {
  const factory _PlanListResponseDto({
    required final List<PlanResponseDto> plans,
    required final int totalCount,
  }) = _$PlanListResponseDtoImpl;

  factory _PlanListResponseDto.fromJson(Map<String, dynamic> json) =
      _$PlanListResponseDtoImpl.fromJson;

  @override
  List<PlanResponseDto> get plans;
  @override
  int get totalCount;

  /// Create a copy of PlanListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanListResponseDtoImplCopyWith<_$PlanListResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
