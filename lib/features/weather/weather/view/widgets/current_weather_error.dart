import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/settlement.dart';
import 'package:pota_weather_flutter/shared/colors.dart';

class CurrentWeatherError extends StatelessWidget {
  const CurrentWeatherError({
    super.key,
    required this.settlement,
  });

  final String settlement;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Settlement(settlement: settlement),
      const Expanded(
        child: Center(
          child: Text(
            'Current weather cannot be loaded',
            style: TextStyle(color: errorColor, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }
}
