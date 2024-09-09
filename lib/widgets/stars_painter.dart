import 'dart:math';
import 'package:flutter/material.dart';

class StarsPainter extends CustomPainter {
  final double twinkle;
  StarsPainter(this.twinkle);

  @override
  void paint(Canvas canvas, Size size) {
    final opacity = twinkle.clamp(0.0, 1.0);
    final paint = Paint()..color = Colors.white.withOpacity(opacity.toDouble());
    var random = Random();

    for (int i = 0; i < 20; i++) {
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 2 + 1, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PulseMoon extends StatelessWidget {
  const PulseMoon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.brightness_3,
        size: 100, color: Colors.yellowAccent);
  }
}
