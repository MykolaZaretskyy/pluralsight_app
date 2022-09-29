import 'package:flutter/material.dart';

class MenuNavigationBar extends StatelessWidget {
  const MenuNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight), label: 'BMI'),
      ],
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            break;
          default:
        }
      },
    );
  }
}
