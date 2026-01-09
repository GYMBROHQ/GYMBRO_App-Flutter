import '../entities/plan.dart';

/// Repository interface for managing gym plans
abstract class PlanRepository {
  /// Get all active plans for a specific gym
  Future<List<Plan>> getPlansForGym(String gymId);

  /// Get a specific plan by ID
  Future<Plan> getPlanById(String gymId, String planId);
}
