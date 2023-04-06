import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/daily_weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather.dart';
import 'package:pota_weather_flutter/features/weather/data/weather_condition.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_initial.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_load_in_progress.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_load_succesful.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_locating_in_progress.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_location_input.dart';

class WeatherPage extends ConsumerWidget {
  WeatherPage({super.key});

  final Weather weather = Weather('Budapest', const DailyWeather(WeatherCondition.brokenClouds, 6), {
    DateTime(2023, 4, 6): const DailyWeather(WeatherCondition.scatteredClouds, 11),
    DateTime(2023, 4, 7): const DailyWeather(WeatherCondition.scatteredClouds, 10),
    DateTime(2023, 4, 8): const DailyWeather(WeatherCondition.rain, 9),
    DateTime(2023, 4, 9): const DailyWeather(WeatherCondition.scatteredClouds, 13),
    DateTime(2023, 4, 10): const DailyWeather(WeatherCondition.scatteredClouds, 16),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeatherPageState state = ref.watch(weatherPageStateNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: state.map(
            initial: (_) => const WeatherInitial(),
            locatingInProgress: (_) => const WeatherLocatingInProgress(),
            locationInput: (_) => const WeatherLocationInput(),
            weatherLoadInProgress: (weatherLoadInProgress) =>
                WeatherLoadInProgress(location: weatherLoadInProgress.location),
            weatherLoadSuccessful: (weatherLoadSuccessful) =>
                WeatherLoadSuccessful(weather: weatherLoadSuccessful.weather),
            weatherError: (_) => Container(),
          ),
        ),
      ),
    );
  }
}
