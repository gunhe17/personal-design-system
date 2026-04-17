import 'package:flutter/material.dart';

class AppAnimations {
  // --- Durations ---
  static const Duration fast = Duration(milliseconds: 100);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 300);

  // --- Curves ---
  static const Curve defaultCurve = Curves.easeOut;
  static const Curve intenseCurve = Curves.easeInOut;

  // --- Interaction (Ripple/Splash) ---
  static InteractiveInkFeatureFactory get splashFactory => InkRipple.splashFactory;

  static Color splashColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark 
        ? Colors.white.withOpacity(0.03) 
        : Colors.black.withOpacity(0.015);
  }

  // --- Component Specifics ---
  static const double dropdownScaleBegin = 0.95;
  static const double dropdownFadeBegin = 0.0;
}
