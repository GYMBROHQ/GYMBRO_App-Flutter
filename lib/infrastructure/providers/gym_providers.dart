import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/gym/state/gym_browse_notifier.dart';
import '../../application/gym/state/gym_browse_state.dart';
import '../../domain/gym/ports/gym_repository_port.dart';
import '../../domain/gym/value_objects/geo_location.dart';
import '../gym/repositories/gym_repository_impl.dart';
import '../services/location_service.dart';
import 'core_providers.dart';

/// Provider for gym repository
final gymRepositoryProvider = Provider<GymRepositoryPort>((ref) {
  final dio = ref.watch(baseDioProvider);
  return GymRepositoryImpl(dio: dio);
});

/// Provider for location service
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// Provider for selected/current location
final selectedLocationProvider = StateProvider<GeoLocation?>((ref) => null);

/// Provider for gym browse notifier
final gymBrowseNotifierProvider =
    StateNotifierProvider<GymBrowseNotifier, GymBrowseState>((ref) {
  final repository = ref.watch(gymRepositoryProvider);
  return GymBrowseNotifier(repository);
});

/// Selector for checking if gyms are loaded
final hasGymsProvider = Provider<bool>((ref) {
  final state = ref.watch(gymBrowseNotifierProvider);
  return state is GymBrowseLoaded && state.gyms.isNotEmpty;
});

/// Selector for checking if loading
final isLoadingGymsProvider = Provider<bool>((ref) {
  final state = ref.watch(gymBrowseNotifierProvider);
  return state is GymBrowseLoading;
});
