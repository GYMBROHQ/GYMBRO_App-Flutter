import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_response_dto.freezed.dart';
part 'plan_response_dto.g.dart';

/// DTO for plan price from API
@freezed
class PriceDto with _$PriceDto {
  const factory PriceDto({
    required double amount,
    required String currency,
  }) = _PriceDto;

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
}

/// DTO for plan duration from API
@freezed
class DurationDto with _$DurationDto {
  const factory DurationDto({
    required int value,
    required String unit,
  }) = _DurationDto;

  factory DurationDto.fromJson(Map<String, dynamic> json) =>
      _$DurationDtoFromJson(json);
}

/// DTO for gym plan response from API
@freezed
class PlanResponseDto with _$PlanResponseDto {
  const factory PlanResponseDto({
    required String id,
    required String gymId,
    required String name,
    required String description,
    required PriceDto price,
    required DurationDto duration,
    required List<String> features,
    required String accessType,
    int? maxVisitsPerPeriod,
    String? visitPeriod,
    required bool isActive,
    required int sortOrder,
    required String createdAt,
    required String updatedAt,
  }) = _PlanResponseDto;

  factory PlanResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlanResponseDtoFromJson(json);
}

/// DTO for list of plans from API
@freezed
class PlanListResponseDto with _$PlanListResponseDto {
  const factory PlanListResponseDto({
    required List<PlanResponseDto> plans,
    required int totalCount,
  }) = _PlanListResponseDto;

  factory PlanListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlanListResponseDtoFromJson(json);
}
