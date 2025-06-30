import 'package:flutter/material.dart';

class ScreenSizeHelper {
  static late double width;
  static late double height;
  static late Orientation orientation;
  static late double ratio;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    orientation = MediaQuery.of(context).orientation;
    ratio = width / height;
  }

  static double w(double percent) => (width / 100) * percent;
  static double h(double percent) => (height / 100) * percent;

  static double sp(double baseSize) {
    if (width < 400 || height < 500) return baseSize * 0.9;
    if (width > 800) return baseSize * 1.5;
    return baseSize;
  }

  static bool isSmallMobile() => width < 400 && height < 700;
  static bool isMediumMobile() => width >= 400 && width < 800;
  static bool isLargeScreen() => width >= 800;
}
