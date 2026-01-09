// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QRCodeResponseDto _$QRCodeResponseDtoFromJson(Map<String, dynamic> json) {
  return _QRCodeResponseDto.fromJson(json);
}

/// @nodoc
mixin _$QRCodeResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;
  int get remainingSeconds => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String? get gymName => throw _privateConstructorUsedError;

  /// Serializes this QRCodeResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QRCodeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QRCodeResponseDtoCopyWith<QRCodeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRCodeResponseDtoCopyWith<$Res> {
  factory $QRCodeResponseDtoCopyWith(
    QRCodeResponseDto value,
    $Res Function(QRCodeResponseDto) then,
  ) = _$QRCodeResponseDtoCopyWithImpl<$Res, QRCodeResponseDto>;
  @useResult
  $Res call({
    String id,
    String payload,
    String expiresAt,
    int remainingSeconds,
    String status,
    String gymId,
    String? gymName,
  });
}

/// @nodoc
class _$QRCodeResponseDtoCopyWithImpl<$Res, $Val extends QRCodeResponseDto>
    implements $QRCodeResponseDtoCopyWith<$Res> {
  _$QRCodeResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QRCodeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? payload = null,
    Object? expiresAt = null,
    Object? remainingSeconds = null,
    Object? status = null,
    Object? gymId = null,
    Object? gymName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            payload: null == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String,
            remainingSeconds: null == remainingSeconds
                ? _value.remainingSeconds
                : remainingSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymName: freezed == gymName
                ? _value.gymName
                : gymName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QRCodeResponseDtoImplCopyWith<$Res>
    implements $QRCodeResponseDtoCopyWith<$Res> {
  factory _$$QRCodeResponseDtoImplCopyWith(
    _$QRCodeResponseDtoImpl value,
    $Res Function(_$QRCodeResponseDtoImpl) then,
  ) = __$$QRCodeResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String payload,
    String expiresAt,
    int remainingSeconds,
    String status,
    String gymId,
    String? gymName,
  });
}

/// @nodoc
class __$$QRCodeResponseDtoImplCopyWithImpl<$Res>
    extends _$QRCodeResponseDtoCopyWithImpl<$Res, _$QRCodeResponseDtoImpl>
    implements _$$QRCodeResponseDtoImplCopyWith<$Res> {
  __$$QRCodeResponseDtoImplCopyWithImpl(
    _$QRCodeResponseDtoImpl _value,
    $Res Function(_$QRCodeResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QRCodeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? payload = null,
    Object? expiresAt = null,
    Object? remainingSeconds = null,
    Object? status = null,
    Object? gymId = null,
    Object? gymName = freezed,
  }) {
    return _then(
      _$QRCodeResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        payload: null == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String,
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: freezed == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QRCodeResponseDtoImpl implements _QRCodeResponseDto {
  const _$QRCodeResponseDtoImpl({
    required this.id,
    required this.payload,
    required this.expiresAt,
    required this.remainingSeconds,
    required this.status,
    required this.gymId,
    this.gymName,
  });

  factory _$QRCodeResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QRCodeResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String payload;
  @override
  final String expiresAt;
  @override
  final int remainingSeconds;
  @override
  final String status;
  @override
  final String gymId;
  @override
  final String? gymName;

  @override
  String toString() {
    return 'QRCodeResponseDto(id: $id, payload: $payload, expiresAt: $expiresAt, remainingSeconds: $remainingSeconds, status: $status, gymId: $gymId, gymName: $gymName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRCodeResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    payload,
    expiresAt,
    remainingSeconds,
    status,
    gymId,
    gymName,
  );

  /// Create a copy of QRCodeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QRCodeResponseDtoImplCopyWith<_$QRCodeResponseDtoImpl> get copyWith =>
      __$$QRCodeResponseDtoImplCopyWithImpl<_$QRCodeResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QRCodeResponseDtoImplToJson(this);
  }
}

abstract class _QRCodeResponseDto implements QRCodeResponseDto {
  const factory _QRCodeResponseDto({
    required final String id,
    required final String payload,
    required final String expiresAt,
    required final int remainingSeconds,
    required final String status,
    required final String gymId,
    final String? gymName,
  }) = _$QRCodeResponseDtoImpl;

  factory _QRCodeResponseDto.fromJson(Map<String, dynamic> json) =
      _$QRCodeResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get payload;
  @override
  String get expiresAt;
  @override
  int get remainingSeconds;
  @override
  String get status;
  @override
  String get gymId;
  @override
  String? get gymName;

  /// Create a copy of QRCodeResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QRCodeResponseDtoImplCopyWith<_$QRCodeResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
