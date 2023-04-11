import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/position_exception.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_current_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast_item.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_condition.dart';
import 'package:pota_weather_flutter/features/weather/service/position_service.dart';
import 'package:pota_weather_flutter/features/weather/service/weather_service.dart';

final Provider<WeatherRepository> weatherRepositoryProvider = Provider<WeatherRepository>(
  (Ref ref) => WeatherRepository(
    ref.read(positionServiceProvider),
    ref.read(weatherServiceProvider),
  ),
);

class WeatherRepository {
  WeatherRepository(this._positionService, this._weatherService);

  final PositionService _positionService;
  final WeatherService _weatherService;

  Future<Position> getPosition() async {
    try {

    final LocationData locationData = await _positionService.getPosition();
    return Position(locationData.latitude!, locationData.longitude!);
    } on PositionException {
      rethrow;
    }
  }

  Future<String> getSettlement(Position position) async {
    return await _positionService.getSettlement(position);
  }

  Future<Weather> getWeather(Position position, String settlement) async {
    print('should');
    final RemoteCurrentWeather remoteCurrentWeather = await _weatherService.getCurrentWeather(position);

    final DailyWeather currentWeather = DailyWeather(
        WeatherCondition(remoteCurrentWeather.weather.first.main, remoteCurrentWeather.weather.first.icon),
        remoteCurrentWeather.main.temp.round());

    final RemoteForecast remoteForecast = await _weatherService.getForecast(position);

    Map<DateTime, DailyWeather> forecast = _convertRemoteForecastToForecast(remoteForecast);

    return Weather(settlement, currentWeather, forecast);
  }

  Map<DateTime, DailyWeather> _convertRemoteForecastToForecast(RemoteForecast remoteForecast) {
    final Map<DateTime, DailyWeather> forecast = {};

    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    final DateTime tomorrowMidnight = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);

    for (RemoteForecastItem remoteForecastItem in remoteForecast.list) {
      final DateTime date = DateTime.fromMillisecondsSinceEpoch(remoteForecastItem.dt * 1000);
      final DateTime dateMidnight = DateTime(date.year, date.month, date.day);

      if (dateMidnight.isBefore(tomorrowMidnight)) {
        continue;
      }

      if (forecast.containsKey(dateMidnight) &&
          remoteForecastItem.main.temp.round() > forecast[dateMidnight]!.temperature) {
        forecast[dateMidnight] = DailyWeather(
            WeatherCondition(remoteForecastItem.weather.first.main, remoteForecastItem.weather.first.icon),
            remoteForecastItem.main.temp.round());
      } else if (!forecast.containsKey(dateMidnight)) {
        forecast[dateMidnight] = DailyWeather(
            WeatherCondition(remoteForecastItem.weather.first.main, remoteForecastItem.weather.first.icon),
            remoteForecastItem.main.temp.round());
      }
    }

    return forecast;
  }
}
