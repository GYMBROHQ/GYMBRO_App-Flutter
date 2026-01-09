// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_log_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessLogResponseDtoImpl _$$AccessLogResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AccessLogResponseDtoImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String?,
  gymId: json['gymId'] as String,
  gymName: json['gymName'] as String?,
  subscriptionId: json['subscriptionId'] as String,
  accessType: json['accessType'] as String,
  accessMethod: json['accessMethod'] as String,
  result: json['result'] as String,
  denialReason: json['denialReason'] as String?,
  verifiedByStaffId: json['verifiedByStaffId'] as String?,
  verifiedByStaffName: json['verifiedByStaffName'] as String?,
  deviceId: json['deviceId'] as String?,
  accessedAt: json['accessedAt'] as String,
);

Map<String, dynamic> _$$AccessLogResponseDtoImplToJson(
  _$AccessLogResponseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'userName': instance.userName,
  'gymId': instance.gymId,
  'gymName': instance.gymName,
  'subscriptionId': instance.subscriptionId,
  'accessType': instance.accessType,
  'accessMethod': instance.accessMethod,
  'result': instance.result,
  'denialReason': instance.denialReason,
  'verifiedByStaffId': instance.verifiedByStaffId,
  'verifiedByStaffName': instance.verifiedByStaffName,
  'deviceId': instance.deviceId,
  'accessedAt': instance.accessedAt,
};

_$AccessLogListResponseDtoImpl _$$AccessLogListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AccessLogListResponseDtoImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => AccessLogResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNextPage: json['hasNextPage'] as bool,
  hasPreviousPage: json['hasPreviousPage'] as bool,
);

Map<String, dynamic> _$$AccessLogListResponseDtoImplToJson(
  _$AccessLogListResponseDtoImpl instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
  'hasNextPage': instance.hasNextPage,
  'hasPreviousPage': instance.hasPreviousPage,
};
