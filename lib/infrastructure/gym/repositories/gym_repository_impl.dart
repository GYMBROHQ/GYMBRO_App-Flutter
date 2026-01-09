import 'package:dio/dio.dart';
import '../../../domain/gym/entities/gym.dart';
import '../../../domain/gym/ports/gym_repository_port.dart';
import '../../../domain/gym/value_objects/geo_location.dart';
import '../../../domain/gym/value_objects/gym_filters.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/response/paginated_gyms_dto.dart';
import '../dtos/response/gym_summary_dto.dart';
import '../mappers/gym_dto_mapper.dart';

/// Implementation of GymRepositoryPort using Dio
class GymRepositoryImpl implements GymRepositoryPort {
  final Dio _dio;

  GymRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<PaginatedGymsResponse> browseGyms({
    GymFilters? filters,
    GeoLocation? location,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      // Build query parameters
      final queryParams = <String, dynamic>{
        'page': page,
        'pageSize': pageSize,
      };

      // Add location parameters
      if (location != null) {
        queryParams['lat'] = location.latitude;
        queryParams['lng'] = location.longitude;
        if (location.radiusKm != null) {
          queryParams['radius'] = location.radiusKm;
        }
      }

      // Add filter parameters
      if (filters != null) {
        if (filters.maxRadius != null) {
          queryParams['radius'] = filters.maxRadius;
        }
        if (filters.isOpenNow != null) {
          queryParams['isOpen'] = filters.isOpenNow;
        }
        if (filters.maxPriceLevel != null) {
          queryParams['priceLevel'] = filters.maxPriceLevel;
        }
        if (filters.featuredOnly != null) {
          queryParams['featured'] = filters.featuredOnly;
        }
      }

      final response = await _dio.get(
        ApiEndpoints.browseGyms,
        queryParameters: queryParams,
      );

      final dto = PaginatedGymsDto.fromJson(response.data as Map<String, dynamic>);
      return GymDtoMapper.mapPaginatedGyms(dto);
    } on DioException catch (e) {
      throw Exception('Failed to browse gyms: ${e.message}');
    } catch (e) {
      throw Exception('Failed to browse gyms: $e');
    }
  }

  @override
  Future<Gym?> getGymById(String id) async {
    try {
      final response = await _dio.get(ApiEndpoints.gymDetails(id));

      final dto = GymSummaryDto.fromJson(response.data as Map<String, dynamic>);
      return GymDtoMapper.mapGymSummary(dto);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw Exception('Failed to get gym details: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get gym details: $e');
    }
  }
}
