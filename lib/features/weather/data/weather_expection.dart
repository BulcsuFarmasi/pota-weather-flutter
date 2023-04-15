import 'package:pota_weather_flutter/features/weather/data/weather.dart';

class WeatherException implements Exception {
  final Weather weather;

  WeatherException(this.weather);
}