import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/menu_drawer.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator Screen')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuNavigationBar(),
      backgroundColor: Colors.blue,
    );
  }
}
