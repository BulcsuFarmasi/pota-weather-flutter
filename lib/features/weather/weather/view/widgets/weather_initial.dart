import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherInitial extends StatelessWidget {
  const WeatherInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherScaffold(
      top: WeatherBox(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              child: const Text('Locate Me'),
            ),
          ),
        ),
      ),
    );
  }
}
