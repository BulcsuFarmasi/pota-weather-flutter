import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/settlement.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherLoadInProgress extends StatelessWidget {
  const WeatherLoadInProgress({super.key, required this.settlement});

  final String settlement;

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      top: WeatherBox(
        child: Column(
          children: [
            Settlement(
              settlement: settlement,
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
