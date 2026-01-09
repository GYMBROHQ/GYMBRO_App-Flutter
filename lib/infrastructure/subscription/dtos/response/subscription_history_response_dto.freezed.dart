// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscriptionHistoryResponseDto _$SubscriptionHistoryResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionHistoryResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionHistoryResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String get occurredAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionHistoryResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionHistoryResponseDtoCopyWith<SubscriptionHistoryResponseDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionHistoryResponseDtoCopyWith<$Res> {
  factory $SubscriptionHistoryResponseDtoCopyWith(
    SubscriptionHistoryResponseDto value,
    $Res Function(SubscriptionHistoryResponseDto) then,
  ) =
      _$SubscriptionHistoryResponseDtoCopyWithImpl<
        $Res,
        SubscriptionHistoryResponseDto
      >;
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    String eventType,
    String description,
    Map<String, dynamic>? metadata,
    String occurredAt,
  });
}

/// @nodoc
class _$SubscriptionHistoryResponseDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionHistoryResponseDto
>
    implements $SubscriptionHistoryResponseDtoCopyWith<$Res> {
  _$SubscriptionHistoryResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? eventType = null,
    Object? description = null,
    Object? metadata = freezed,
    Object? occurredAt = null,
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
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            occurredAt: null == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionHistoryResponseDtoImplCopyWith<$Res>
    implements $SubscriptionHistoryResponseDtoCopyWith<$Res> {
  factory _$$SubscriptionHistoryResponseDtoImplCopyWith(
    _$SubscriptionHistoryResponseDtoImpl value,
    $Res Function(_$SubscriptionHistoryResponseDtoImpl) then,
  ) = __$$SubscriptionHistoryResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    String eventType,
    String description,
    Map<String, dynamic>? metadata,
    String occurredAt,
  });
}

/// @nodoc
class __$$SubscriptionHistoryResponseDtoImplCopyWithImpl<$Res>
    extends
        _$SubscriptionHistoryResponseDtoCopyWithImpl<
          $Res,
          _$SubscriptionHistoryResponseDtoImpl
        >
    implements _$$SubscriptionHistoryResponseDtoImplCopyWith<$Res> {
  __$$SubscriptionHistoryResponseDtoImplCopyWithImpl(
    _$SubscriptionHistoryResponseDtoImpl _value,
    $Res Function(_$SubscriptionHistoryResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? eventType = null,
    Object? description = null,
    Object? metadata = freezed,
    Object? occurredAt = null,
  }) {
    return _then(
      _$SubscriptionHistoryResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subscriptionId: null == subscriptionId
            ? _value.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        occurredAt: null == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionHistoryResponseDtoImpl
    implements _SubscriptionHistoryResponseDto {
  const _$SubscriptionHistoryResponseDtoImpl({
    required this.id,
    required this.subscriptionId,
    required this.eventType,
    required this.description,
    final Map<String, dynamic>? metadata,
    required this.occurredAt,
  }) : _metadata = metadata;

  factory _$SubscriptionHistoryResponseDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SubscriptionHistoryResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String subscriptionId;
  @override
  final String eventType;
  @override
  final String description;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String occurredAt;

  @override
  String toString() {
    return 'SubscriptionHistoryResponseDto(id: $id, subscriptionId: $subscriptionId, eventType: $eventType, description: $description, metadata: $metadata, occurredAt: $occurredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionHistoryResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subscriptionId,
    eventType,
    description,
    const DeepCollectionEquality().hash(_metadata),
    occurredAt,
  );

  /// Create a copy of SubscriptionHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionHistoryResponseDtoImplCopyWith<
    _$SubscriptionHistoryResponseDtoImpl
  >
  get copyWith =>
      __$$SubscriptionHistoryResponseDtoImplCopyWithImpl<
        _$SubscriptionHistoryResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionHistoryResponseDtoImplToJson(this);
  }
}

abstract class _SubscriptionHistoryResponseDto
    implements SubscriptionHistoryResponseDto {
  const factory _SubscriptionHistoryResponseDto({
    required final String id,
    required final String subscriptionId,
    required final String eventType,
    required final String description,
    final Map<String, dynamic>? metadata,
    required final String occurredAt,
  }) = _$SubscriptionHistoryResponseDtoImpl;

  factory _SubscriptionHistoryResponseDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionHistoryResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get subscriptionId;
  @override
  String get eventType;
  @override
  String get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String get occurredAt;

  /// Create a copy of SubscriptionHistoryResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionHistoryResponseDtoImplCopyWith<
    _$SubscriptionHistoryResponseDtoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionHistoryListDto _$SubscriptionHistoryListDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionHistoryListDto.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionHistoryListDto {
  List<SubscriptionHistoryResponseDto> get history =>
      throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionHistoryListDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionHistoryListDtoCopyWith<SubscriptionHistoryListDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionHistoryListDtoCopyWith<$Res> {
  factory $SubscriptionHistoryListDtoCopyWith(
    SubscriptionHistoryListDto value,
    $Res Function(SubscriptionHistoryListDto) then,
  ) =
      _$SubscriptionHistoryListDtoCopyWithImpl<
        $Res,
        SubscriptionHistoryListDto
      >;
  @useResult
  $Res call({List<SubscriptionHistoryResponseDto> history, int totalCount});
}

/// @nodoc
class _$SubscriptionHistoryListDtoCopyWithImpl<
  $Res,
  $Val extends SubscriptionHistoryListDto
>
    implements $SubscriptionHistoryListDtoCopyWith<$Res> {
  _$SubscriptionHistoryListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? history = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as List<SubscriptionHistoryResponseDto>,
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
abstract class _$$SubscriptionHistoryListDtoImplCopyWith<$Res>
    implements $SubscriptionHistoryListDtoCopyWith<$Res> {
  factory _$$SubscriptionHistoryListDtoImplCopyWith(
    _$SubscriptionHistoryListDtoImpl value,
    $Res Function(_$SubscriptionHistoryListDtoImpl) then,
  ) = __$$SubscriptionHistoryListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SubscriptionHistoryResponseDto> history, int totalCount});
}

/// @nodoc
class __$$SubscriptionHistoryListDtoImplCopyWithImpl<$Res>
    extends
        _$SubscriptionHistoryListDtoCopyWithImpl<
          $Res,
          _$SubscriptionHistoryListDtoImpl
        >
    implements _$$SubscriptionHistoryListDtoImplCopyWith<$Res> {
  __$$SubscriptionHistoryListDtoImplCopyWithImpl(
    _$SubscriptionHistoryListDtoImpl _value,
    $Res Function(_$SubscriptionHistoryListDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? history = null, Object? totalCount = null}) {
    return _then(
      _$SubscriptionHistoryListDtoImpl(
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<SubscriptionHistoryResponseDto>,
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
class _$SubscriptionHistoryListDtoImpl implements _SubscriptionHistoryListDto {
  const _$SubscriptionHistoryListDtoImpl({
    required final List<SubscriptionHistoryResponseDto> history,
    required this.totalCount,
  }) : _history = history;

  factory _$SubscriptionHistoryListDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SubscriptionHistoryListDtoImplFromJson(json);

  final List<SubscriptionHistoryResponseDto> _history;
  @override
  List<SubscriptionHistoryResponseDto> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'SubscriptionHistoryListDto(history: $history, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionHistoryListDtoImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_history),
    totalCount,
  );

  /// Create a copy of SubscriptionHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionHistoryListDtoImplCopyWith<_$SubscriptionHistoryListDtoImpl>
  get copyWith =>
      __$$SubscriptionHistoryListDtoImplCopyWithImpl<
        _$SubscriptionHistoryListDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionHistoryListDtoImplToJson(this);
  }
}

abstract class _SubscriptionHistoryListDto
    implements SubscriptionHistoryListDto {
  const factory _SubscriptionHistoryListDto({
    required final List<SubscriptionHistoryResponseDto> history,
    required final int totalCount,
  }) = _$SubscriptionHistoryListDtoImpl;

  factory _SubscriptionHistoryListDto.fromJson(Map<String, dynamic> json) =
      _$SubscriptionHistoryListDtoImpl.fromJson;

  @override
  List<SubscriptionHistoryResponseDto> get history;
  @override
  int get totalCount;

  /// Create a copy of SubscriptionHistoryListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionHistoryListDtoImplCopyWith<_$SubscriptionHistoryListDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
