import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_current_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast_item.dart';
import 'package:pota_weather_flutter/shared/env.dart';

final Provider<WeatherRemote> weatherRemoteProvider =
    Provider<WeatherRemote>((Ref ref) => WeatherRemote(ref.read(openWeatherMapKeyProvider)));

class WeatherRemote {
  WeatherRemote(this._openWeatherMapKey);

  final String _openWeatherMapKey;

  static const baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<RemoteCurrentWeather> getCurrentWeather(Position position) async {
    final Uri uri = Uri.parse(
        '$baseUrl/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_openWeatherMapKey&units=metric');

    final http.Response response = await http.get(uri);

    return RemoteCurrentWeather.fromJson(jsonDecode(response.body));
  }

  Future<RemoteForecast> getForecast(Position position) async {
    final Uri uri = Uri.parse(
        '$baseUrl/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=$_openWeatherMapKey&units=metric');

    final http.Response response = await http.get(uri);

    return RemoteForecast.fromJson(jsonDecode(response.body));
  }
}
