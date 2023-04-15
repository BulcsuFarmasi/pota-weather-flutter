import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({required String settlement, DailyWeather? currentWeather, Map<DateTime, DailyWeather>? forecast}) =
      _Weather;
}
