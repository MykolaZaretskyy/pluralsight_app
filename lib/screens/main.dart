import 'package:flutter/material.dart';
import 'package:pluralsight_app/screens/bmi_screen.dart';
import 'intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiCalculatorScreen(),
      },
      initialRoute: '/',
    );
  }
}
