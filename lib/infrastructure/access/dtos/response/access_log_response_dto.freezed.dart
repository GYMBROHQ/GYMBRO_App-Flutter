// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_log_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccessLogResponseDto _$AccessLogResponseDtoFromJson(Map<String, dynamic> json) {
  return _AccessLogResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AccessLogResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  String? get gymName => throw _privateConstructorUsedError;
  String get subscriptionId => throw _privateConstructorUsedError;
  String get accessType => throw _privateConstructorUsedError;
  String get accessMethod => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String? get denialReason => throw _privateConstructorUsedError;
  String? get verifiedByStaffId => throw _privateConstructorUsedError;
  String? get verifiedByStaffName => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String get accessedAt => throw _privateConstructorUsedError;

  /// Serializes this AccessLogResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessLogResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessLogResponseDtoCopyWith<AccessLogResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessLogResponseDtoCopyWith<$Res> {
  factory $AccessLogResponseDtoCopyWith(
    AccessLogResponseDto value,
    $Res Function(AccessLogResponseDto) then,
  ) = _$AccessLogResponseDtoCopyWithImpl<$Res, AccessLogResponseDto>;
  @useResult
  $Res call({
    String id,
    String userId,
    String? userName,
    String gymId,
    String? gymName,
    String subscriptionId,
    String accessType,
    String accessMethod,
    String result,
    String? denialReason,
    String? verifiedByStaffId,
    String? verifiedByStaffName,
    String? deviceId,
    String accessedAt,
  });
}

/// @nodoc
class _$AccessLogResponseDtoCopyWithImpl<
  $Res,
  $Val extends AccessLogResponseDto
>
    implements $AccessLogResponseDtoCopyWith<$Res> {
  _$AccessLogResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessLogResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = freezed,
    Object? gymId = null,
    Object? gymName = freezed,
    Object? subscriptionId = null,
    Object? accessType = null,
    Object? accessMethod = null,
    Object? result = null,
    Object? denialReason = freezed,
    Object? verifiedByStaffId = freezed,
    Object? verifiedByStaffName = freezed,
    Object? deviceId = freezed,
    Object? accessedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
            gymId: null == gymId
                ? _value.gymId
                : gymId // ignore: cast_nullable_to_non_nullable
                      as String,
            gymName: freezed == gymName
                ? _value.gymName
                : gymName // ignore: cast_nullable_to_non_nullable
                      as String?,
            subscriptionId: null == subscriptionId
                ? _value.subscriptionId
                : subscriptionId // ignore: cast_nullable_to_non_nullable
                      as String,
            accessType: null == accessType
                ? _value.accessType
                : accessType // ignore: cast_nullable_to_non_nullable
                      as String,
            accessMethod: null == accessMethod
                ? _value.accessMethod
                : accessMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String,
            denialReason: freezed == denialReason
                ? _value.denialReason
                : denialReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            verifiedByStaffId: freezed == verifiedByStaffId
                ? _value.verifiedByStaffId
                : verifiedByStaffId // ignore: cast_nullable_to_non_nullable
                      as String?,
            verifiedByStaffName: freezed == verifiedByStaffName
                ? _value.verifiedByStaffName
                : verifiedByStaffName // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            accessedAt: null == accessedAt
                ? _value.accessedAt
                : accessedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccessLogResponseDtoImplCopyWith<$Res>
    implements $AccessLogResponseDtoCopyWith<$Res> {
  factory _$$AccessLogResponseDtoImplCopyWith(
    _$AccessLogResponseDtoImpl value,
    $Res Function(_$AccessLogResponseDtoImpl) then,
  ) = __$$AccessLogResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? userName,
    String gymId,
    String? gymName,
    String subscriptionId,
    String accessType,
    String accessMethod,
    String result,
    String? denialReason,
    String? verifiedByStaffId,
    String? verifiedByStaffName,
    String? deviceId,
    String accessedAt,
  });
}

/// @nodoc
class __$$AccessLogResponseDtoImplCopyWithImpl<$Res>
    extends _$AccessLogResponseDtoCopyWithImpl<$Res, _$AccessLogResponseDtoImpl>
    implements _$$AccessLogResponseDtoImplCopyWith<$Res> {
  __$$AccessLogResponseDtoImplCopyWithImpl(
    _$AccessLogResponseDtoImpl _value,
    $Res Function(_$AccessLogResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccessLogResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = freezed,
    Object? gymId = null,
    Object? gymName = freezed,
    Object? subscriptionId = null,
    Object? accessType = null,
    Object? accessMethod = null,
    Object? result = null,
    Object? denialReason = freezed,
    Object? verifiedByStaffId = freezed,
    Object? verifiedByStaffName = freezed,
    Object? deviceId = freezed,
    Object? accessedAt = null,
  }) {
    return _then(
      _$AccessLogResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
        gymId: null == gymId
            ? _value.gymId
            : gymId // ignore: cast_nullable_to_non_nullable
                  as String,
        gymName: freezed == gymName
            ? _value.gymName
            : gymName // ignore: cast_nullable_to_non_nullable
                  as String?,
        subscriptionId: null == subscriptionId
            ? _value.subscriptionId
            : subscriptionId // ignore: cast_nullable_to_non_nullable
                  as String,
        accessType: null == accessType
            ? _value.accessType
            : accessType // ignore: cast_nullable_to_non_nullable
                  as String,
        accessMethod: null == accessMethod
            ? _value.accessMethod
            : accessMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        denialReason: freezed == denialReason
            ? _value.denialReason
            : denialReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedByStaffId: freezed == verifiedByStaffId
            ? _value.verifiedByStaffId
            : verifiedByStaffId // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedByStaffName: freezed == verifiedByStaffName
            ? _value.verifiedByStaffName
            : verifiedByStaffName // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        accessedAt: null == accessedAt
            ? _value.accessedAt
            : accessedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessLogResponseDtoImpl implements _AccessLogResponseDto {
  const _$AccessLogResponseDtoImpl({
    required this.id,
    required this.userId,
    this.userName,
    required this.gymId,
    this.gymName,
    required this.subscriptionId,
    required this.accessType,
    required this.accessMethod,
    required this.result,
    this.denialReason,
    this.verifiedByStaffId,
    this.verifiedByStaffName,
    this.deviceId,
    required this.accessedAt,
  });

  factory _$AccessLogResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessLogResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? userName;
  @override
  final String gymId;
  @override
  final String? gymName;
  @override
  final String subscriptionId;
  @override
  final String accessType;
  @override
  final String accessMethod;
  @override
  final String result;
  @override
  final String? denialReason;
  @override
  final String? verifiedByStaffId;
  @override
  final String? verifiedByStaffName;
  @override
  final String? deviceId;
  @override
  final String accessedAt;

  @override
  String toString() {
    return 'AccessLogResponseDto(id: $id, userId: $userId, userName: $userName, gymId: $gymId, gymName: $gymName, subscriptionId: $subscriptionId, accessType: $accessType, accessMethod: $accessMethod, result: $result, denialReason: $denialReason, verifiedByStaffId: $verifiedByStaffId, verifiedByStaffName: $verifiedByStaffName, deviceId: $deviceId, accessedAt: $accessedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessLogResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.gymId, gymId) || other.gymId == gymId) &&
            (identical(other.gymName, gymName) || other.gymName == gymName) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.accessType, accessType) ||
                other.accessType == accessType) &&
            (identical(other.accessMethod, accessMethod) ||
                other.accessMethod == accessMethod) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.denialReason, denialReason) ||
                other.denialReason == denialReason) &&
            (identical(other.verifiedByStaffId, verifiedByStaffId) ||
                other.verifiedByStaffId == verifiedByStaffId) &&
            (identical(other.verifiedByStaffName, verifiedByStaffName) ||
                other.verifiedByStaffName == verifiedByStaffName) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.accessedAt, accessedAt) ||
                other.accessedAt == accessedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    userName,
    gymId,
    gymName,
    subscriptionId,
    accessType,
    accessMethod,
    result,
    denialReason,
    verifiedByStaffId,
    verifiedByStaffName,
    deviceId,
    accessedAt,
  );

  /// Create a copy of AccessLogResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessLogResponseDtoImplCopyWith<_$AccessLogResponseDtoImpl>
  get copyWith =>
      __$$AccessLogResponseDtoImplCopyWithImpl<_$AccessLogResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessLogResponseDtoImplToJson(this);
  }
}

abstract class _AccessLogResponseDto implements AccessLogResponseDto {
  const factory _AccessLogResponseDto({
    required final String id,
    required final String userId,
    final String? userName,
    required final String gymId,
    final String? gymName,
    required final String subscriptionId,
    required final String accessType,
    required final String accessMethod,
    required final String result,
    final String? denialReason,
    final String? verifiedByStaffId,
    final String? verifiedByStaffName,
    final String? deviceId,
    required final String accessedAt,
  }) = _$AccessLogResponseDtoImpl;

  factory _AccessLogResponseDto.fromJson(Map<String, dynamic> json) =
      _$AccessLogResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get userName;
  @override
  String get gymId;
  @override
  String? get gymName;
  @override
  String get subscriptionId;
  @override
  String get accessType;
  @override
  String get accessMethod;
  @override
  String get result;
  @override
  String? get denialReason;
  @override
  String? get verifiedByStaffId;
  @override
  String? get verifiedByStaffName;
  @override
  String? get deviceId;
  @override
  String get accessedAt;

  /// Create a copy of AccessLogResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessLogResponseDtoImplCopyWith<_$AccessLogResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AccessLogListResponseDto _$AccessLogListResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _AccessLogListResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AccessLogListResponseDto {
  List<AccessLogResponseDto> get items => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;

  /// Serializes this AccessLogListResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessLogListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessLogListResponseDtoCopyWith<AccessLogListResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessLogListResponseDtoCopyWith<$Res> {
  factory $AccessLogListResponseDtoCopyWith(
    AccessLogListResponseDto value,
    $Res Function(AccessLogListResponseDto) then,
  ) = _$AccessLogListResponseDtoCopyWithImpl<$Res, AccessLogListResponseDto>;
  @useResult
  $Res call({
    List<AccessLogResponseDto> items,
    int total,
    int page,
    int limit,
    int totalPages,
    bool hasNextPage,
    bool hasPreviousPage,
  });
}

/// @nodoc
class _$AccessLogListResponseDtoCopyWithImpl<
  $Res,
  $Val extends AccessLogListResponseDto
>
    implements $AccessLogListResponseDtoCopyWith<$Res> {
  _$AccessLogListResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessLogListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<AccessLogResponseDto>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            hasNextPage: null == hasNextPage
                ? _value.hasNextPage
                : hasNextPage // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasPreviousPage: null == hasPreviousPage
                ? _value.hasPreviousPage
                : hasPreviousPage // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccessLogListResponseDtoImplCopyWith<$Res>
    implements $AccessLogListResponseDtoCopyWith<$Res> {
  factory _$$AccessLogListResponseDtoImplCopyWith(
    _$AccessLogListResponseDtoImpl value,
    $Res Function(_$AccessLogListResponseDtoImpl) then,
  ) = __$$AccessLogListResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AccessLogResponseDto> items,
    int total,
    int page,
    int limit,
    int totalPages,
    bool hasNextPage,
    bool hasPreviousPage,
  });
}

/// @nodoc
class __$$AccessLogListResponseDtoImplCopyWithImpl<$Res>
    extends
        _$AccessLogListResponseDtoCopyWithImpl<
          $Res,
          _$AccessLogListResponseDtoImpl
        >
    implements _$$AccessLogListResponseDtoImplCopyWith<$Res> {
  __$$AccessLogListResponseDtoImplCopyWithImpl(
    _$AccessLogListResponseDtoImpl _value,
    $Res Function(_$AccessLogListResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccessLogListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(
      _$AccessLogListResponseDtoImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<AccessLogResponseDto>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        hasNextPage: null == hasNextPage
            ? _value.hasNextPage
            : hasNextPage // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPreviousPage: null == hasPreviousPage
            ? _value.hasPreviousPage
            : hasPreviousPage // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessLogListResponseDtoImpl implements _AccessLogListResponseDto {
  const _$AccessLogListResponseDtoImpl({
    required final List<AccessLogResponseDto> items,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  }) : _items = items;

  factory _$AccessLogListResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessLogListResponseDtoImplFromJson(json);

  final List<AccessLogResponseDto> _items;
  @override
  List<AccessLogResponseDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;
  @override
  final bool hasNextPage;
  @override
  final bool hasPreviousPage;

  @override
  String toString() {
    return 'AccessLogListResponseDto(items: $items, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessLogListResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    total,
    page,
    limit,
    totalPages,
    hasNextPage,
    hasPreviousPage,
  );

  /// Create a copy of AccessLogListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessLogListResponseDtoImplCopyWith<_$AccessLogListResponseDtoImpl>
  get copyWith =>
      __$$AccessLogListResponseDtoImplCopyWithImpl<
        _$AccessLogListResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessLogListResponseDtoImplToJson(this);
  }
}

abstract class _AccessLogListResponseDto implements AccessLogListResponseDto {
  const factory _AccessLogListResponseDto({
    required final List<AccessLogResponseDto> items,
    required final int total,
    required final int page,
    required final int limit,
    required final int totalPages,
    required final bool hasNextPage,
    required final bool hasPreviousPage,
  }) = _$AccessLogListResponseDtoImpl;

  factory _AccessLogListResponseDto.fromJson(Map<String, dynamic> json) =
      _$AccessLogListResponseDtoImpl.fromJson;

  @override
  List<AccessLogResponseDto> get items;
  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;
  @override
  bool get hasNextPage;
  @override
  bool get hasPreviousPage;

  /// Create a copy of AccessLogListResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessLogListResponseDtoImplCopyWith<_$AccessLogListResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
