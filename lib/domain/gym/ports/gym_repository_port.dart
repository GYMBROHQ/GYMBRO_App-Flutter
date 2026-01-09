import '../entities/gym.dart';
import '../value_objects/geo_location.dart';
import '../value_objects/gym_filters.dart';

/// Paginated response wrapper
class PaginatedGymsResponse {
  final List<Gym> items;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginatedGymsResponse({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });
}

/// Repository port for gym operations
abstract class GymRepositoryPort {
  /// Browse gyms with optional filters, location, and pagination
  Future<PaginatedGymsResponse> browseGyms({
    GymFilters? filters,
    GeoLocation? location,
    int page = 1,
    int pageSize = 20,
  });

  /// Get gym details by ID
  Future<Gym?> getGymById(String id);
}
