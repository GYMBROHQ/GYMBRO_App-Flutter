import '../../../domain/subscription/entities/plan.dart';
import '../dtos/response/plan_response_dto.dart';

/// Mapper for converting Plan DTOs to domain entities
class PlanMapper {
  /// Convert Plan DTO to domain entity
  static Plan toDomain(PlanResponseDto dto) {
    return Plan(
      id: dto.id,
      gymId: dto.gymId,
      name: dto.name,
      description: dto.description,
      price: PlanPrice(
        amount: dto.price.amount,
        currency: dto.price.currency,
      ),
      duration: PlanDuration(
        value: dto.duration.value,
        unit: dto.duration.unit,
      ),
      features: dto.features,
      accessType: dto.accessType,
      maxVisitsPerPeriod: dto.maxVisitsPerPeriod,
      visitPeriod: dto.visitPeriod,
      isActive: dto.isActive,
      sortOrder: dto.sortOrder,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: DateTime.parse(dto.updatedAt),
    );
  }

  /// Convert list of Plan DTOs to domain entities
  static List<Plan> toDomainList(List<PlanResponseDto> dtos) {
    return dtos.map(toDomain).toList();
  }
}
