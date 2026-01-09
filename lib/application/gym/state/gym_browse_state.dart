import '../../../domain/gym/entities/gym.dart';
import '../../../domain/gym/value_objects/geo_location.dart';
import '../../../domain/gym/value_objects/gym_filters.dart';

/// Base class for gym browse states
sealed class GymBrowseState {
  const GymBrowseState();
}

/// Initial state
class GymBrowseInitial extends GymBrowseState {
  const GymBrowseInitial();
}

/// Loading state
class GymBrowseLoading extends GymBrowseState {
  const GymBrowseLoading();
}

/// Loaded state with gyms
class GymBrowseLoaded extends GymBrowseState {
  final List<Gym> gyms;
  final GymFilters filters;
  final GeoLocation? userLocation;
  final int currentPage;
  final int totalPages;
  final bool hasMore;

  const GymBrowseLoaded({
    required this.gyms,
    required this.filters,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
    this.userLocation,
  });

  GymBrowseLoaded copyWith({
    List<Gym>? gyms,
    GymFilters? filters,
    GeoLocation? userLocation,
    int? currentPage,
    int? totalPages,
    bool? hasMore,
  }) {
    return GymBrowseLoaded(
      gyms: gyms ?? this.gyms,
      filters: filters ?? this.filters,
      userLocation: userLocation ?? this.userLocation,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// Error state
class GymBrowseError extends GymBrowseState {
  final String message;

  const GymBrowseError(this.message);
}
