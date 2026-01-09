// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SubscriptionHistory {
  String get id => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  HistoryEventType get eventType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionHistoryCopyWith<SubscriptionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionHistoryCopyWith<$Res> {
  factory $SubscriptionHistoryCopyWith(
    SubscriptionHistory value,
    $Res Function(SubscriptionHistory) then,
  ) = _$SubscriptionHistoryCopyWithImpl<$Res, SubscriptionHistory>;
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    HistoryEventType eventType,
    String description,
    Map<String, dynamic>? metadata,
    DateTime occurredAt,
  });
}

/// @nodoc
class _$SubscriptionHistoryCopyWithImpl<$Res, $Val extends SubscriptionHistory>
    implements $SubscriptionHistoryCopyWith<$Res> {
  _$SubscriptionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionHistory
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
                      as HistoryEventType,
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
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionHistoryImplCopyWith<$Res>
    implements $SubscriptionHistoryCopyWith<$Res> {
  factory _$$SubscriptionHistoryImplCopyWith(
    _$SubscriptionHistoryImpl value,
    $Res Function(_$SubscriptionHistoryImpl) then,
  ) = __$$SubscriptionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subscriptionId,
    HistoryEventType eventType,
    String description,
    Map<String, dynamic>? metadata,
    DateTime occurredAt,
  });
}

/// @nodoc
class __$$SubscriptionHistoryImplCopyWithImpl<$Res>
    extends _$SubscriptionHistoryCopyWithImpl<$Res, _$SubscriptionHistoryImpl>
    implements _$$SubscriptionHistoryImplCopyWith<$Res> {
  __$$SubscriptionHistoryImplCopyWithImpl(
    _$SubscriptionHistoryImpl _value,
    $Res Function(_$SubscriptionHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionHistory
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
      _$SubscriptionHistoryImpl(
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
                  as HistoryEventType,
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
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$SubscriptionHistoryImpl implements _SubscriptionHistory {
  const _$SubscriptionHistoryImpl({
    required this.id,
    required this.subscriptionId,
    required this.eventType,
    required this.description,
    final Map<String, dynamic>? metadata,
    required this.occurredAt,
  }) : _metadata = metadata;

  @override
  final String id;
  @override
  final String subscriptionId;
  @override
  final HistoryEventType eventType;
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
  final DateTime occurredAt;

  @override
  String toString() {
    return 'SubscriptionHistory(id: $id, subscriptionId: $subscriptionId, eventType: $eventType, description: $description, metadata: $metadata, occurredAt: $occurredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionHistoryImpl &&
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

  /// Create a copy of SubscriptionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionHistoryImplCopyWith<_$SubscriptionHistoryImpl> get copyWith =>
      __$$SubscriptionHistoryImplCopyWithImpl<_$SubscriptionHistoryImpl>(
        this,
        _$identity,
      );
}

abstract class _SubscriptionHistory implements SubscriptionHistory {
  const factory _SubscriptionHistory({
    required final String id,
    required final String subscriptionId,
    required final HistoryEventType eventType,
    required final String description,
    final Map<String, dynamic>? metadata,
    required final DateTime occurredAt,
  }) = _$SubscriptionHistoryImpl;

  @override
  String get id;
  @override
  String get subscriptionId;
  @override
  HistoryEventType get eventType;
  @override
  String get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get occurredAt;

  /// Create a copy of SubscriptionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionHistoryImplCopyWith<_$SubscriptionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
