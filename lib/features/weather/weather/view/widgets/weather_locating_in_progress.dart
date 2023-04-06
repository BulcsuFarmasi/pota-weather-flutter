import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherLocatingInProgress extends StatelessWidget {
  const WeatherLocatingInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(top: WeatherBox(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )),
          ),);
  }
}
