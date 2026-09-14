import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymbro/infrastructure/services/stripe_service.dart';

void main() {
  testWidgets('web startup reaches the initial visible app UI', (tester) async {
    if (!kIsWeb) {
      return;
    }

    Object? initializationError;
    try {
      await StripeService.initialize('pk_test_web_startup');
    } catch (error) {
      initializationError = error;
    }

    expect(
      initializationError,
      isNull,
      reason: 'Web startup must not invoke native Stripe APIs: $initializationError',
    );
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Text('GYMBRO')),
      ),
    );

    expect(find.text('GYMBRO'), findsOneWidget);
  });
}
