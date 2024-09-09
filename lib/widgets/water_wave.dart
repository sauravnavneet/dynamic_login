import 'dart:math';
import 'package:flutter/material.dart';

class WaterClipper extends CustomClipper<Path> {
  final double fillPercent;
  final double waveAnimationValue;

  WaterClipper(this.fillPercent, this.waveAnimationValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    final fillHeight = size.height * fillPercent * 1.05;
    const waveHeight = 15.0;
    const waveFrequency = 3.0;

    final randomWaveHeight = waveHeight +
        (waveHeight *
            0.5 *
            sin(
              waveAnimationValue * 3 * pi,
            ));

    path.moveTo(0, size.height);

    for (double i = 0; i <= size.width; i++) {
      double waveY = sin((i / size.width * waveFrequency * 2 * pi) +
              waveAnimationValue * 2 * pi) *
          randomWaveHeight;
      path.lineTo(i, size.height - fillHeight + waveY);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
