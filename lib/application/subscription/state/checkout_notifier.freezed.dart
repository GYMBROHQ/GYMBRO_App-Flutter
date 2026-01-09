// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) then,
  ) = _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CheckoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PlanSelectedImplCopyWith<$Res> {
  factory _$$PlanSelectedImplCopyWith(
    _$PlanSelectedImpl value,
    $Res Function(_$PlanSelectedImpl) then,
  ) = __$$PlanSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Plan plan,
    String gymId,
    String gymName,
    String? promoCode,
    double? discount,
  });

  $PlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$PlanSelectedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PlanSelectedImpl>
    implements _$$PlanSelectedImplCopyWith<$Res> {
  __$$PlanSelectedImplCopyWithImpl(
    _$PlanSelectedImpl _value,
    $Res Function(_$PlanSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? promoCode = freezed,
    Object? discount = freezed,
  }) {
    return _then(
      _$PlanSelectedImpl(
        plan: null == plan
            ? _value.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as Plan,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: null == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discount: freezed == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanCopyWith<$Res> get plan {
    return $PlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value));
    });
  }
}

/// @nodoc

class _$PlanSelectedImpl implements _PlanSelected {
  const _$PlanSelectedImpl({
    required this.plan,
    required this.gymId,
    required this.gymName,
    this.promoCode,
    this.discount,
  });

  @override
  final Plan plan;
  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final String? promoCode;
  @override
  final double? discount;

  @override
  String toString() {
    return 'CheckoutState.planSelected(plan: $plan, gymId: $gymId, gymName: $gymName, promoCode: $promoCode, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanSelectedImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, plan, gymId, gymName, promoCode, discount);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanSelectedImplCopyWith<_$PlanSelectedImpl> get copyWith =>
      __$$PlanSelectedImplCopyWithImpl<_$PlanSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return planSelected(plan, gymId, gymName, promoCode, discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return planSelected?.call(plan, gymId, gymName, promoCode, discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (planSelected != null) {
      return planSelected(plan, gymId, gymName, promoCode, discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return planSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return planSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (planSelected != null) {
      return planSelected(this);
    }
    return orElse();
  }
}

abstract class _PlanSelected implements CheckoutState {
  const factory _PlanSelected({
    required final Plan plan,
    required final String gymId,
    required final String gymName,
    final String? promoCode,
    final double? discount,
  }) = _$PlanSelectedImpl;

  Plan get plan;
  String get gymId;
  String get gymName;
  String? get promoCode;
  double? get discount;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanSelectedImplCopyWith<_$PlanSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentMethodSelectedImplCopyWith<$Res> {
  factory _$$PaymentMethodSelectedImplCopyWith(
    _$PaymentMethodSelectedImpl value,
    $Res Function(_$PaymentMethodSelectedImpl) then,
  ) = __$$PaymentMethodSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Plan plan,
    String gymId,
    String gymName,
    PaymentMethod paymentMethod,
    String? promoCode,
    double? discount,
  });

  $PlanCopyWith<$Res> get plan;
  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class __$$PaymentMethodSelectedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentMethodSelectedImpl>
    implements _$$PaymentMethodSelectedImplCopyWith<$Res> {
  __$$PaymentMethodSelectedImplCopyWithImpl(
    _$PaymentMethodSelectedImpl _value,
    $Res Function(_$PaymentMethodSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? paymentMethod = null,
    Object? promoCode = freezed,
    Object? discount = freezed,
  }) {
    return _then(
      _$PaymentMethodSelectedImpl(
        plan: null == plan
            ? _value.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as Plan,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: null == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discount: freezed == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanCopyWith<$Res> get plan {
    return $PlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value));
    });
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value));
    });
  }
}

/// @nodoc

class _$PaymentMethodSelectedImpl implements _PaymentMethodSelected {
  const _$PaymentMethodSelectedImpl({
    required this.plan,
    required this.gymId,
    required this.gymName,
    required this.paymentMethod,
    this.promoCode,
    this.discount,
  });

  @override
  final Plan plan;
  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final PaymentMethod paymentMethod;
  @override
  final String? promoCode;
  @override
  final double? discount;

  @override
  String toString() {
    return 'CheckoutState.paymentMethodSelected(plan: $plan, gymId: $gymId, gymName: $gymName, paymentMethod: $paymentMethod, promoCode: $promoCode, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodSelectedImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    plan,
    gymId,
    gymName,
    paymentMethod,
    promoCode,
    discount,
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodSelectedImplCopyWith<_$PaymentMethodSelectedImpl>
  get copyWith =>
      __$$PaymentMethodSelectedImplCopyWithImpl<_$PaymentMethodSelectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return paymentMethodSelected(
      plan,
      gymId,
      gymName,
      paymentMethod,
      promoCode,
      discount,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return paymentMethodSelected?.call(
      plan,
      gymId,
      gymName,
      paymentMethod,
      promoCode,
      discount,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (paymentMethodSelected != null) {
      return paymentMethodSelected(
        plan,
        gymId,
        gymName,
        paymentMethod,
        promoCode,
        discount,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return paymentMethodSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return paymentMethodSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (paymentMethodSelected != null) {
      return paymentMethodSelected(this);
    }
    return orElse();
  }
}

abstract class _PaymentMethodSelected implements CheckoutState {
  const factory _PaymentMethodSelected({
    required final Plan plan,
    required final String gymId,
    required final String gymName,
    required final PaymentMethod paymentMethod,
    final String? promoCode,
    final double? discount,
  }) = _$PaymentMethodSelectedImpl;

  Plan get plan;
  String get gymId;
  String get gymName;
  PaymentMethod get paymentMethod;
  String? get promoCode;
  double? get discount;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodSelectedImplCopyWith<_$PaymentMethodSelectedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CashPaymentSelectedImplCopyWith<$Res> {
  factory _$$CashPaymentSelectedImplCopyWith(
    _$CashPaymentSelectedImpl value,
    $Res Function(_$CashPaymentSelectedImpl) then,
  ) = __$$CashPaymentSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Plan plan,
    String gymId,
    String gymName,
    String? promoCode,
    double? discount,
  });

  $PlanCopyWith<$Res> get plan;
}

/// @nodoc
class __$$CashPaymentSelectedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CashPaymentSelectedImpl>
    implements _$$CashPaymentSelectedImplCopyWith<$Res> {
  __$$CashPaymentSelectedImplCopyWithImpl(
    _$CashPaymentSelectedImpl _value,
    $Res Function(_$CashPaymentSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? promoCode = freezed,
    Object? discount = freezed,
  }) {
    return _then(
      _$CashPaymentSelectedImpl(
        plan: null == plan
            ? _value.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as Plan,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: null == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discount: freezed == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanCopyWith<$Res> get plan {
    return $PlanCopyWith<$Res>(_value.plan, (value) {
      return _then(_value.copyWith(plan: value));
    });
  }
}

/// @nodoc

class _$CashPaymentSelectedImpl implements _CashPaymentSelected {
  const _$CashPaymentSelectedImpl({
    required this.plan,
    required this.gymId,
    required this.gymName,
    this.promoCode,
    this.discount,
  });

  @override
  final Plan plan;
  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final String? promoCode;
  @override
  final double? discount;

  @override
  String toString() {
    return 'CheckoutState.cashPaymentSelected(plan: $plan, gymId: $gymId, gymName: $gymName, promoCode: $promoCode, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashPaymentSelectedImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, plan, gymId, gymName, promoCode, discount);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashPaymentSelectedImplCopyWith<_$CashPaymentSelectedImpl> get copyWith =>
      __$$CashPaymentSelectedImplCopyWithImpl<_$CashPaymentSelectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return cashPaymentSelected(plan, gymId, gymName, promoCode, discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return cashPaymentSelected?.call(plan, gymId, gymName, promoCode, discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (cashPaymentSelected != null) {
      return cashPaymentSelected(plan, gymId, gymName, promoCode, discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return cashPaymentSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return cashPaymentSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (cashPaymentSelected != null) {
      return cashPaymentSelected(this);
    }
    return orElse();
  }
}

abstract class _CashPaymentSelected implements CheckoutState {
  const factory _CashPaymentSelected({
    required final Plan plan,
    required final String gymId,
    required final String gymName,
    final String? promoCode,
    final double? discount,
  }) = _$CashPaymentSelectedImpl;

  Plan get plan;
  String get gymId;
  String get gymName;
  String? get promoCode;
  double? get discount;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashPaymentSelectedImplCopyWith<_$CashPaymentSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
    _$ProcessingImpl value,
    $Res Function(_$ProcessingImpl) then,
  ) = __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
    _$ProcessingImpl _value,
    $Res Function(_$ProcessingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl();

  @override
  String toString() {
    return 'CheckoutState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements CheckoutState {
  const factory _Processing() = _$ProcessingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Subscription subscription});

  $SubscriptionCopyWith<$Res> get subscription;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subscription = null}) {
    return _then(
      _$SuccessImpl(
        null == subscription
            ? _value.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as Subscription,
      ),
    );
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionCopyWith<$Res> get subscription {
    return $SubscriptionCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.subscription);

  @override
  final Subscription subscription;

  @override
  String toString() {
    return 'CheckoutState.success(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return success(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CheckoutState {
  const factory _Success(final Subscription subscription) = _$SuccessImpl;

  Subscription get subscription;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$FailureImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'CheckoutState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    planSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )
    paymentMethodSelected,
    required TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )
    cashPaymentSelected,
    required TResult Function() processing,
    required TResult Function(Subscription subscription) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult? Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult? Function()? processing,
    TResult? Function(Subscription subscription)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    planSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      PaymentMethod paymentMethod,
      String? promoCode,
      double? discount,
    )?
    paymentMethodSelected,
    TResult Function(
      Plan plan,
      String gymId,
      String gymName,
      String? promoCode,
      double? discount,
    )?
    cashPaymentSelected,
    TResult Function()? processing,
    TResult Function(Subscription subscription)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PlanSelected value) planSelected,
    required TResult Function(_PaymentMethodSelected value)
    paymentMethodSelected,
    required TResult Function(_CashPaymentSelected value) cashPaymentSelected,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PlanSelected value)? planSelected,
    TResult? Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult? Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PlanSelected value)? planSelected,
    TResult Function(_PaymentMethodSelected value)? paymentMethodSelected,
    TResult Function(_CashPaymentSelected value)? cashPaymentSelected,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CheckoutState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
