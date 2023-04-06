import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_condition.dart';

part 'daily_weather.freezed.dart';

@freezed
class DailyWeather with _$DailyWeather {
  const factory DailyWeather(WeatherCondition condition, int temperature) = _DailyWeather;
}
