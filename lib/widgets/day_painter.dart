import 'package:flutter/material.dart';

class DayBackgroundPainter extends CustomPainter {
  final double progress;

  DayBackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // Blue sky
    Paint skyPaint = Paint()
      ..color = Color.lerp(Colors.deepPurple, Colors.blue, progress)!;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), skyPaint);

    // clouds
    Paint cloudPaint = Paint()..color = Colors.white.withOpacity(progress);
    double cloudY = size.height * 0.2;
    canvas.drawCircle(Offset(size.width * 0.2, cloudY), 50, cloudPaint);
    canvas.drawCircle(Offset(size.width * 0.6, cloudY - 20), 40, cloudPaint);
    canvas.drawCircle(Offset(size.width * 0.8, cloudY + 30), 60, cloudPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
