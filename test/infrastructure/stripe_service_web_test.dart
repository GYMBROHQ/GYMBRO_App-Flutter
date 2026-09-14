import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymbro/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('web bootstrap reaches the real initial home UI', (tester) async {
    if (!kIsWeb) {
      return;
    }

    SharedPreferences.setMockInitialValues({});
    await app.main();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 2));

    expect(
      find.text('Your Fitness Journey, Unlimited Possibilities'),
      findsOneWidget,
    );
  });
}
