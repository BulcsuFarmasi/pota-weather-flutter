import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_weather_data.freezed.dart';
part 'remote_weather_data.g.dart';

@freezed
class RemoteWeatherData with _$RemoteWeatherData{
  const factory RemoteWeatherData(double temp) = _RemoteWeatherData;

  factory RemoteWeatherData.fromJson(Map<String, Object?> json) => _$RemoteWeatherDataFromJson(json);
}