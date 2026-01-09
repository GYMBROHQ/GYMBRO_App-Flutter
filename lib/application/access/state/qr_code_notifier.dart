import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/access/entities/qr_code.dart';
import '../../../domain/access/repositories/access_repository.dart';
import '../../../infrastructure/access/repositories/access_repository_impl.dart';
import '../../../infrastructure/providers/auth_providers.dart';

part 'qr_code_notifier.g.dart';

/// Provider for AccessRepository
@riverpod
AccessRepository accessRepository(AccessRepositoryRef ref) {
  final dio = ref.read(authenticatedDioProvider);
  return AccessRepositoryImpl(dio: dio);
}

/// State for QR code generation
sealed class QRCodeState {
  const QRCodeState();
}

class QRCodeInitial extends QRCodeState {
  const QRCodeInitial();
}

class QRCodeLoading extends QRCodeState {
  const QRCodeLoading();
}

class QRCodeGenerated extends QRCodeState {
  final QRCode qrCode;
  final int secondsRemaining;

  const QRCodeGenerated({
    required this.qrCode,
    required this.secondsRemaining,
  });
}

class QRCodeExpired extends QRCodeState {
  const QRCodeExpired();
}

class QRCodeError extends QRCodeState {
  final String message;

  const QRCodeError(this.message);
}

/// Notifier for managing QR code generation with countdown timer
@riverpod
class QRCodeGenerator extends _$QRCodeGenerator {
  Timer? _countdownTimer;

  @override
  QRCodeState build() {
    ref.onDispose(() {
      _countdownTimer?.cancel();
    });
    return const QRCodeInitial();
  }

  /// Generate a new QR code
  Future<void> generateQRCode({
    required String subscriptionId,
    required String gymId,
    required String deviceFingerprint,
  }) async {
    state = const QRCodeLoading();

    try {
      final repository = ref.read(accessRepositoryProvider);
      final request = GenerateQRRequest(
        subscriptionId: subscriptionId,
        gymId: gymId,
        deviceFingerprint: deviceFingerprint,
      );

      final qrCode = await repository.generateQRCode(request);
      _startCountdown(qrCode);
    } catch (e) {
      state = QRCodeError(e.toString());
    }
  }

  /// Start countdown timer for QR code expiry
  void _startCountdown(QRCode qrCode) {
    _countdownTimer?.cancel();

    final secondsRemaining = qrCode.secondsRemaining;
    state = QRCodeGenerated(
      qrCode: qrCode,
      secondsRemaining: secondsRemaining,
    );

    if (secondsRemaining <= 0) {
      state = const QRCodeExpired();
      return;
    }

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state;
      if (currentState is! QRCodeGenerated) {
        timer.cancel();
        return;
      }

      final newSecondsRemaining = currentState.secondsRemaining - 1;

      if (newSecondsRemaining <= 0) {
        timer.cancel();
        state = const QRCodeExpired();
      } else {
        state = QRCodeGenerated(
          qrCode: currentState.qrCode,
          secondsRemaining: newSecondsRemaining,
        );
      }
    });
  }

  /// Reset to initial state
  void reset() {
    _countdownTimer?.cancel();
    state = const QRCodeInitial();
  }
}
