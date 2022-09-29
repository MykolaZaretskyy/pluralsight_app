import 'package:flutter/material.dart';
import 'package:pluralsight_app/screens/bmi_screen.dart';
import 'package:pluralsight_app/screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitle = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
            child: Text(
          'Drawer Header Text',
          style: TextStyle(fontSize: 21),
        ))));
    menuTitle.forEach((element) {
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          Widget page = Container();
          switch (element) {
            case 'Home':
              page = const IntroScreen();
              break;
            case 'BMI Calculator':
              page = const BmiCalculatorScreen();
              break;
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => page,
          ));
        },
      ));
    });

    return menuItems;
  }
}
