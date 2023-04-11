import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/settlement.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({
    super.key,
    required this.weather,
    required this.settlement,
  });

  final DailyWeather weather;
  final String settlement;

  void _restorePage(WidgetRef ref) {
    ref.read(weatherPageStateNotifierProvider.notifier).restoreToInitial();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Settlement(settlement: settlement),
            IconButton(
              onPressed: () {
                _restorePage(ref);
              },
              icon: const Icon(Icons.refresh),
              iconSize: 30,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          height: 375,
          child: Image.network(
            weather.condition.iconUrl,
            width: 375,
          ),
        ),
        Text(
          '${weather.temperature} °C',
          style: const TextStyle(fontSize: 116, color: Colors.white),
        ),
        Text(
          weather.condition.description,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        )
      ],
    );
  }
}
