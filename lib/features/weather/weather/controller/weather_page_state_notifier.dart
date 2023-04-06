import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';

final StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState> weatherPageStateNotifierProvider =
    StateNotifierProvider<WeatherPageStateNotifier, WeatherPageState>((Ref ref) => WeatherPageStateNotifier());

class WeatherPageStateNotifier extends StateNotifier<WeatherPageState> {
  WeatherPageStateNotifier() : super(const WeatherPageState.initial());

  void detectLocation() {
  }



}
