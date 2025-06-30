
import 'package:flutter/cupertino.dart';

enum LineAlignment { center, left, right }

Text patternedLine({
  required double screenWidth,
  required TextStyle textStyle,
  required String text,
  LineAlignment alignment = LineAlignment.center,
  String pattern = '', // Default
  double charWidth = 6.0,
  // Additional Text widget parameters
  TextAlign? textAlign,
  TextOverflow? overflow,
  int? maxLines,
  bool? softWrap,
  TextDirection? textDirection,
  double? textScaleFactor,
  TextWidthBasis? textWidthBasis,
  Locale? locale,
  StrutStyle? strutStyle,
}) {
  final rawText = text.trim();

  // Measure actual text width
  final textPainter = TextPainter(
    text: TextSpan(text: rawText, style: textStyle),
    textDirection: textDirection ?? TextDirection.ltr,
    textScaleFactor: textScaleFactor ?? 1.0,
  )..layout(minWidth: 0, maxWidth: screenWidth);

  final textWidth = textPainter.size.width;
  final remaining = screenWidth - textWidth;

  // Calculate pattern repeat count
  final totalPatternCount = (remaining / charWidth).floor();
  String line;

  switch (alignment) {
    case LineAlignment.center:
      final sidePattern = (totalPatternCount / 2).floor();
      line = pattern * sidePattern + text + pattern * sidePattern;
      break;

    case LineAlignment.left:
      line = text + pattern * totalPatternCount;
      break;

    case LineAlignment.right:
      line = pattern * totalPatternCount + text;
      break;
  }

  return Text(
    line,
    style: textStyle,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    softWrap: softWrap,
    textDirection: textDirection,
    textScaleFactor: textScaleFactor,
    textWidthBasis: textWidthBasis,
    locale: locale,
    strutStyle: strutStyle,
  );
}
