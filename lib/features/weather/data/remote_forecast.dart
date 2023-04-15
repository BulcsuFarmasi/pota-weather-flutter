import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_forecast_item.dart';

part 'remote_forecast.freezed.dart';
part 'remote_forecast.g.dart';

@freezed
class RemoteForecast with _$RemoteForecast {
  const factory RemoteForecast(List<RemoteForecastItem> list) = _RemoteForecast;

  factory RemoteForecast.fromJson(Map<String, Object?> json) => _$RemoteForecastFromJson(json);
}
