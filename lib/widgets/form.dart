import 'package:flutter/material.dart';
import 'package:login/widgets/cosmic_button.dart';

class GlassMorphicLoginForm extends StatelessWidget {
  const GlassMorphicLoginForm(
      {super.key, required this.isDay, required this.onLoginPressed});

  final bool isDay;
  final void Function() onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: 5,
            color: isDay
                ? Colors.transparent
                : const Color.fromARGB(255, 227, 0, 102).withOpacity(1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                color: isDay ? Colors.black45 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Username"),
            const SizedBox(height: 20),
            _buildTextField("Password", obscureText: true),
            const SizedBox(height: 30),
            CosmicButton(onLoginPressed: onLoginPressed),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
