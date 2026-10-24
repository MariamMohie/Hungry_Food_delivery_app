import 'package:flutter/material.dart';

class TopLeftWavePainter extends CustomPainter {
  final Color color;

  TopLeftWavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0); // top-left
    path.lineTo(size.width * 0.6, 0);

    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.25,
      0,
      size.height * 0.35,
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
