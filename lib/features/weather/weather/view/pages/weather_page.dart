import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_condition.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_load_in_progress.dart';

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
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: WeatherLoadInProgress(location: 'Budapest'),
        ),
      ),
    );
  }
}
