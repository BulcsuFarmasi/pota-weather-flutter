import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_current_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast.dart';
import 'package:pota_weather_flutter/features/weather/service/weather_remote.dart';

final Provider<WeatherService> weatherServiceProvider =
    Provider<WeatherService>((Ref ref) => WeatherService(ref.read(weatherRemoteProvider)));

class WeatherService {
  WeatherService(this._weatherRemote);

  final WeatherRemote _weatherRemote;

  Future<RemoteCurrentWeather> getCurrentWeather(Position position) async {
    try {
      return await _weatherRemote.getCurrentWeather(position);
    } on HttpException {
      rethrow;
    }
  }

  Future<RemoteForecast> getForecast(Position position) async {
    try {
      return await _weatherRemote.getForecast(position);
    } on HttpException {
      rethrow;
    }
  }
}
