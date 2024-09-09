import 'dart:math';
import 'package:flutter/material.dart';

class Plane extends StatelessWidget {
  final double animationValue;
  final bool isDay;
  const Plane({super.key, required this.animationValue, required this.isDay});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double planeX = animationValue * screenWidth;
    final double planeY = screenHeight - (animationValue * screenHeight);
    return isDay
        ? Positioned(
            left: planeX,
            top: planeY,
            child: Transform.rotate(
              angle: animationValue * pi / 3,
              child: const Icon(
                Icons.airplanemode_active,
                color: Color.fromARGB(255, 176, 176, 176),
                size: 30,
              ),
            ),
          )
        : const SizedBox();
  }
}
