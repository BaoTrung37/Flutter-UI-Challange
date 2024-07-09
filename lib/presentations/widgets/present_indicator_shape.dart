import 'package:flutter/material.dart';

class PresentIndicatorShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final path = Path();
    path
      ..addOval(Rect.fromCircle(center: const Offset(100, 100), radius: 100))
      ..addOval(Rect.fromCircle(center: const Offset(100, 100), radius: 80));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
