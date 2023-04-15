import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_weather_data.freezed.dart';
part 'remote_weather_data.g.dart';

@freezed
class RemoteWeatherData with _$RemoteWeatherData {
  const factory RemoteWeatherData(String main, String icon) = _RemoteWeatherData;

  factory RemoteWeatherData.fromJson(Map<String, Object?> json) => _$RemoteWeatherDataFromJson(json);
}
