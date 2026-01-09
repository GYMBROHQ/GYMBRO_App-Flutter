import 'package:dio/dio.dart';
import '../../../domain/subscription/entities/payment_method.dart';
import '../../../domain/subscription/repositories/payment_method_repository.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/response/payment_method_response_dto.dart';
import '../mappers/payment_method_mapper.dart';

/// Implementation of PaymentMethodRepository using Dio HTTP client
class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final Dio dio;

  PaymentMethodRepositoryImpl({required this.dio});

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    try {
      final response = await dio.get(ApiEndpoints.paymentMethods);
      final listDto = PaymentMethodListDto.fromJson(response.data);

      // Extract default payment method ID from customer if available
      // Note: This may need adjustment based on actual API response structure
      String? defaultPaymentMethodId;
      // TODO: Get default payment method ID from user/customer endpoint

      return PaymentMethodMapper.toDomainList(
        listDto.methods,
        defaultPaymentMethodId: defaultPaymentMethodId,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load payment methods: $e');
    }
  }

  @override
  Future<String> createSetupIntent() async {
    try {
      final response = await dio.post(ApiEndpoints.setupIntent);
      final dto = SetupIntentDto.fromJson(response.data);
      return dto.clientSecret;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to create setup intent: $e');
    }
  }

  @override
  Future<void> removePaymentMethod(String paymentMethodId) async {
    try {
      await dio.delete(ApiEndpoints.removePaymentMethod(paymentMethodId));
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to remove payment method: $e');
    }
  }

  @override
  Future<void> setDefaultPaymentMethod(String paymentMethodId) async {
    try {
      await dio.put(ApiEndpoints.setDefaultPaymentMethod(paymentMethodId));
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to set default payment method: $e');
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
