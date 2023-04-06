import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';

part 'weather_page_state.freezed.dart';

@freezed
class WeatherPageState with _$WeatherPageState {
  const factory WeatherPageState.initial() = _Initial;
  const factory WeatherPageState.locatingInProgress() = _LocatingInProgress;
  const factory WeatherPageState.locationInput() = _LocationInput;
  const factory WeatherPageState.weatherLoadInProgress(String location) = _WeatherLoadInProgress;
  const factory WeatherPageState.weatherLoadSuccessful(Weather weather) = _WeatherLoadSuccesful;
  const factory WeatherPageState.weatherError() = _WeatherError;
}