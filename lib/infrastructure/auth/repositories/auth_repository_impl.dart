import 'package:dio/dio.dart';
import '../../../application/auth/ports/auth_repository_port.dart';
import '../../../application/auth/ports/secure_storage_port.dart';
import '../../../domain/auth/auth.dart';
import '../../core/network/api_endpoints.dart';
import '../dtos/request/login_request_dto.dart';
import '../dtos/request/register_request_dto.dart';
import '../dtos/request/refresh_token_request_dto.dart';
import '../dtos/request/mfa_request_dtos.dart';
import '../dtos/request/password_reset_request_dtos.dart';
import '../dtos/request/update_profile_request_dto.dart';
import '../dtos/response/auth_response_dto.dart';
import '../dtos/response/user_response_dto.dart';
import '../dtos/response/mfa_response_dtos.dart';
import '../mappers/auth_dto_mapper.dart';

/// Implementation of AuthRepositoryPort using Dio
class AuthRepositoryImpl implements AuthRepositoryPort {
  final Dio _dio;
  final SecureStoragePort? _secureStorage;

  AuthRepositoryImpl({
    required Dio dio,
    SecureStoragePort? secureStorage,
  })  : _dio = dio,
        _secureStorage = secureStorage;

  @override
  Future<AuthResult<LoginSuccessResult>> register({
    required String fullName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
    required DateTime termsAcceptedAt,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.register,
        data: RegisterRequestDto(
          fullName: fullName,
          email: email,
          password: password,
          dateOfBirth: dateOfBirth.toIso8601String().split('T').first,
          acceptedTerms: true,
        ).toJson(),
      );

      final dto = AuthResponseDto.fromJson(response.data as Map<String, dynamic>);
      final mapped = AuthDtoMapper.mapAuthResponse(dto);

      return AuthSuccess(LoginSuccessResult(
        tokens: mapped.tokens,
        user: mapped.user,
      ));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Registration failed: $e');
    }
  }

  @override
  Future<AuthResult<LoginResult>> login({
    required String email,
    required String password,
    required String ipAddress,
    required String userAgent,
    String? deviceId,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: LoginRequestDto(
          email: email,
          password: password,
          deviceId: deviceId,
        ).toJson(),
      );

      final data = response.data as Map<String, dynamic>;

      // Check if MFA is required
      if (data['mfaRequired'] == true) {
        final mfaToken = data['mfaToken'] as String;
        return AuthSuccess(LoginMfaRequiredResult(
          challenge: AuthDtoMapper.mapMfaChallenge(mfaToken),
        ));
      }

      // Regular login success
      final dto = AuthResponseDto.fromJson(data);
      final mapped = AuthDtoMapper.mapAuthResponse(dto);

      return AuthSuccess(LoginSuccessResult(
        tokens: mapped.tokens,
        user: mapped.user,
      ));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Login failed: $e');
    }
  }

  @override
  Future<AuthResult<void>> logout({
    required String sessionId,
    required bool allDevices,
  }) async {
    try {
      final token = await _secureStorage?.getAccessToken();
      await _dio.post(
        allDevices ? ApiEndpoints.logoutAll : ApiEndpoints.logout,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return const AuthSuccess(null);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Logout failed: $e');
    }
  }

  @override
  Future<AuthResult<AuthTokens>> refreshTokens({
    required String refreshToken,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.refresh,
        data: RefreshTokenRequestDto(refreshToken: refreshToken).toJson(),
      );

      final dto = RefreshTokensResponseDto.fromJson(
        response.data as Map<String, dynamic>,
      );

      return AuthSuccess(AuthTokens(
        accessToken: dto.tokens.accessToken,
        refreshToken: dto.tokens.refreshToken,
        expiresAt: dto.tokens.accessTokenExpiresAt != null
            ? DateTime.tryParse(dto.tokens.accessTokenExpiresAt!)
            : null,
      ));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Token refresh failed: $e');
    }
  }

  @override
  Future<AuthResult<User>> getCurrentUser() async {
    try {
      final token = await _secureStorage?.getAccessToken();
      final response = await _dio.get(
        ApiEndpoints.me,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      final dto = UserResponseDto.fromJson(
        response.data as Map<String, dynamic>,
      );
      return AuthSuccess(AuthDtoMapper.mapUser(dto));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Failed to get user: $e');
    }
  }

  @override
  Future<AuthResult<MfaSetup>> initiateMfaSetup() async {
    try {
      final token = await _secureStorage?.getAccessToken();
      final response = await _dio.post(
        ApiEndpoints.mfaSetupInitiate,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      final dto = MfaSetupInitResponseDto.fromJson(
        response.data as Map<String, dynamic>,
      );
      return AuthSuccess(AuthDtoMapper.mapMfaSetup(dto));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('MFA setup initiation failed: $e');
    }
  }

  @override
  Future<AuthResult<MfaBackupCodes>> completeMfaSetup({
    required String mfaToken,
    required String totpCode,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.mfaSetupComplete,
        data: MfaSetupCompleteRequestDto(
          mfaToken: mfaToken,
          totpCode: totpCode,
        ).toJson(),
      );

      final dto = MfaSetupCompleteResponseDto.fromJson(
        response.data as Map<String, dynamic>,
      );
      return AuthSuccess(AuthDtoMapper.mapMfaBackupCodes(dto));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('MFA setup completion failed: $e');
    }
  }

  @override
  Future<AuthResult<LoginSuccessResult>> verifyMfa({
    required String mfaToken,
    required String code,
    required String ipAddress,
    required String userAgent,
    String? deviceId,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.mfaVerify,
        data: MfaVerifyRequestDto(
          mfaToken: mfaToken,
          code: code,
          deviceId: deviceId,
        ).toJson(),
      );

      final dto = AuthResponseDto.fromJson(
        response.data as Map<String, dynamic>,
      );
      final mapped = AuthDtoMapper.mapAuthResponse(dto);

      return AuthSuccess(LoginSuccessResult(
        tokens: mapped.tokens,
        user: mapped.user,
      ));
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('MFA verification failed: $e');
    }
  }

  @override
  Future<AuthResult<void>> disableMfa({
    required String password,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      final token = await _secureStorage?.getAccessToken();
      await _dio.post(
        ApiEndpoints.mfaDisable,
        data: MfaDisableRequestDto(password: password).toJson(),
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return const AuthSuccess(null);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('MFA disable failed: $e');
    }
  }

  @override
  Future<AuthResult<void>> requestPasswordReset({
    required String email,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.passwordRequestReset,
        data: RequestPasswordResetDto(email: email).toJson(),
      );
      return const AuthSuccess(null);
    } on DioException catch (e) {
      // Don't expose whether email exists
      if (e.response?.statusCode == 404) {
        return const AuthSuccess(null);
      }
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Password reset request failed: $e');
    }
  }

  @override
  Future<AuthResult<void>> resetPassword({
    required String token,
    required String newPassword,
    required String ipAddress,
    required String userAgent,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.passwordReset,
        data: ResetPasswordDto(token: token, newPassword: newPassword).toJson(),
      );
      return const AuthSuccess(null);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Password reset failed: $e');
    }
  }

  @override
  Future<AuthResult<User>> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    try {
      final token = await _secureStorage?.getAccessToken();
      await _dio.patch(
        ApiEndpoints.profile,
        data: UpdateProfileRequestDto(
          fullName: fullName,
          phoneNumber: phoneNumber,
          avatarUrl: avatarUrl,
        ).toJson(),
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );

      // Fetch updated user profile
      return getCurrentUser();
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return AuthFailure('Profile update failed: $e');
    }
  }

  AuthFailure<T> _handleDioError<T>(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    String message;
    String? code;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? 'An error occurred';
      code = data['error'] as String?;
    } else {
      switch (statusCode) {
        case 400:
          message = 'Invalid request';
          break;
        case 401:
          message = 'Invalid credentials';
          break;
        case 403:
          message = 'Access denied';
          break;
        case 404:
          message = 'Not found';
          break;
        case 409:
          message = 'Email already registered';
          break;
        case 423:
          message = 'Account locked';
          break;
        case 429:
          message = 'Too many requests. Please try again later.';
          break;
        case 500:
        case 502:
        case 503:
          message = 'Server error. Please try again later.';
          break;
        default:
          message = e.message ?? 'Network error';
      }
    }

    return AuthFailure(message, code: code);
  }
}
