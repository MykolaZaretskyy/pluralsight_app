import 'package:flutter/material.dart';
import 'package:pluralsight_app/widgets/bottom_navigation_bar.dart';
import 'package:pluralsight_app/widgets/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intro Screen')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuNavigationBar(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/football_img.jpeg'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    'Intro screen hello world text',
                    style: TextStyle(fontSize: 24),
                  )))),
    );
  }
}
