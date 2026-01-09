import '../../../domain/gym/entities/gym.dart';
import '../../../domain/gym/value_objects/gym_address.dart';
import '../../../domain/gym/value_objects/gym_coordinates.dart';
import '../../../domain/gym/value_objects/operating_hours.dart';
import '../../../domain/gym/ports/gym_repository_port.dart';
import '../dtos/response/gym_summary_dto.dart';
import '../dtos/response/paginated_gyms_dto.dart';

class GymDtoMapper {
  /// Map GymSummaryDto to Gym entity
  static Gym mapGymSummary(GymSummaryDto dto) {
    return Gym(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      logoUrl: dto.logoUrl,
      coverPhotoUrl: dto.coverPhotoUrl,
      photos: dto.photos,
      address: _mapAddress(dto.address),
      coordinates: dto.coordinates != null ? _mapCoordinates(dto.coordinates!) : null,
      operatingHours: dto.operatingHours.map(_mapOperatingHours).toList(),
      rating: dto.rating,
      reviewCount: dto.reviewCount,
      amenities: dto.amenities,
      status: dto.status,
      priceLevel: dto.priceLevel,
      distance: dto.distance,
      distanceUnit: dto.distanceUnit,
      isOpen: dto.isOpen,
    );
  }

  /// Map PaginatedGymsDto to PaginatedGymsResponse
  static PaginatedGymsResponse mapPaginatedGyms(PaginatedGymsDto dto) {
    return PaginatedGymsResponse(
      items: dto.items.map(mapGymSummary).toList(),
      total: dto.total,
      page: dto.page,
      limit: dto.limit,
      totalPages: dto.totalPages,
      hasNextPage: dto.hasNextPage,
      hasPreviousPage: dto.hasPreviousPage,
    );
  }

  static GymAddress _mapAddress(GymAddressDto dto) {
    return GymAddress(
      street: dto.street,
      city: dto.city,
      state: dto.state,
      postalCode: dto.postalCode,
      country: dto.country,
    );
  }

  static GymCoordinates _mapCoordinates(GymCoordinatesDto dto) {
    return GymCoordinates(
      latitude: dto.latitude,
      longitude: dto.longitude,
    );
  }

  static OperatingHours _mapOperatingHours(OperatingHoursDto dto) {
    return OperatingHours(
      dayOfWeek: dto.dayOfWeek,
      dayName: dto.dayName,
      isOpen: dto.isOpen,
      openTime: dto.openTime,
      closeTime: dto.closeTime,
    );
  }
}
