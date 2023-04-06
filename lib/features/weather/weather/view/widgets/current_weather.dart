import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/location.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
    required this.weather,
    required this.location,
  });

  final DailyWeather weather;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Location(
          location: location,
        ),
        Image.network(
          weather.condition.iconUrl,
          width: 375,
        ),
        Text(
          '${weather.temperature} °C',
          style: const TextStyle(fontSize: 116, color: Colors.white),
        ),
        Text(
          weather.condition.text,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        )
      ],
    );
  }
}
