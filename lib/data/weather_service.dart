import 'package:http/http.dart' as http;
import 'package:pluralsight_app/data/models/weather.dart';
import 'dart:convert';

class WeatherService {
  final String uriBase = 'api.openweathermap.org';
  final String uriPath = 'data/2.5/weather';
  final String apiKey = '34c46d151f413cf45b08a1f2123b4306';

  Future<Weather> getWeatherFor(String locationName) async {
    Map<String, dynamic> parameters = {'q': locationName, 'appId': apiKey};
    var uri = Uri.https(uriBase, uriPath, parameters);
    var response = await http.get(uri);
    return Weather.fromJson(json.decode(response.body));
  }
}
