import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/service/position_service.dart';

final Provider<WeatherRepository> weatherRepositoryProvider = Provider<WeatherRepository>((Ref ref) => WeatherRepository(ref.read(positionServiceProvider)));

class WeatherRepository {

  WeatherRepository(this._positionService);

  final PositionService _positionService;

  Future<Position> getLocation() async {
    final LocationData locationData = await _positionService.getPosition();
    return Position(locationData.latitude!, locationData.longitude!);
  }

  Future<String> getSettlement(Position position) async {
    final String settlement = await _positionService.getSettlement();
  }
}