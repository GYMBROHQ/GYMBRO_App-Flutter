import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/gym/ports/gym_repository_port.dart';
import '../../../domain/gym/value_objects/geo_location.dart';
import '../../../domain/gym/value_objects/gym_filters.dart';
import 'gym_browse_state.dart';

class GymBrowseNotifier extends StateNotifier<GymBrowseState> {
  final GymRepositoryPort _repository;

  GymBrowseNotifier(this._repository) : super(const GymBrowseInitial());

  /// Load gyms with current filters and location
  Future<void> loadGyms({
    GymFilters? filters,
    GeoLocation? location,
    int page = 1,
  }) async {
    state = const GymBrowseLoading();

    try {
      final response = await _repository.browseGyms(
        filters: filters ?? GymFilters.all(),
        location: location,
        page: page,
      );

      state = GymBrowseLoaded(
        gyms: response.items,
        filters: filters ?? GymFilters.all(),
        userLocation: location,
        currentPage: response.page,
        totalPages: response.totalPages,
        hasMore: response.hasNextPage,
      );
    } catch (e) {
      state = GymBrowseError('Failed to load gyms: $e');
    }
  }

  /// Apply a filter and reload gyms
  Future<void> applyFilter(String filterName) async {
    final currentState = state;
    GeoLocation? location;

    // Preserve location from current state
    if (currentState is GymBrowseLoaded) {
      location = currentState.userLocation;
    }

    // Create filter based on name
    GymFilters filters;
    switch (filterName) {
      case 'Nearby':
        filters = GymFilters.nearby();
        break;
      case 'Featured':
        filters = GymFilters.featured();
        break;
      case '24/7':
        filters = GymFilters.open247();
        break;
      case 'Price: Low':
        filters = GymFilters.priceLow();
        break;
      case 'All':
      default:
        filters = GymFilters.all();
        break;
    }

    await loadGyms(filters: filters, location: location);
  }

  /// Update user location and reload gyms
  Future<void> updateLocation(GeoLocation? location) async {
    final currentState = state;
    GymFilters filters = GymFilters.all();

    // Preserve filters from current state
    if (currentState is GymBrowseLoaded) {
      filters = currentState.filters;
    }

    await loadGyms(filters: filters, location: location);
  }

  /// Load next page of gyms
  Future<void> loadNextPage() async {
    final currentState = state;
    if (currentState is! GymBrowseLoaded || !currentState.hasMore) {
      return;
    }

    try {
      final response = await _repository.browseGyms(
        filters: currentState.filters,
        location: currentState.userLocation,
        page: currentState.currentPage + 1,
      );

      state = currentState.copyWith(
        gyms: [...currentState.gyms, ...response.items],
        currentPage: response.page,
        totalPages: response.totalPages,
        hasMore: response.hasNextPage,
      );
    } catch (e) {
      // Keep current state but show error somehow
      // For now, just ignore pagination errors
    }
  }

  /// Refresh current list
  Future<void> refresh() async {
    final currentState = state;
    if (currentState is GymBrowseLoaded) {
      await loadGyms(
        filters: currentState.filters,
        location: currentState.userLocation,
      );
    } else {
      await loadGyms();
    }
  }
}
