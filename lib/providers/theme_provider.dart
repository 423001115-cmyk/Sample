import 'package:flutter/material.dart';

/// Provider for managing theme state (light/dark mode)
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider();

  /// Get current theme mode
  ThemeMode get themeMode => _themeMode;

  /// Check if dark mode is enabled
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Toggle between light and dark mode
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  /// Set theme to light mode
  void setLightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  /// Set theme to dark mode
  void setDarkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
