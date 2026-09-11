import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymbro/infrastructure/presentation/config/theme/app_colors.dart';
import 'package:gymbro/infrastructure/presentation/config/theme/app_theme.dart';

void main() {
  test('light and dark themes expose their configured visual contracts', () {
    final light = AppTheme.lightTheme;
    final dark = AppTheme.darkTheme;

    expect(light.brightness, Brightness.light);
    expect(dark.brightness, Brightness.dark);
    expect(light.useMaterial3, isTrue);
    expect(dark.useMaterial3, isTrue);
    expect(light.scaffoldBackgroundColor, AppColors.backgroundPrimary);
    expect(
      dark.pageTransitionsTheme.builders[TargetPlatform.android],
      isA<CupertinoPageTransitionsBuilder>(),
    );
    expect(
      dark.pageTransitionsTheme.builders[TargetPlatform.iOS],
      isA<CupertinoPageTransitionsBuilder>(),
    );
  });
}
