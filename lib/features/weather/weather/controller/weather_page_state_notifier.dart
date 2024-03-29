import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/position_exception.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_expection.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';
import 'package:pota_weather_flutter/features/weather/weather/model/weather_repository.dart';

final StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState> weatherPageStateNotifierProvider =
    StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState>(
        (Ref ref) => WeatherPageStateNotifier(ref.read(weatherRepositoryProvider)));

class WeatherPageStateNotifier extends StateNotifier<WeatherPageState> {
  WeatherPageStateNotifier(this._weatherRepository) : super(const WeatherPageState.initial());

  final WeatherRepository _weatherRepository;

  void getWeatherByPosition() async {
    try {
      state = const WeatherPageState.locatingInProgress();

      final Position position = await _weatherRepository.getPosition();

      final String settlement = await _weatherRepository.getSettlement(position);

      _getWeather(settlement, position);
    } on PositionException {
      state = const WeatherPageState.settlementInput();
    }
  }

  void getWeatherBySettlement(String settlement) async {
    try {
      final Position position = await _weatherRepository.getPositionBySettlement(settlement);

      _getWeather(settlement, position);
    } on PositionException {
      state = const WeatherPageState.positionError();
    }
  }

  void restoreToInitial() {
    state = const WeatherPageState.initial();
  }

  void _getWeather(String settlement, Position position) async {
    state = WeatherPageState.weatherLoadInProgress(settlement);

    try {
      final Weather weather = await _weatherRepository.getWeather(position, settlement);
      state = WeatherPageState.weatherLoadSuccessful(weather);
    } on WeatherException catch (e) {
      state = WeatherPageState.weatherError(e.weather);
    }
  }
}
