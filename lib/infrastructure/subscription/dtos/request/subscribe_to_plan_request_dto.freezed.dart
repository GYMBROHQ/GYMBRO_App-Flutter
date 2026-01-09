// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_to_plan_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscribeToPlanRequestDto _$SubscribeToPlanRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscribeToPlanRequestDto.fromJson(json);
}

/// @nodoc
mixin _$SubscribeToPlanRequestDto {
  String get gymId => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get paymentMethodId => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get paymentMethodType => throw _privateConstructorUsedError;

  /// Serializes this SubscribeToPlanRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeToPlanRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeToPlanRequestDtoCopyWith<SubscribeToPlanRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeToPlanRequestDtoCopyWith<$Res> {
  factory $SubscribeToPlanRequestDtoCopyWith(
    SubscribeToPlanRequestDto value,
    $Res Function(SubscribeToPlanRequestDto) then,
  ) = _$SubscribeToPlanRequestDtoCopyWithImpl<$Res, SubscribeToPlanRequestDto>;
  @useResult
  $Res call({
    String gymId,
    String planId,
    String paymentMethodId,
    String? promoCode,
    String? startDate,
    String? paymentMethodType,
  });
}

/// @nodoc
class _$SubscribeToPlanRequestDtoCopyWithImpl<
  $Res,
  $Val extends SubscribeToPlanRequestDto
>
    implements $SubscribeToPlanRequestDtoCopyWith<$Res> {
  _$SubscribeToPlanRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeToPlanRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? planId = null,
    Object? paymentMethodId = null,
    Object? promoCode = freezed,
    Object? startDate = freezed,
    Object? paymentMethodType = freezed,
  }) {
    return _then(
      _value.copyWith(
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            planId: null == planId
                ? _value.planId
                : planId // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMethodId: null == paymentMethodId
                ? _value.paymentMethodId
                : paymentMethodId // ignore: cast_nullable_to_non_nullable
                      as String,
            promoCode: freezed == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentMethodType: freezed == paymentMethodType
                ? _value.paymentMethodType
                : paymentMethodType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscribeToPlanRequestDtoImplCopyWith<$Res>
    implements $SubscribeToPlanRequestDtoCopyWith<$Res> {
  factory _$$SubscribeToPlanRequestDtoImplCopyWith(
    _$SubscribeToPlanRequestDtoImpl value,
    $Res Function(_$SubscribeToPlanRequestDtoImpl) then,
  ) = __$$SubscribeToPlanRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gymId,
    String planId,
    String paymentMethodId,
    String? promoCode,
    String? startDate,
    String? paymentMethodType,
  });
}

/// @nodoc
class __$$SubscribeToPlanRequestDtoImplCopyWithImpl<$Res>
    extends
        _$SubscribeToPlanRequestDtoCopyWithImpl<
          $Res,
          _$SubscribeToPlanRequestDtoImpl
        >
    implements _$$SubscribeToPlanRequestDtoImplCopyWith<$Res> {
  __$$SubscribeToPlanRequestDtoImplCopyWithImpl(
    _$SubscribeToPlanRequestDtoImpl _value,
    $Res Function(_$SubscribeToPlanRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeToPlanRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gymId = null,
    Object? planId = null,
    Object? paymentMethodId = null,
    Object? promoCode = freezed,
    Object? startDate = freezed,
    Object? paymentMethodType = freezed,
  }) {
    return _then(
      _$SubscribeToPlanRequestDtoImpl(
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        planId: null == planId
            ? _value.planId
            : planId // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethodId: null == paymentMethodId
            ? _value.paymentMethodId
            : paymentMethodId // ignore: cast_nullable_to_non_nullable
                  as String,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentMethodType: freezed == paymentMethodType
            ? _value.paymentMethodType
            : paymentMethodType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeToPlanRequestDtoImpl implements _SubscribeToPlanRequestDto {
  const _$SubscribeToPlanRequestDtoImpl({
    required this.gymId,
    required this.planId,
    required this.paymentMethodId,
    this.promoCode,
    this.startDate,
    this.paymentMethodType,
  });

  factory _$SubscribeToPlanRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeToPlanRequestDtoImplFromJson(json);

  @override
  final String gymId;
  @override
  final String planId;
  @override
  final String paymentMethodId;
  @override
  final String? promoCode;
  @override
  final String? startDate;
  @override
  final String? paymentMethodType;

  @override
  String toString() {
    return 'SubscribeToPlanRequestDto(gymId: $gymId, planId: $planId, paymentMethodId: $paymentMethodId, promoCode: $promoCode, startDate: $startDate, paymentMethodType: $paymentMethodType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeToPlanRequestDtoImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gymId,
    planId,
    paymentMethodId,
    promoCode,
    startDate,
    paymentMethodType,
  );

  /// Create a copy of SubscribeToPlanRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeToPlanRequestDtoImplCopyWith<_$SubscribeToPlanRequestDtoImpl>
  get copyWith =>
      __$$SubscribeToPlanRequestDtoImplCopyWithImpl<
        _$SubscribeToPlanRequestDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeToPlanRequestDtoImplToJson(this);
  }
}

abstract class _SubscribeToPlanRequestDto implements SubscribeToPlanRequestDto {
  const factory _SubscribeToPlanRequestDto({
    required final String gymId,
    required final String planId,
    required final String paymentMethodId,
    final String? promoCode,
    final String? startDate,
    final String? paymentMethodType,
  }) = _$SubscribeToPlanRequestDtoImpl;

  factory _SubscribeToPlanRequestDto.fromJson(Map<String, dynamic> json) =
      _$SubscribeToPlanRequestDtoImpl.fromJson;

  @override
  String get gymId;
  @override
  String get planId;
  @override
  String get paymentMethodId;
  @override
  String? get promoCode;
  @override
  String? get startDate;
  @override
  String? get paymentMethodType;

  /// Create a copy of SubscribeToPlanRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeToPlanRequestDtoImplCopyWith<_$SubscribeToPlanRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RenewSubscriptionRequestDto _$RenewSubscriptionRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _RenewSubscriptionRequestDto.fromJson(json);
}

/// @nodoc
mixin _$RenewSubscriptionRequestDto {
  String get paymentMethodId => throw _privateConstructorUsedError;

  /// Serializes this RenewSubscriptionRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RenewSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RenewSubscriptionRequestDtoCopyWith<RenewSubscriptionRequestDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenewSubscriptionRequestDtoCopyWith<$Res> {
  factory $RenewSubscriptionRequestDtoCopyWith(
    RenewSubscriptionRequestDto value,
    $Res Function(RenewSubscriptionRequestDto) then,
  ) =
      _$RenewSubscriptionRequestDtoCopyWithImpl<
        $Res,
        RenewSubscriptionRequestDto
      >;
  @useResult
  $Res call({String paymentMethodId});
}

/// @nodoc
class _$RenewSubscriptionRequestDtoCopyWithImpl<
  $Res,
  $Val extends RenewSubscriptionRequestDto
>
    implements $RenewSubscriptionRequestDtoCopyWith<$Res> {
  _$RenewSubscriptionRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RenewSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentMethodId = null}) {
    return _then(
      _value.copyWith(
            paymentMethodId: null == paymentMethodId
                ? _value.paymentMethodId
                : paymentMethodId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RenewSubscriptionRequestDtoImplCopyWith<$Res>
    implements $RenewSubscriptionRequestDtoCopyWith<$Res> {
  factory _$$RenewSubscriptionRequestDtoImplCopyWith(
    _$RenewSubscriptionRequestDtoImpl value,
    $Res Function(_$RenewSubscriptionRequestDtoImpl) then,
  ) = __$$RenewSubscriptionRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String paymentMethodId});
}

/// @nodoc
class __$$RenewSubscriptionRequestDtoImplCopyWithImpl<$Res>
    extends
        _$RenewSubscriptionRequestDtoCopyWithImpl<
          $Res,
          _$RenewSubscriptionRequestDtoImpl
        >
    implements _$$RenewSubscriptionRequestDtoImplCopyWith<$Res> {
  __$$RenewSubscriptionRequestDtoImplCopyWithImpl(
    _$RenewSubscriptionRequestDtoImpl _value,
    $Res Function(_$RenewSubscriptionRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RenewSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentMethodId = null}) {
    return _then(
      _$RenewSubscriptionRequestDtoImpl(
        paymentMethodId: null == paymentMethodId
            ? _value.paymentMethodId
            : paymentMethodId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RenewSubscriptionRequestDtoImpl
    implements _RenewSubscriptionRequestDto {
  const _$RenewSubscriptionRequestDtoImpl({required this.paymentMethodId});

  factory _$RenewSubscriptionRequestDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RenewSubscriptionRequestDtoImplFromJson(json);

  @override
  final String paymentMethodId;

  @override
  String toString() {
    return 'RenewSubscriptionRequestDto(paymentMethodId: $paymentMethodId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenewSubscriptionRequestDtoImpl &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentMethodId);

  /// Create a copy of RenewSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RenewSubscriptionRequestDtoImplCopyWith<_$RenewSubscriptionRequestDtoImpl>
  get copyWith =>
      __$$RenewSubscriptionRequestDtoImplCopyWithImpl<
        _$RenewSubscriptionRequestDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RenewSubscriptionRequestDtoImplToJson(this);
  }
}

abstract class _RenewSubscriptionRequestDto
    implements RenewSubscriptionRequestDto {
  const factory _RenewSubscriptionRequestDto({
    required final String paymentMethodId,
  }) = _$RenewSubscriptionRequestDtoImpl;

  factory _RenewSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =
      _$RenewSubscriptionRequestDtoImpl.fromJson;

  @override
  String get paymentMethodId;

  /// Create a copy of RenewSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RenewSubscriptionRequestDtoImplCopyWith<_$RenewSubscriptionRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CancelSubscriptionRequestDto _$CancelSubscriptionRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _CancelSubscriptionRequestDto.fromJson(json);
}

/// @nodoc
mixin _$CancelSubscriptionRequestDto {
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this CancelSubscriptionRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelSubscriptionRequestDtoCopyWith<CancelSubscriptionRequestDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelSubscriptionRequestDtoCopyWith<$Res> {
  factory $CancelSubscriptionRequestDtoCopyWith(
    CancelSubscriptionRequestDto value,
    $Res Function(CancelSubscriptionRequestDto) then,
  ) =
      _$CancelSubscriptionRequestDtoCopyWithImpl<
        $Res,
        CancelSubscriptionRequestDto
      >;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$CancelSubscriptionRequestDtoCopyWithImpl<
  $Res,
  $Val extends CancelSubscriptionRequestDto
>
    implements $CancelSubscriptionRequestDtoCopyWith<$Res> {
  _$CancelSubscriptionRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _value.copyWith(
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CancelSubscriptionRequestDtoImplCopyWith<$Res>
    implements $CancelSubscriptionRequestDtoCopyWith<$Res> {
  factory _$$CancelSubscriptionRequestDtoImplCopyWith(
    _$CancelSubscriptionRequestDtoImpl value,
    $Res Function(_$CancelSubscriptionRequestDtoImpl) then,
  ) = __$$CancelSubscriptionRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$CancelSubscriptionRequestDtoImplCopyWithImpl<$Res>
    extends
        _$CancelSubscriptionRequestDtoCopyWithImpl<
          $Res,
          _$CancelSubscriptionRequestDtoImpl
        >
    implements _$$CancelSubscriptionRequestDtoImplCopyWith<$Res> {
  __$$CancelSubscriptionRequestDtoImplCopyWithImpl(
    _$CancelSubscriptionRequestDtoImpl _value,
    $Res Function(_$CancelSubscriptionRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CancelSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _$CancelSubscriptionRequestDtoImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelSubscriptionRequestDtoImpl
    implements _CancelSubscriptionRequestDto {
  const _$CancelSubscriptionRequestDtoImpl({required this.reason});

  factory _$CancelSubscriptionRequestDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CancelSubscriptionRequestDtoImplFromJson(json);

  @override
  final String reason;

  @override
  String toString() {
    return 'CancelSubscriptionRequestDto(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelSubscriptionRequestDtoImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of CancelSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelSubscriptionRequestDtoImplCopyWith<
    _$CancelSubscriptionRequestDtoImpl
  >
  get copyWith =>
      __$$CancelSubscriptionRequestDtoImplCopyWithImpl<
        _$CancelSubscriptionRequestDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelSubscriptionRequestDtoImplToJson(this);
  }
}

abstract class _CancelSubscriptionRequestDto
    implements CancelSubscriptionRequestDto {
  const factory _CancelSubscriptionRequestDto({required final String reason}) =
      _$CancelSubscriptionRequestDtoImpl;

  factory _CancelSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =
      _$CancelSubscriptionRequestDtoImpl.fromJson;

  @override
  String get reason;

  /// Create a copy of CancelSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelSubscriptionRequestDtoImplCopyWith<
    _$CancelSubscriptionRequestDtoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

PauseSubscriptionRequestDto _$PauseSubscriptionRequestDtoFromJson(
  Map<String, dynamic> json,
) {
  return _PauseSubscriptionRequestDto.fromJson(json);
}

/// @nodoc
mixin _$PauseSubscriptionRequestDto {
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this PauseSubscriptionRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PauseSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PauseSubscriptionRequestDtoCopyWith<PauseSubscriptionRequestDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PauseSubscriptionRequestDtoCopyWith<$Res> {
  factory $PauseSubscriptionRequestDtoCopyWith(
    PauseSubscriptionRequestDto value,
    $Res Function(PauseSubscriptionRequestDto) then,
  ) =
      _$PauseSubscriptionRequestDtoCopyWithImpl<
        $Res,
        PauseSubscriptionRequestDto
      >;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$PauseSubscriptionRequestDtoCopyWithImpl<
  $Res,
  $Val extends PauseSubscriptionRequestDto
>
    implements $PauseSubscriptionRequestDtoCopyWith<$Res> {
  _$PauseSubscriptionRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PauseSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _value.copyWith(
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PauseSubscriptionRequestDtoImplCopyWith<$Res>
    implements $PauseSubscriptionRequestDtoCopyWith<$Res> {
  factory _$$PauseSubscriptionRequestDtoImplCopyWith(
    _$PauseSubscriptionRequestDtoImpl value,
    $Res Function(_$PauseSubscriptionRequestDtoImpl) then,
  ) = __$$PauseSubscriptionRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$PauseSubscriptionRequestDtoImplCopyWithImpl<$Res>
    extends
        _$PauseSubscriptionRequestDtoCopyWithImpl<
          $Res,
          _$PauseSubscriptionRequestDtoImpl
        >
    implements _$$PauseSubscriptionRequestDtoImplCopyWith<$Res> {
  __$$PauseSubscriptionRequestDtoImplCopyWithImpl(
    _$PauseSubscriptionRequestDtoImpl _value,
    $Res Function(_$PauseSubscriptionRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PauseSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _$PauseSubscriptionRequestDtoImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PauseSubscriptionRequestDtoImpl
    implements _PauseSubscriptionRequestDto {
  const _$PauseSubscriptionRequestDtoImpl({required this.reason});

  factory _$PauseSubscriptionRequestDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$PauseSubscriptionRequestDtoImplFromJson(json);

  @override
  final String reason;

  @override
  String toString() {
    return 'PauseSubscriptionRequestDto(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseSubscriptionRequestDtoImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of PauseSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseSubscriptionRequestDtoImplCopyWith<_$PauseSubscriptionRequestDtoImpl>
  get copyWith =>
      __$$PauseSubscriptionRequestDtoImplCopyWithImpl<
        _$PauseSubscriptionRequestDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PauseSubscriptionRequestDtoImplToJson(this);
  }
}

abstract class _PauseSubscriptionRequestDto
    implements PauseSubscriptionRequestDto {
  const factory _PauseSubscriptionRequestDto({required final String reason}) =
      _$PauseSubscriptionRequestDtoImpl;

  factory _PauseSubscriptionRequestDto.fromJson(Map<String, dynamic> json) =
      _$PauseSubscriptionRequestDtoImpl.fromJson;

  @override
  String get reason;

  /// Create a copy of PauseSubscriptionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PauseSubscriptionRequestDtoImplCopyWith<_$PauseSubscriptionRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
