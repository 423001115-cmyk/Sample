import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A reusable gradient background widget for the app
class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool isDarkMode;

  const GradientBackground({
    Key? key,
    required this.child,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [
                  DarkColorPalette.backgroundGradientStart,
                  DarkColorPalette.backgroundGradientMiddle,
                  DarkColorPalette.backgroundGradientEnd,
                ]
              : [
                  LightColorPalette.backgroundGradientStart,
                  LightColorPalette.backgroundGradientMiddle,
                  LightColorPalette.backgroundGradientEnd,
                ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: child,
    );
  }
}
