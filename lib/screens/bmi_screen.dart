import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/menu_drawer.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final TextEditingController heightTextController = TextEditingController();
  final TextEditingController widthTextController = TextEditingController();
  String result = '';
  bool isMetricSelected = true;
  bool isImperialSelected = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetricSelected, isImperialSelected];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String heightHintText = 'Please insert your height in ${isMetricSelected ? 'meters' : 'inches'}';
    String weightHintText = 'Please insert your weight in ${isMetricSelected ? 'kilos' : 'inches'}';
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator Screen')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleButton,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: 18),),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Imperial', style: TextStyle(fontSize: 18),),
                  ),
            ],),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: heightTextController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightHintText
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: widthTextController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: weightHintText
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: CalcumateBmi,
                child: const Text('Calculate BMI', style: TextStyle(fontSize: 18),)),
            ),
            Text(result,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  void toggleButton(index) {
    if (index == 0) {
      isMetricSelected = true;
      isImperialSelected = false;
    } else {
      isMetricSelected = false;
      isImperialSelected = true;
    }

    setState(() {
      isSelected = [isMetricSelected, isImperialSelected];
    });
  }

  void CalcumateBmi() {
    double bmi = 0;
    double height = double.tryParse(heightTextController.text) ?? 0;
    double weight = double.tryParse(widthTextController.text) ?? 0;
    if (isMetricSelected) {
      bmi = weight/ (height * weight);
    } else {
      bmi = weight * 703 / (height * weight);
    }

    setState(() {
      result = 'Your BMI is $bmi';
    });
  }
}
