import 'package:flutter/material.dart';

/// Light theme configuration
ThemeData lightTheme() {
  const darkBlue = Color(0xFF1565C0);
  const tealAccent = Color(0xFF00BFA5);
  const lightGray = Color(0xFFF5F5F5);
  const textPrimary = Color(0xFF212121);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: darkBlue,
    scaffoldBackgroundColor: lightGray,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      iconTheme: const IconThemeData(color: textPrimary),
    ),
    colorScheme: ColorScheme.light(
      primary: darkBlue,
      secondary: tealAccent,
      surface: Colors.white,
      background: lightGray,
      tertiary: const Color(0xFFE3F2FD),
      outline: Colors.grey.shade300,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -1.5,
      ),
      displayMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.5,
      ),
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimary.withOpacity(0.7),
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: tealAccent, width: 2),
      ),
      labelStyle: TextStyle(
        color: textPrimary.withOpacity(0.7),
        fontSize: 14,
      ),
      hintStyle: TextStyle(
        color: textPrimary.withOpacity(0.5),
        fontSize: 14,
      ),
    ),
  );
}

/// Dark theme configuration
ThemeData darkTheme() {
  const darkNavy = Color(0xFF0D1B2A);
  const deepTeal = Color(0xFF00BFA5);
  const darkBackground = Color(0xFF1A263A);
  const textLight = Color(0xFFFFFFFF);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: deepTeal,
    scaffoldBackgroundColor: darkNavy,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: textLight,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      iconTheme: const IconThemeData(color: textLight),
    ),
    colorScheme: ColorScheme.dark(
      primary: deepTeal,
      secondary: deepTeal,
      surface: darkBackground,
      background: darkNavy,
      tertiary: const Color(0xFF1A3A3A),
      outline: Colors.grey.shade700,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textLight,
        letterSpacing: -1.5,
      ),
      displayMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textLight,
        letterSpacing: -0.5,
      ),
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textLight,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textLight.withOpacity(0.7),
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: darkNavy,
        letterSpacing: 0.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: deepTeal,
        foregroundColor: darkNavy,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkBackground.withOpacity(0.8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: deepTeal, width: 2),
      ),
      labelStyle: TextStyle(
        color: textLight.withOpacity(0.7),
        fontSize: 14,
      ),
      hintStyle: TextStyle(
        color: textLight.withOpacity(0.5),
        fontSize: 14,
      ),
    ),
  );
}

/// Color palette for light mode
class LightColorPalette {
  static const Color primary = Color(0xFF1565C0);
  static const Color tealAccent = Color(0xFF00BFA5);
  static const Color gradientStart = Color(0xFF1565C0);
  static const Color gradientEnd = Color(0xFF00BFA5);
  static const Color glassLight = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color backgroundGradientStart = Color(0xFFE3F2FD);
  static const Color backgroundGradientMiddle = Color(0xFFF5F5F5);
  static const Color backgroundGradientEnd = Color(0xFFE0F2F1);
}

/// Color palette for dark mode
class DarkColorPalette {
  static const Color primary = Color(0xFF0D1B2A);
  static const Color tealAccent = Color(0xFF00BFA5);
  static const Color gradientStart = Color(0xFF0D1B2A);
  static const Color gradientEnd = Color(0xFF1A3A3A);
  static const Color glassDark = Color(0xFF1A263A);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color backgroundGradientStart = Color(0xFF0D1B2A);
  static const Color backgroundGradientMiddle = Color(0xFF1A263A);
  static const Color backgroundGradientEnd = Color(0xFF162A3C);
}
