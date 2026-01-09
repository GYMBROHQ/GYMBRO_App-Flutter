import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/subscription/entities/plan.dart';
import '../../../domain/subscription/repositories/plan_repository.dart';
import '../../../infrastructure/subscription/repositories/plan_repository_impl.dart';
import '../../../infrastructure/core/network/api_client.dart';

part 'plans_notifier.g.dart';

/// Provider for PlanRepository
@riverpod
PlanRepository planRepository(PlanRepositoryRef ref) {
  final dio = ApiClient.createDio();
  return PlanRepositoryImpl(dio: dio);
}

/// Notifier for managing gym plans
@riverpod
class GymPlans extends _$GymPlans {
  late String _gymId;

  @override
  Future<List<Plan>> build(String gymId) async {
    _gymId = gymId;
    final repository = ref.read(planRepositoryProvider);
    return await repository.getPlansForGym(gymId);
  }

  /// Refresh the plans list
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(_gymId));
  }

  /// Get a specific plan by ID
  Future<Plan?> getPlanById(String planId) async {
    return state.when(
      data: (plans) => plans.firstWhere(
        (plan) => plan.id == planId,
        orElse: () => throw Exception('Plan not found'),
      ),
      loading: () => throw Exception('Plans are still loading'),
      error: (error, _) => throw error,
    );
  }
}
