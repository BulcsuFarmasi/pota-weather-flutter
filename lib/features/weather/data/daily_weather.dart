import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_weather.freezed.dart';

@freezed
class DailyWeather with _$DailyWeather{
  const factory DailyWeather() = _DailyWeather;

}