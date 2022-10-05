import 'package:flutter/material.dart';
import 'package:pluralsight_app/data/models/weather.dart';
import 'package:pluralsight_app/data/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weatherText = '';
  late WeatherService _weatherService;
  final TextEditingController cityTxtController = TextEditingController();
  Weather _weatherData = Weather.empty();

  @override
  void initState() {
    _weatherService = WeatherService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather Screen')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextField(
                controller: cityTxtController,
                decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                        onPressed: getWeather, icon: const Icon(Icons.search))),
              ),
              weatherRow('Place:', _weatherData.name),
              weatherRow('Description:', _weatherData.description),
              weatherRow(
                  'Temperature:', _weatherData.temperature.toStringAsFixed(2)),
              weatherRow(
                  'Perceived:', _weatherData.perceived.toStringAsFixed(2)),
              weatherRow('Humidity:', _weatherData.humidity.toString()),
            ],
          ),
        ));
  }

  Future getWeather() async {
    var weatherData =
        await _weatherService.getWeatherFor(cityTxtController.text);
    setState(() {
      _weatherData = weatherData;
    });
  }

  Widget weatherRow(String key, String value) {
    var row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                key,
                style: const TextStyle(fontSize: 16),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );

    return row;
  }
}
