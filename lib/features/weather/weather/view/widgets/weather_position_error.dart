import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';
import 'package:pota_weather_flutter/shared/colors.dart';

class WeatherPositionError extends ConsumerWidget {
  const WeatherPositionError({Key? key}) : super(key: key);

  void _retry(WidgetRef ref) {
    ref.read(weatherPageStateNotifierProvider.notifier).restoreToInitial();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WeatherScaffold(
      top: WeatherBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your location cannot be determined in either way, please try again by tapping the button below',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: errorColor),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  _retry(ref);
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 40,
                  color: errorColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
