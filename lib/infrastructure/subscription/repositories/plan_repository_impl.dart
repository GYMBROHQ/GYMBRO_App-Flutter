import 'package:dio/dio.dart';
import '../../../domain/subscription/entities/plan.dart';
import '../../../domain/subscription/repositories/plan_repository.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/response/plan_response_dto.dart';
import '../mappers/plan_mapper.dart';

/// Implementation of PlanRepository using Dio HTTP client
class PlanRepositoryImpl implements PlanRepository {
  final Dio dio;

  PlanRepositoryImpl({required this.dio});

  @override
  Future<List<Plan>> getPlansForGym(String gymId) async {
    try {
      final response = await dio.get(ApiEndpoints.gymPlans(gymId));
      final listDto = PlanListResponseDto.fromJson(response.data);
      return PlanMapper.toDomainList(listDto.plans);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load plans: $e');
    }
  }

  @override
  Future<Plan> getPlanById(String gymId, String planId) async {
    try {
      final response = await dio.get(ApiEndpoints.gymPlans(gymId));
      final listDto = PlanListResponseDto.fromJson(response.data);

      final planDto = listDto.plans.firstWhere(
        (plan) => plan.id == planId,
        orElse: () => throw Exception('Plan not found'),
      );

      return PlanMapper.toDomain(planDto);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load plan: $e');
    }
  }

  /// Handle Dio errors and convert to user-friendly exceptions
  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Request failed';
        return Exception('$message (Status: $statusCode)');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled');
      case DioExceptionType.connectionError:
        return Exception('No internet connection. Please check your network.');
      default:
        return Exception('Network error: ${e.message}');
    }
  }
}
