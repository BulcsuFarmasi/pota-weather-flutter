import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_weather_main.freezed.dart';
part 'remote_weather_main.g.dart';

@freezed
class RemoteWeatherMain with _$RemoteWeatherMain {
  const factory RemoteWeatherMain(double temp) = _RemoteWeatherMain;

  factory RemoteWeatherMain.fromJson(Map<String, Object?> json) => _$RemoteWeatherMainFromJson(json);
}
