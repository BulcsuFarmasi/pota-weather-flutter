import 'package:flutter/widgets.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/current_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/forecast.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherLoadSuccessful extends StatelessWidget {
  const WeatherLoadSuccessful({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      top: WeatherBox(
          child: CurrentWeather(
        weather: weather.currentWeather!,
        settlement: weather.settlement,
      )),
      bottom: Forecast(forecast: weather.forecast!),
    );
  }
}
