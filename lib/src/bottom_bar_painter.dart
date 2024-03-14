import 'package:flutter/material.dart';

import 'constants/constants.dart';

class BottomBarPainter extends CustomPainter {
  BottomBarPainter({
    required this.position,
    required this.color,
    required this.showShadow,
    required this.notchColor,
    required this.elevation,
    required this.kBottomRadius,
    this.shadowElevation,
    this.shader,
    this.gradient,
  })  : _paint = Paint()
          ..color = color
          ..isAntiAlias = true,
        _shadowColor = Colors.grey.shade600,
        _notchPaint = Paint()
          ..color = notchColor
          ..isAntiAlias = true
          ..shader = gradient?.createShader(Rect.fromCircle(
            center: Offset(
              position + kCircleMargin + kCircleRadius,
              kMargin + kCircleMargin,
            ),
            radius: kCircleRadius,
          ));

  /// position
  final double position;

  /// Color for the bottom bar
  final Color color;

  //final shadow show
  final double? shadowElevation;

  /// Paint value to custom painter
  final Paint _paint;

  // shader

  final Shader? shader;

  /// Shadow Color
  final Color _shadowColor;

  // bottom radius
  double kBottomRadius;

  /// Boolean to show shadow
  final bool showShadow;

  /// Paint Value of notch
  final Paint _notchPaint;

  /// Color for the notch
  final Color notchColor;

  /// To add any gradient to the notch
  final Gradient? gradient;

  /// To add any gradient to the notch
  final double elevation;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBar(canvas, size);
    _drawFloatingCircle(canvas, shader);
  }

  @override
  bool shouldRepaint(BottomBarPainter oldDelegate) {
    return position != oldDelegate.position || color != oldDelegate.color;
  }

  /// draw bottom bar
  void _drawBar(Canvas canvas, Size size) {
    final double left = kMargin;
    final double right = size.width - kMargin;
    final double top = kMargin;
    final double bottom = top + kHeight;

    final path = Path()
      ..moveTo(left + kTopRadius, top)
      ..lineTo(position - kTopRadius, top)
      ..relativeArcToPoint(
        Offset(kTopRadius, kTopRadius),
        radius: Radius.circular(kTopRadius),
      )
      ..relativeArcToPoint(
        const Offset((kCircleRadius + kCircleMargin) * 2, 0.0),
        radius: const Radius.circular(kCircleRadius + kCircleMargin),
        clockwise: false,
      )
      ..relativeArcToPoint(
        Offset(kTopRadius, -kTopRadius),
        radius: Radius.circular(kTopRadius),
      )
      ..lineTo(right - kTopRadius, top)
      ..relativeArcToPoint(
        Offset(kTopRadius, kTopRadius),
        radius: Radius.circular(kTopRadius),
      )
      ..lineTo(right, bottom - kBottomRadius)
      ..relativeArcToPoint(
        Offset(-kBottomRadius, kBottomRadius),
        radius: Radius.circular(kBottomRadius),
      )
      ..lineTo(left + kBottomRadius, bottom)
      ..relativeArcToPoint(
        Offset(-kBottomRadius, -kBottomRadius),
        radius: Radius.circular(kBottomRadius),
      )
      ..lineTo(left, top + kTopRadius)
      ..relativeArcToPoint(
        Offset(kTopRadius, -kTopRadius),
        radius: Radius.circular(kTopRadius),
      );
    if (this.showShadow) {
      canvas..drawShadow(path, _shadowColor, shadowElevation ?? 5, true);
    }
    canvas.drawPath(path, _paint);
  }

  /// Function used to draw the circular indicator
  void _drawFloatingCircle(Canvas canvas, Shader? shader) {
    final path = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(
            position + kCircleMargin + kCircleRadius,
            kMargin + kCircleMargin,
          ),
          radius: kCircleRadius,
        ),
        0,
        kPi * 2,
      );
    if (this.showShadow) {
      canvas..drawShadow(path, _shadowColor, shadowElevation ?? 5.0, true);
    }
    shader != null
        ? canvas.drawPath(path, _notchPaint..shader = shader)
        : canvas.drawPath(path, _notchPaint);
  }
}
