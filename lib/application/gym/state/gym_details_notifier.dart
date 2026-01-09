import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/gym/entities/gym.dart';
import '../../../domain/gym/ports/gym_repository_port.dart';
import '../../../infrastructure/gym/repositories/gym_repository_impl.dart';
import '../../../infrastructure/core/network/api_client.dart';

part 'gym_details_notifier.g.dart';

/// Provider for GymRepository
@riverpod
GymRepositoryPort gymRepository(GymRepositoryRef ref) {
  final dio = ApiClient.createDio();
  return GymRepositoryImpl(dio: dio);
}

/// Notifier for managing gym details
@riverpod
class GymDetails extends _$GymDetails {
  late String _gymId;

  @override
  Future<Gym?> build(String gymId) async {
    _gymId = gymId;
    final repository = ref.read(gymRepositoryProvider);
    return await repository.getGymById(gymId);
  }

  /// Refresh gym details
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(_gymId));
  }
}
