import 'package:flutter/material.dart';

class AnimationManager {
  final TickerProvider vsync;
  late AnimationController starsController;
  late AnimationController themeController;
  late AnimationController waterController;
  late AnimationController shrinkController;
  late AnimationController waveController;
  late Animation<double> starTwinkle;
  late Animation<double> scaleAnimation;
  late Animation<double> waterFillAnimation;

  AnimationManager(this.vsync) {
    starsController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: vsync,
    )..repeat(reverse: true);

    themeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    waterController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    shrinkController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );

    waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: vsync,
    )..repeat();

    starTwinkle = Tween<double>(begin: 0.2, end: 1.2).animate(
      CurvedAnimation(parent: starsController, curve: Curves.bounceInOut),
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: shrinkController, curve: Curves.easeInOut),
    );

    waterFillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: waterController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void dispose() {
    starsController.dispose();
    themeController.dispose();
    waterController.dispose();
    shrinkController.dispose();
    waveController.dispose();
  }
}
