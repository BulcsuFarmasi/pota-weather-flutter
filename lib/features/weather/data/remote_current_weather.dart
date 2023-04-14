import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_weather_data.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_weather_main.dart';

part 'remote_current_weather.freezed.dart';

part 'remote_current_weather.g.dart';

@freezed
class RemoteCurrentWeather with _$RemoteCurrentWeather {
  const factory RemoteCurrentWeather({required RemoteWeatherMain main, required List<RemoteWeatherData> weather}) =
      _RemoteCurrentWeather;

  factory RemoteCurrentWeather.fromJson(Map<String, Object?> json) => _$RemoteCurrentWeatherFromJson(json);
}
