import 'package:flutter/widgets.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/current_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/forecast.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/forecast_error.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

import 'current_weather_error.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      top: WeatherBox(
        child: weather.currentWeather != null
            ? CurrentWeather(
                weather: weather.currentWeather!,
                settlement: weather.settlement,
              )
            : CurrentWeatherError(settlement: weather.settlement),
      ),
      bottom: weather.forecast != null ? Forecast(forecast: weather.forecast!) : const ForecastError(),
    );
  }
}
