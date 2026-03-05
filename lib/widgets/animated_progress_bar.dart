import 'package:flutter/material.dart';

/// A custom animated progress bar widget
class AnimatedProgressBar extends StatelessWidget {
  final double progress;
  final double height;
  final Color backgroundColor;
  final Gradient? foregroundGradient;
  final Color? foregroundColor;
  final Duration duration;
  final Curve curve;

  const AnimatedProgressBar({
    Key? key,
    required this.progress,
    this.height = 8,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.foregroundGradient,
    this.foregroundColor,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOutCubic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Container(
        height: height,
        color: backgroundColor,
        child: Stack(
          children: [
            AnimatedFractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              heightFactor: 1.0,
              duration: duration,
              curve: curve,
              child: Container(
                decoration: BoxDecoration(
                  gradient: foregroundGradient ??
                      LinearGradient(
                        colors: [
                          foregroundColor ?? Colors.blue,
                          foregroundColor ?? Colors.blue,
                        ],
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
