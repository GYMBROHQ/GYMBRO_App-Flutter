// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_qr_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateQRRequestDto _$GenerateQRRequestDtoFromJson(Map<String, dynamic> json) {
  return _GenerateQRRequestDto.fromJson(json);
}

/// @nodoc
mixin _$GenerateQRRequestDto {
  String get gymId => throw _privateConstructorUsedError;
  String get deviceFingerprint => throw _privateConstructorUsedError;

  /// Serializes this GenerateQRRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateQRRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateQRRequestDtoCopyWith<GenerateQRRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateQRRequestDtoCopyWith<$Res> {
  factory $GenerateQRRequestDtoCopyWith(
    GenerateQRRequestDto value,
    $Res Function(GenerateQRRequestDto) then,
  ) = _$GenerateQRRequestDtoCopyWithImpl<$Res, GenerateQRRequestDto>;
  @useResult
  $Res call({String gymId, String deviceFingerprint});
}

/// @nodoc
class _$GenerateQRRequestDtoCopyWithImpl<
  $Res,
  $Val extends GenerateQRRequestDto
>
    implements $GenerateQRRequestDtoCopyWith<$Res> {
  _$GenerateQRRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateQRRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? gymId = null, Object? deviceFingerprint = null}) {
    return _then(
      _value.copyWith(
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceFingerprint: null == deviceFingerprint
                ? _value.deviceFingerprint
                : deviceFingerprint // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerateQRRequestDtoImplCopyWith<$Res>
    implements $GenerateQRRequestDtoCopyWith<$Res> {
  factory _$$GenerateQRRequestDtoImplCopyWith(
    _$GenerateQRRequestDtoImpl value,
    $Res Function(_$GenerateQRRequestDtoImpl) then,
  ) = __$$GenerateQRRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gymId, String deviceFingerprint});
}

/// @nodoc
class __$$GenerateQRRequestDtoImplCopyWithImpl<$Res>
    extends _$GenerateQRRequestDtoCopyWithImpl<$Res, _$GenerateQRRequestDtoImpl>
    implements _$$GenerateQRRequestDtoImplCopyWith<$Res> {
  __$$GenerateQRRequestDtoImplCopyWithImpl(
    _$GenerateQRRequestDtoImpl _value,
    $Res Function(_$GenerateQRRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateQRRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? gymId = null, Object? deviceFingerprint = null}) {
    return _then(
      _$GenerateQRRequestDtoImpl(
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceFingerprint: null == deviceFingerprint
            ? _value.deviceFingerprint
            : deviceFingerprint // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateQRRequestDtoImpl implements _GenerateQRRequestDto {
  const _$GenerateQRRequestDtoImpl({
    required this.gymId,
    required this.deviceFingerprint,
  });

  factory _$GenerateQRRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateQRRequestDtoImplFromJson(json);

  @override
  final String gymId;
  @override
  final String deviceFingerprint;

  @override
  String toString() {
    return 'GenerateQRRequestDto(gymId: $gymId, deviceFingerprint: $deviceFingerprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateQRRequestDtoImpl &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.deviceFingerprint, deviceFingerprint) ||
                other.deviceFingerprint == deviceFingerprint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gymId, deviceFingerprint);

  /// Create a copy of GenerateQRRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateQRRequestDtoImplCopyWith<_$GenerateQRRequestDtoImpl>
  get copyWith =>
      __$$GenerateQRRequestDtoImplCopyWithImpl<_$GenerateQRRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateQRRequestDtoImplToJson(this);
  }
}

abstract class _GenerateQRRequestDto implements GenerateQRRequestDto {
  const factory _GenerateQRRequestDto({
    required final String gymId,
    required final String deviceFingerprint,
  }) = _$GenerateQRRequestDtoImpl;

  factory _GenerateQRRequestDto.fromJson(Map<String, dynamic> json) =
      _$GenerateQRRequestDtoImpl.fromJson;

  @override
  String get gymId;
  @override
  String get deviceFingerprint;

  /// Create a copy of GenerateQRRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateQRRequestDtoImplCopyWith<_$GenerateQRRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
