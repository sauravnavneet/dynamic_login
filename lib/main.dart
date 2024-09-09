import 'package:flutter/material.dart';
import 'package:login/widgets/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Sky Login',
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
