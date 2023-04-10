import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_current_weather.dart';
import 'package:pota_weather_flutter/shared/env.dart';

final Provider<WeatherRemote> weatherRemoteProvider =
    Provider<WeatherRemote>((Ref ref) => WeatherRemote(ref.read(openWeatherMapKeyProvider)));

class WeatherRemote {
  WeatherRemote(this.openWeatherMapKey);

  final String openWeatherMapKey;

  Future<RemoteCurrentWeather> getCurrentWeather(Position position) async {
    final Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$openWeatherMapKey&units=metric');

    final http.Response response = await http.get(uri);

    return RemoteCurrentWeather.fromJson(jsonDecode(response.body));
  }
}
