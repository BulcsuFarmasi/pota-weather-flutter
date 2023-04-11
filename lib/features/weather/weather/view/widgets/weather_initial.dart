import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherInitial extends ConsumerWidget {
  const WeatherInitial({super.key});

  void _detectSettlement(WidgetRef ref) {
    ref.read(weatherPageStateNotifierProvider.notifier).getWeatherByPosition();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WeatherScaffold(
      top: WeatherBox(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {
                _detectSettlement(ref);
              },
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
