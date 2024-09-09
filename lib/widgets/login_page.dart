import 'package:flutter/material.dart';
import 'package:login/animation_manager/animation_manager.dart';
import 'package:login/widgets/animated_stars.dart';
import 'package:login/widgets/day_painter.dart';
import 'package:login/widgets/form.dart';
import 'package:login/widgets/plane.dart';
import 'package:login/widgets/stars_painter.dart';
import 'package:login/widgets/success_screen.dart';
import 'package:login/widgets/water_wave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationManager _animationManager;

  bool isDay = false;
  bool isLoginPressed = false;

  @override
  void initState() {
    super.initState();
    _animationManager = AnimationManager(this);
  }

  @override
  void dispose() {
    _animationManager.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      isDay = !isDay;
      if (isDay) {
        _animationManager.themeController.forward();
      } else {
        _animationManager.themeController.reverse();
      }
    });
  }

  void _onLoginPressed() {
    setState(() {
      isLoginPressed = true;
    });
    _animationManager.waterController.forward().then((_) {
      _animationManager.shrinkController.forward().then((_) {
        Navigator.of(context).pushReplacement(
          animatedPageBuilder(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(),
          if (isDay)
            AnimatedBuilder(
              animation: _animationManager.themeController,
              builder: (context, child) {
                return Plane(
                  animationValue: _animationManager.themeController.value,
                  isDay: isDay,
                );
              },
            ),
          animatedSwitcher(),
          // GlassMorphicLoginForm
          scaleFormContainer(),
          if (isLoginPressed) waveContainer(),
        ],
      ),
    );
  }

  PageRouteBuilder animatedPageBuilder() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SuccessScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        // Create a curved animation
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        // Slide transition using the offset animation
        return SlideTransition(
          position:
              Tween<Offset>(begin: begin, end: end).animate(curvedAnimation),
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 2),
    );
  }

  Positioned animatedSwitcher() {
    return Positioned(
      top: 40,
      right: 30,
      child: GestureDetector(
        onTap: _toggleTheme,
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: isDay
              ? Icon(Icons.wb_sunny,
                  size: 100, color: Colors.yellowAccent, key: UniqueKey())
              : const PulseMoon(),
        ),
      ),
    );
  }

  Positioned background() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _animationManager.themeController,
        builder: (context, child) {
          return isDay
              ? CustomPaint(
                  painter: DayBackgroundPainter(
                    _animationManager.themeController.value,
                  ),
                )
              : AnimatedStars(
                  animation: _animationManager.starTwinkle,
                );
        },
      ),
    );
  }

  ScaleTransition scaleFormContainer() {
    return ScaleTransition(
      scale: _animationManager.scaleAnimation,
      child: Center(
        child: GlassMorphicLoginForm(
          isDay: isDay,
          onLoginPressed: _onLoginPressed,
        ),
      ),
    );
  }

  Positioned waveContainer() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _animationManager.waterFillAnimation,
        builder: (context, child) {
          return ClipPath(
            clipper: WaterClipper(
              _animationManager.waterFillAnimation.value,
              _animationManager.waveController.value,
            ),
            child: Container(
              color: isDay
                  ? Colors.black54
                  : const Color.fromARGB(177, 153, 9, 50),
            ),
          );
        },
      ),
    );
  }
}
