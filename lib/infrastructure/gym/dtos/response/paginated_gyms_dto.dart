import 'gym_summary_dto.dart';

class PaginatedGymsDto {
  final List<GymSummaryDto> items;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginatedGymsDto({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginatedGymsDto.fromJson(Map<String, dynamic> json) {
    return PaginatedGymsDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => GymSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );
  }
}
