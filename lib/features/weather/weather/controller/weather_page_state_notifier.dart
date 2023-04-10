import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/service/position_local.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';
import 'package:pota_weather_flutter/features/weather/weather/model/weather_repository.dart';

final StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState> weatherPageStateNotifierProvider =
    StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState>(
        (Ref ref) => WeatherPageStateNotifier(ref.read(weatherRepositoryProvider)));

class WeatherPageStateNotifier extends StateNotifier<WeatherPageState> {
  WeatherPageStateNotifier(this._weatherRepository) : super(const WeatherPageState.initial());

  final WeatherRepository _weatherRepository;

  void detectLocation() async {
    state = const WeatherPageState.locatingInProgress();

    final Position position = await _weatherRepository.getPosition();

    final String settlement = await _weatherRepository.getSettlement(position);

    state = WeatherPageState.weatherLoadInProgress(settlement);

    final Weather weather = await _weatherRepository.getWeather(position, settlement);

    state = WeatherPageState.weatherLoadSuccessful(weather);
  }
}
