import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

/// A simple “half” or “full” + offset abstraction.
///   - If `type == "half"`, it returns baseLength/2 + offset.
///   - If `type == "full"`, it returns baseLength + offset.
/// You can write `BorderMode.half + 10` or `BorderMode.full - 20`.
class BorderMode {
  final String type;   // either "full" or "half"
  final double offset; // pixel adjustment

  const BorderMode._(this.type, this.offset);

  static const BorderMode full = BorderMode._("full", 0);
  static const BorderMode half = BorderMode._("half", 0);

  BorderMode operator +(double value) => BorderMode._(type, offset + value);
  BorderMode operator -(double value) => BorderMode._(type, offset - value);

  /// Given the child’s width (or height), return “full” or “half” ± offset.
  double calculateLength(double baseLength) {
    final len = (type == "half") ? baseLength / 2 : baseLength;
    return len + offset;
  }

  @override
  String toString() => "$type + $offset";
}

/// Draws dotted/solid lines on any subset of the four sides.
/// Each side’s “base” length is controlled by [borderMode].
/// Now you can also shift each side’s start/end by its own offset.
class FlexiBorder extends StatelessWidget {
  final Widget child;

  /// Color of the dotted border.
  final Color borderColor;

  /// Dash pattern, e.g. [4, 2] for 4px dash / 2px gap.
  final List<double> dashPattern;

  /// Stroke width of the border.
  final double strokeWidth;


  /// Whether to draw that side at all.
  final bool drawTop;
  final bool drawRight;
  final bool drawBottom;
  final bool drawLeft;

  /// “half” or “full” + offset for each side’s LENGTH.
  final BorderMode borderMode;

  // ──────────────────────────────────────────────────────────────────────────
  // Per‐side “start” and “end” offsets:
  final double topStartOffset;
  final double topEndOffset;
  final double rightStartOffset;
  final double rightEndOffset;
  final double bottomStartOffset;
  final double bottomEndOffset;
  final double leftStartOffset;
  final double leftEndOffset;
  // ──────────────────────────────────────────────────────────────────────────

  const FlexiBorder({
    Key? key,
    required this.child,
    this.borderColor = Colors.white,
    this.dashPattern = const [1,0],
    this.strokeWidth = 1,
    this.drawTop = true,
    this.drawRight = true,
    this.drawBottom = true,
    this.drawLeft = true,
    this.borderMode = BorderMode.full,
    this.topStartOffset = 0,
    this.topEndOffset = 0,
    this.rightStartOffset = 0,
    this.rightEndOffset = 0,
    this.bottomStartOffset = 0,
    this.bottomEndOffset = 0,
    this.leftStartOffset = 0,
    this.leftEndOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: borderColor,
      dashPattern: dashPattern,
      strokeWidth: strokeWidth,
      customPath: (size) {
        final Path path = Path();
        final double fullW = size.width;
        final double fullH = size.height;

        // Compute “base” lengths (half/full + offset) for each side:
        final double baseLenTop    = borderMode.calculateLength(fullW);
        final double baseLenRight  = borderMode.calculateLength(fullH);
        final double baseLenBottom = borderMode.calculateLength(fullW);
        final double baseLenLeft   = borderMode.calculateLength(fullH);

        //
        // ─── TOP ─────────────────────────────────────────────────────────────
        //
        if (drawTop) {
          double baseStartX, baseEndX;
          if (borderMode.type == "half" && drawRight) {
            baseStartX = fullW - baseLenTop;
            baseEndX   = fullW;
          } else {
            baseStartX = 0;
            baseEndX   = baseLenTop;
          }
          final double startX = baseStartX - topStartOffset;
          final double endX   = baseEndX   + topEndOffset;

          path.moveTo(startX, 0);
          path.lineTo(endX, 0);
        }

        //
        // ─── RIGHT ────────────────────────────────────────────────────────────
        //
        if (drawRight) {
          double baseStartY, baseEndY;
          if (borderMode.type == "half" && drawBottom) {
            baseStartY = fullH;
            baseEndY   = fullH - baseLenRight;
          } else {
            baseStartY = 0;
            baseEndY   = baseLenRight;
          }
          final double startY = baseStartY - rightStartOffset;
          final double endY   = baseEndY   + rightEndOffset;

          path.moveTo(fullW, startY);
          path.lineTo(fullW, endY);
        }

        //
        // ─── BOTTOM ───────────────────────────────────────────────────────────
        //
        if (drawBottom) {
          double baseStartX, baseEndX;
          if (borderMode.type == "half" && drawLeft) {
            baseStartX = 0;
            baseEndX   = baseLenBottom;
          } else {
            baseStartX = fullW;
            baseEndX   = fullW - baseLenBottom;
          }
          final double startX = baseStartX + bottomStartOffset;
          final double endX   = baseEndX   - bottomEndOffset;

          path.moveTo(startX, fullH);
          path.lineTo(endX, fullH);
        }

        //
        // ─── LEFT ─────────────────────────────────────────────────────────────
        //
        if (drawLeft) {
          double baseStartY, baseEndY;
          if (borderMode.type == "half" && drawTop) {
            baseStartY = 0;
            baseEndY   = baseLenLeft;
          } else {
            baseStartY = fullH;
            baseEndY   = fullH - baseLenLeft;
          }
          final double startY = baseStartY + leftStartOffset;
          final double endY   = baseEndY   - leftEndOffset;

          path.moveTo(0, startY);
          path.lineTo(0, endY);
        }

        return path;
      },
      child: child,
    );
  }
}

