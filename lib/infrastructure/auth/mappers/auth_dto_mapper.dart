import 'dart:convert' show jsonDecode;
import '../../../domain/auth/auth.dart';
import '../dtos/response/auth_response_dto.dart';
import '../dtos/response/user_response_dto.dart';
import '../dtos/response/mfa_response_dtos.dart';

/// Maps DTOs to domain entities and vice versa
class AuthDtoMapper {
  /// Maps UserResponseDto to User entity
  static User mapUser(UserResponseDto dto) {
    return UserFactory.create(
      id: dto.id,
      email: dto.email,
      emailVerified: dto.emailVerified,
      isMfaEnabled: dto.isMfaEnabled,
      fullName: dto.fullName,
      dateOfBirth: dto.dateOfBirth != null ? DateTime.tryParse(dto.dateOfBirth!) : null,
      phoneNumber: dto.phoneNumber,
      avatarUrl: dto.avatarUrl,
      createdAt: dto.createdAt != null ? DateTime.tryParse(dto.createdAt!) : null,
      updatedAt: dto.updatedAt != null ? DateTime.tryParse(dto.updatedAt!) : null,
    );
  }

  /// Maps AuthResponseDto to AuthTokens and User
  static ({AuthTokens tokens, User user}) mapAuthResponse(AuthResponseDto dto) {
    return (
      tokens: AuthTokens(
        accessToken: dto.tokens.accessToken,
        refreshToken: dto.tokens.refreshToken,
        expiresAt: dto.tokens.accessTokenExpiresAt != null
            ? DateTime.tryParse(dto.tokens.accessTokenExpiresAt!)
            : null,
      ),
      user: mapUser(dto.user),
    );
  }

  /// Maps MfaSetupInitResponseDto to MfaSetup entity
  static MfaSetup mapMfaSetup(MfaSetupInitResponseDto dto) {
    return MfaSetup(
      secret: dto.secret,
      qrCodeUri: dto.qrCodeUri,
      mfaToken: dto.mfaToken,
    );
  }

  /// Maps MfaSetupCompleteResponseDto to MfaBackupCodes entity
  static MfaBackupCodes mapMfaBackupCodes(MfaSetupCompleteResponseDto dto) {
    return MfaBackupCodes(codes: dto.backupCodes);
  }

  /// Maps mfaToken to MfaChallenge
  static MfaChallenge mapMfaChallenge(String mfaToken) {
    // Decode the token to extract userId and expiry (if present)
    // The backend encodes: { type, userId, secret, exp }
    try {
      final decoded = _decodeBase64Token(mfaToken);
      return MfaChallenge(
        mfaToken: mfaToken,
        userId: decoded['userId'] as String? ?? '',
        expiresAt: decoded['exp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(decoded['exp'] as int)
            : DateTime.now().add(const Duration(minutes: 5)),
      );
    } catch (_) {
      // If we can't decode, create with defaults
      return MfaChallenge(
        mfaToken: mfaToken,
        userId: '',
        expiresAt: DateTime.now().add(const Duration(minutes: 5)),
      );
    }
  }

  static Map<String, dynamic> _decodeBase64Token(String token) {
    try {
      final normalized = token.replaceAll('-', '+').replaceAll('_', '/');
      final decoded = String.fromCharCodes(
        List<int>.from(Uri.parse('data:;base64,$normalized').data!.contentAsBytes()),
      );
      return Map<String, dynamic>.from(
        (decoded.isNotEmpty) ? _parseJson(decoded) : {},
      );
    } catch (_) {
      return {};
    }
  }

  static dynamic _parseJson(String json) {
    // Simple JSON parsing for the token
    // In production, use dart:convert jsonDecode
    try {
      return jsonDecode(json);
    } catch (_) {
      return {};
    }
  }
}
