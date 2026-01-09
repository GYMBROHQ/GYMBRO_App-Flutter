// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QRCode {
  String get code => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  QRCodeStatus get status => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of QRCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QRCodeCopyWith<QRCode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRCodeCopyWith<$Res> {
  factory $QRCodeCopyWith(QRCode value, $Res Function(QRCode) then) =
      _$QRCodeCopyWithImpl<$Res, QRCode>;
  @useResult
  $Res call({
    String code,
    String subscriptionId,
    String gymId,
    QRCodeStatus status,
    DateTime expiresAt,
    DateTime createdAt,
  });
}

/// @nodoc
class _$QRCodeCopyWithImpl<$Res, $Val extends QRCode>
    implements $QRCodeCopyWith<$Res> {
  _$QRCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QRCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? subscriptionId = null,
    Object? gymId = null,
    Object? status = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            subscriptionId: null == subscriptionId
                ? _value.subscriptionId
                : subscriptionId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as QRCodeStatus,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QRCodeImplCopyWith<$Res> implements $QRCodeCopyWith<$Res> {
  factory _$$QRCodeImplCopyWith(
    _$QRCodeImpl value,
    $Res Function(_$QRCodeImpl) then,
  ) = __$$QRCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String subscriptionId,
    String gymId,
    QRCodeStatus status,
    DateTime expiresAt,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$QRCodeImplCopyWithImpl<$Res>
    extends _$QRCodeCopyWithImpl<$Res, _$QRCodeImpl>
    implements _$$QRCodeImplCopyWith<$Res> {
  __$$QRCodeImplCopyWithImpl(
    _$QRCodeImpl _value,
    $Res Function(_$QRCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QRCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? subscriptionId = null,
    Object? gymId = null,
    Object? status = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$QRCodeImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionId: null == subscriptionId
            ? _value.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as QRCodeStatus,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$QRCodeImpl extends _QRCode {
  const _$QRCodeImpl({
    required this.code,
    required this.subscriptionId,
    required this.gymId,
    required this.status,
    required this.expiresAt,
    required this.createdAt,
  }) : super._();

  @override
  final String code;
  @override
  final String subscriptionId;
  @override
  final String gymId;
  @override
  final QRCodeStatus status;
  @override
  final DateTime expiresAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QRCode(code: $code, subscriptionId: $subscriptionId, gymId: $gymId, status: $status, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    subscriptionId,
    gymId,
    status,
    expiresAt,
    createdAt,
  );

  /// Create a copy of QRCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QRCodeImplCopyWith<_$QRCodeImpl> get copyWith =>
      __$$QRCodeImplCopyWithImpl<_$QRCodeImpl>(this, _$identity);
}

abstract class _QRCode extends QRCode {
  const factory _QRCode({
    required final String code,
    required final String subscriptionId,
    required final String gymId,
    required final QRCodeStatus status,
    required final DateTime expiresAt,
    required final DateTime createdAt,
  }) = _$QRCodeImpl;
  const _QRCode._() : super._();

  @override
  String get code;
  @override
  String get subscriptionId;
  @override
  String get gymId;
  @override
  QRCodeStatus get status;
  @override
  DateTime get expiresAt;
  @override
  DateTime get createdAt;

  /// Create a copy of QRCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QRCodeImplCopyWith<_$QRCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
