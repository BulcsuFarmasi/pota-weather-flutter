import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_weather_data.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_weather_main.dart';

part 'remote_forecast_item.freezed.dart';

part 'remote_forecast_item.g.dart';

@freezed
class RemoteForecastItem with _$RemoteForecastItem {
  const factory RemoteForecastItem(
      {required int dt,
      required RemoteWeatherMain main,
      required List<RemoteWeatherData> weather}) = _RemoteForecastItem;

  factory RemoteForecastItem.fromJson(Map<String, Object?> json) => _$RemoteForecastItemFromJson(json);
}
