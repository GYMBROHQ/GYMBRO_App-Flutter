import 'package:dio/dio.dart';
import '../../../domain/subscription/entities/subscription.dart';
import '../../../domain/subscription/repositories/subscription_repository.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/request/subscribe_to_plan_request_dto.dart';
import '../dtos/request/apply_promo_code_request_dto.dart';
import '../dtos/response/subscription_response_dto.dart';
import '../dtos/response/subscription_history_response_dto.dart';
import '../dtos/response/promo_code_result_dto.dart';
import '../mappers/subscription_mapper.dart';

/// Implementation of SubscriptionRepository using Dio HTTP client
class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final Dio dio;

  SubscriptionRepositoryImpl({required this.dio});

  @override
  Future<List<Subscription>> getUserSubscriptions({bool activeOnly = false}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.subscriptions,
        queryParameters: {'activeOnly': activeOnly},
      );
      final listDto = SubscriptionListResponseDto.fromJson(response.data);
      return SubscriptionMapper.toDomainList(listDto.subscriptions);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load subscriptions: $e');
    }
  }

  @override
  Future<Subscription> getSubscriptionById(String subscriptionId) async {
    try {
      final response = await dio.get(ApiEndpoints.subscriptionDetails(subscriptionId));
      final dto = SubscriptionResponseDto.fromJson(response.data);
      return SubscriptionMapper.toDomain(dto);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load subscription: $e');
    }
  }

  @override
  Future<Subscription> subscribeToPlan(SubscribeToPlanRequest request) async {
    try {
      final requestDto = SubscribeToPlanRequestDto(
        gymId: request.gymId,
        planId: request.planId,
        paymentMethodId: request.paymentMethodId,
        promoCode: request.promoCode,
        startDate: request.startDate?.toIso8601String(),
        paymentMethodType: request.paymentMethodType,
      );

      final response = await dio.post(
        ApiEndpoints.subscriptions,
        data: requestDto.toJson(),
      );

      final resultDto = SubscriptionResultDto.fromJson(response.data);
      return SubscriptionMapper.toDomain(resultDto.subscription);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to subscribe: $e');
    }
  }

  @override
  Future<void> cancelSubscription(String subscriptionId, String reason) async {
    try {
      final requestDto = CancelSubscriptionRequestDto(reason: reason);
      await dio.post(
        ApiEndpoints.cancelSubscription(subscriptionId),
        data: requestDto.toJson(),
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to cancel subscription: $e');
    }
  }

  @override
  Future<Subscription> renewSubscription(RenewSubscriptionRequest request) async {
    try {
      final requestDto = RenewSubscriptionRequestDto(
        paymentMethodId: request.paymentMethodId,
      );

      final response = await dio.post(
        ApiEndpoints.renewSubscription(request.subscriptionId),
        data: requestDto.toJson(),
      );

      final resultDto = SubscriptionResultDto.fromJson(response.data);
      return SubscriptionMapper.toDomain(resultDto.subscription);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to renew subscription: $e');
    }
  }

  @override
  Future<void> pauseSubscription(String subscriptionId, String reason) async {
    try {
      final requestDto = PauseSubscriptionRequestDto(reason: reason);
      await dio.post(
        ApiEndpoints.pauseSubscription(subscriptionId),
        data: requestDto.toJson(),
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to pause subscription: $e');
    }
  }

  @override
  Future<void> resumeSubscription(String subscriptionId) async {
    try {
      await dio.post(ApiEndpoints.resumeSubscription(subscriptionId));
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to resume subscription: $e');
    }
  }

  @override
  Future<SubscriptionHistoryResult> getSubscriptionHistory({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.subscriptionHistory,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final listDto = SubscriptionHistoryListDto.fromJson(response.data);
      return SubscriptionHistoryResult(
        history: SubscriptionMapper.historyToDomainList(listDto.history),
        totalCount: listDto.totalCount,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load subscription history: $e');
    }
  }

  @override
  Future<PromoCodeResult> applyPromoCode(String subscriptionId, String promoCode) async {
    try {
      final requestDto = ApplyPromoCodeRequestDto(promoCode: promoCode);
      final response = await dio.post(
        ApiEndpoints.applyPromoCode(subscriptionId),
        data: requestDto.toJson(),
      );

      final dto = PromoCodeResultDto.fromJson(response.data);
      return PromoCodeResult(
        promoCode: dto.promoCode,
        discountAmount: dto.discountAmount,
        originalPrice: dto.originalPrice,
        finalPrice: dto.finalPrice,
        message: dto.message,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to apply promo code: $e');
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
