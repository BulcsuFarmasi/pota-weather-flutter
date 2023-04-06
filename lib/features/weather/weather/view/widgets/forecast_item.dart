import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
    required this.date,
    required this.weather,
  });

  final DateTime date;
  final DailyWeather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF272727), width: 3),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${weather.temperature} °C',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Image.network(
            weather.condition.iconUrl,
            width: 48,
          ),
          Text(DateFormat('E').format(date), style: const TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
