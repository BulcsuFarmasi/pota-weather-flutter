import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/location.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherLoadInProgress extends StatelessWidget {
  const WeatherLoadInProgress({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      top: WeatherBox(
        child: Column(
          children: [
            Location(
              location: location,
            ),
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
