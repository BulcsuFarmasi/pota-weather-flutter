import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/pages/widgets/forecast_item.dart';

class Forecast extends StatelessWidget {
  const Forecast({
    super.key,
    required this.forecast,
  });

  final Map<DateTime, DailyWeather> forecast;

  List<DateTime> get _dates => forecast.keys.toList();

  List<DailyWeather> get _weathers => forecast.values.toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.separated(
        itemBuilder: (BuildContext buildContext, int index) {
          return ForecastItem(
            date: _dates[index],
            weather: _weathers[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: forecast.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
