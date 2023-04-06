import 'package:flutter/widgets.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/current_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/forecast.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';

class WeatherLoadSuccessful extends StatelessWidget {
  const WeatherLoadSuccessful({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherBox(
            child: CurrentWeather(
              weather: weather.currentWeather,
              location: weather.location,
            )),
        Expanded(
          flex: 1,
          child: Forecast(forecast: weather.forecast),
        )
      ],
    );
  }
}
