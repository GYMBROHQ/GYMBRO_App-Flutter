import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'infrastructure/presentation/config/theme/theme.dart';

void main() {
  // Ensure Google Fonts uses Inter as the default font
  GoogleFonts.config.allowRuntimeFetching = true;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GYMBRO',
      debugShowCheckedModeBanner: false,
      // Light theme
      theme: AppTheme.lightTheme,
      // Dark theme
      darkTheme: AppTheme.darkTheme,
      // Follow system preference for theme mode
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
