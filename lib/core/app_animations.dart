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
        ? Colors.white.withValues(alpha: 0.03) 
        : Colors.black.withValues(alpha: 0.015);
  }

  // --- Slide ---
  static const Offset slideInFromRight = Offset(1, 0);

  // --- Component Scale ---
  static const double dropdownScaleBegin = 0.95;
  static const double selectScaleBegin = 0.98;
  static const double checkboxScaleBegin = 0.5;

  // --- Fade ---
  static const double fadeBegin = 0.0;
}
