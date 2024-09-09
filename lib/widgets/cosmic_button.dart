import 'package:flutter/material.dart';

class CosmicButton extends StatefulWidget {
  const CosmicButton({super.key, required this.onLoginPressed});

  final void Function() onLoginPressed;

  @override
  State<CosmicButton> createState() => _CosmicButtonState();
}

class _CosmicButtonState extends State<CosmicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glow = Tween(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glow,
      builder: (context, child) {
        return Transform.scale(
          scale: _glow.value,
          child: ElevatedButton(
            onPressed: widget.onLoginPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              foregroundColor: Colors.pinkAccent,
              shadowColor: Colors.purpleAccent,
              elevation: 15,
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
