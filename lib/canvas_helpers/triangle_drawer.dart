import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  final Color color;
  late Paint painter;

  DrawTriangleShape({required this.color}) {
    painter = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
