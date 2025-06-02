import 'dart:math';
import 'package:flutter/material.dart';

/// Scales the given [pixel] value based on the device screen size (both width and height)
/// to maintain consistent proportions across different devices [oai_citation:0‡medium.com](https://medium.com/@RotenKiwi/responsiveness-in-flutter-the-right-way-4f822d244aac#::text=Logical%20Pixels%20promise%20you%20that,This%20number%28logical%20pixel%29%20might) [oai_citation:1‡api.flutter.dev](https://api.flutter.dev/flutter/widgets/MediaQueryData-class.html#::text=For%20example%2C%20the%20MediaQueryData,height%20of%20the%20current%20window).
/// This uses a reference design size (default 375x812) and computes a scale factor
/// from the screen's diagonal to incorporate both width and height. The result is then
/// clamped between [min] and [max] to avoid extreme values [oai_citation:2‡medium.com](https://medium.com/@RotenKiwi/responsiveness-in-flutter-the-right-way-4f822d244aac#:~:text=Constraint%20are%20used%20to%20specify,big%20on%20different%20screen%20sizes).
///
/// The [pixel] parameter represents the design-intended pixel (e.g., from a Figma mockup).
/// [context] provides the current screen dimensions via MediaQuery [oai_citation:3‡api.flutter.dev](https://api.flutter.dev/flutter/widgets/MediaQueryData-class.html#:~:text=For%20example%2C%20the%20MediaQueryData,height%20of%20the%20current%20window).
/// [min] and [max] specify optional lower/upper bounds (default to 0 and infinity).
///
/// Example usage:
///   double fontSize = respPixel(16, context, min: 12, max: 24); // responsive font size
///   EdgeInsets padding = EdgeInsets.all(respPixel(8, context, min: 4, max: 16)); // responsive padding
///   Icon responsiveIcon = Icon(Icons.star, size: respPixel(24, context, min: 12, max: 48)); // responsive icon
///
/// By using both dimensions (via diagonal scaling), the function avoids issues where
/// using only width or height would distort proportions on unusually shaped screens.
/// It aligns with Flutter’s logical pixel system for consistent physical sizing [oai_citation:4‡medium.com](https://medium.com/@RotenKiwi/responsiveness-in-flutter-the-right-way-4f822d244aac#:~:text=Logical%20Pixels%20promise%20you%20that,This%20number%28logical%20pixel%29%20might),
/// and applies constraints similar to Flutter’s layout constraints to prevent items
/// from becoming too small or large [oai_citation:5‡medium.com](https://medium.com/@RotenKiwi/responsiveness-in-flutter-the-right-way-4f822d244aac#:~:text=Constraint%20are%20used%20to%20specify,big%20on%20different%20screen%20sizes).
double respPixel(
    BuildContext context,double pixel, {
      double baseWidth = 375.0,
      double baseHeight = 812.0,
      double min = 0,
      double max = double.infinity,
    }) {
  final Size screenSize = MediaQuery.of(context).size;
  // Calculate diagonal lengths (both width and height are considered)
  final double screenDiagonal = sqrt(screenSize.width * screenSize.width +
      screenSize.height * screenSize.height);
  final double baseDiagonal = sqrt(baseWidth * baseWidth + baseHeight * baseHeight);
  // Compute scale factor using diagonal ratio
  final double scale = screenDiagonal / baseDiagonal;
  // Apply scaling and clamp to [min, max]
  final double scaled = pixel * scale;
  return scaled.clamp(min, max);
}