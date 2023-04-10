import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_current_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/service/position_service.dart';
import 'package:pota_weather_flutter/features/weather/service/weather_service.dart';

final Provider<WeatherRepository> weatherRepositoryProvider = Provider<WeatherRepository>((Ref ref) =>
    WeatherRepository(ref.read(positionServiceProvider), ref.read(weatherServiceProvider),),);

class WeatherRepository {

  WeatherRepository(this._positionService, this._weatherService);

  final PositionService _positionService;
  final WeatherService _weatherService;

  Future<Position> getPosition() async {
    final LocationData locationData = await _positionService.getPosition();
    return Position(locationData.latitude!, locationData.longitude!);
  }

  Future<String> getSettlement(Position position) async {
    return await _positionService.getSettlement(position);
  }

  Future<Weather> getWeather(Position position, String settlement) async {
    final RemoteCurrentWeather remoteWeather = await _weatherService.getCurrentWeather(position);

    final DailyWeather dailyWeather = DailyWeather();
  }
}