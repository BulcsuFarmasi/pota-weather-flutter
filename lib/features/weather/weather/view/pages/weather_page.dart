import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_condition.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/pages/widgets/current_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/pages/widgets/forecast.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/pages/widgets/weather_box.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  final Weather weather = Weather('Budapest', const DailyWeather(WeatherCondition.brokenClouds, 6), {
    DateTime(2023, 4, 6): const DailyWeather(WeatherCondition.scatteredClouds, 11),
    DateTime(2023, 4, 7): const DailyWeather(WeatherCondition.scatteredClouds, 10),
    DateTime(2023, 4, 8): const DailyWeather(WeatherCondition.rain, 9),
    DateTime(2023, 4, 9): const DailyWeather(WeatherCondition.scatteredClouds, 13),
    DateTime(2023, 4, 10): const DailyWeather(WeatherCondition.scatteredClouds, 16),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
