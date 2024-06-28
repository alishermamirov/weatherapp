import 'dart:convert';

import '../../../data/constants/constantas.dart';
import '../../../data/models/weather.dart';
import 'package:http/http.dart' as http;
import '../exceptions/weather_exceptions.dart';

class WeatherApiServices {
  final http.Client client;

  WeatherApiServices({required this.client});

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(
        "$base_url?q=${city.toLowerCase()}&units=metric&appid=$api_key");
    try {
      final response = await client.get(url);
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      final reponseBody = jsonDecode(response.body);
      if (reponseBody == null) {
        throw WeatherExceptions("Cannot get weather for $city");
      }

      final data = reponseBody as Map<String, dynamic>;
      final weatherData = data["weather"][0];
      final mainData = data["main"];
      final Weather weather = Weather(
        id: weatherData["id"].toString(),
        main: weatherData["main"],
        desc: weatherData["description"],
        icon: weatherData["icon"],
        temperature: double.parse(mainData["temp"].toString()),
        city: city,
      );
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
