import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/location.dart';
import 'package:pota_weather_flutter/features/weather/service/location_service.dart';

final Provider<WeatherRepository> weatherRepositoryProvider = Provider<WeatherRepository>((Ref ref) => WeatherRepository(ref.read(locationServiceProvider)));

class WeatherRepository {

  WeatherRepository(this._locationService);

  final LocationService _locationService;

  Location getLocation() {
    return _locationService.getLocation();
  }
}