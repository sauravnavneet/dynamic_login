import 'package:flutter/material.dart';
import 'package:login/widgets/stars_painter.dart';

class AnimatedStars extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedStars({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: StarsPainter(animation.value),
        );
      },
    );
  }
}
