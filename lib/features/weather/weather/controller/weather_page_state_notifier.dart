import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/location.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';
import 'package:pota_weather_flutter/features/weather/weather/model/weather_repository.dart';

final StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState> weatherPageStateNotifierProvider =
    StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState>(
        (Ref ref) => WeatherPageStateNotifier(ref.read(weatherRepositoryProvider)));

class WeatherPageStateNotifier extends StateNotifier<WeatherPageState> {
  WeatherPageStateNotifier(this._weatherRepository) : super(const WeatherPageState.initial());

  final WeatherRepository _weatherRepository;

  void detectLocation() {
    state = const WeatherPageState.locatingInProgress();

    final Location location = _weatherRepository.getLocation();
  }
}
