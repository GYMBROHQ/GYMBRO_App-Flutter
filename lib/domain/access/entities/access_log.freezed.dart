// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AccessLog {
  String get id => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String get gymName => throw _privateConstructorUsedError;
  AccessResult get result => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get deniedReason => throw _privateConstructorUsedError;

  /// Create a copy of AccessLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessLogCopyWith<AccessLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessLogCopyWith<$Res> {
  factory $AccessLogCopyWith(AccessLog value, $Res Function(AccessLog) then) =
      _$AccessLogCopyWithImpl<$Res, AccessLog>;
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    String gymId,
    String gymName,
    AccessResult result,
    DateTime timestamp,
    String? deniedReason,
  });
}

/// @nodoc
class _$AccessLogCopyWithImpl<$Res, $Val extends AccessLog>
    implements $AccessLogCopyWith<$Res> {
  _$AccessLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? result = null,
    Object? timestamp = null,
    Object? deniedReason = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            subscriptionId: null == subscriptionId
                ? _value.subscriptionId
                : subscriptionId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymName: null == gymName
                ? _value.gymName
                : gymName // ignore: cast_nullable_to_non_nullable
                      as String,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as AccessResult,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deniedReason: freezed == deniedReason
                ? _value.deniedReason
                : deniedReason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccessLogImplCopyWith<$Res>
    implements $AccessLogCopyWith<$Res> {
  factory _$$AccessLogImplCopyWith(
    _$AccessLogImpl value,
    $Res Function(_$AccessLogImpl) then,
  ) = __$$AccessLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    String gymId,
    String gymName,
    AccessResult result,
    DateTime timestamp,
    String? deniedReason,
  });
}

/// @nodoc
class __$$AccessLogImplCopyWithImpl<$Res>
    extends _$AccessLogCopyWithImpl<$Res, _$AccessLogImpl>
    implements _$$AccessLogImplCopyWith<$Res> {
  __$$AccessLogImplCopyWithImpl(
    _$AccessLogImpl _value,
    $Res Function(_$AccessLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccessLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? gymId = null,
    Object? gymName = null,
    Object? result = null,
    Object? timestamp = null,
    Object? deniedReason = freezed,
  }) {
    return _then(
      _$AccessLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionId: null == subscriptionId
            ? _value.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: null == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as AccessResult,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deniedReason: freezed == deniedReason
            ? _value.deniedReason
            : deniedReason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AccessLogImpl extends _AccessLog {
  const _$AccessLogImpl({
    required this.id,
    required this.subscriptionId,
    required this.gymId,
    required this.gymName,
    required this.result,
    required this.timestamp,
    this.deniedReason,
  }) : super._();

  @override
  final String id;
  @override
  final String subscriptionId;
  @override
  final String gymId;
  @override
  final String gymName;
  @override
  final AccessResult result;
  @override
  final DateTime timestamp;
  @override
  final String? deniedReason;

  @override
  String toString() {
    return 'AccessLog(id: $id, subscriptionId: $subscriptionId, gymId: $gymId, gymName: $gymName, result: $result, timestamp: $timestamp, deniedReason: $deniedReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.deniedReason, deniedReason) ||
                other.deniedReason == deniedReason));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subscriptionId,
    gymId,
    gymName,
    result,
    timestamp,
    deniedReason,
  );

  /// Create a copy of AccessLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessLogImplCopyWith<_$AccessLogImpl> get copyWith =>
      __$$AccessLogImplCopyWithImpl<_$AccessLogImpl>(this, _$identity);
}

abstract class _AccessLog extends AccessLog {
  const factory _AccessLog({
    required final String id,
    required final String subscriptionId,
    required final String gymId,
    required final String gymName,
    required final AccessResult result,
    required final DateTime timestamp,
    final String? deniedReason,
  }) = _$AccessLogImpl;
  const _AccessLog._() : super._();

  @override
  String get id;
  @override
  String get subscriptionId;
  @override
  String get gymId;
  @override
  String get gymName;
  @override
  AccessResult get result;
  @override
  DateTime get timestamp;
  @override
  String? get deniedReason;

  /// Create a copy of AccessLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessLogImplCopyWith<_$AccessLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
