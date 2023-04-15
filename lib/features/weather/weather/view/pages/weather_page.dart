import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_error.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_initial.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_load_in_progress.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_load_succesful.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_locating_in_progress.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_position_error.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_settlement_input.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

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
            settlementInput: (_) => const WeatherSettlementInput(),
            positionError: (_) => const WeatherPositionError(),
            weatherLoadInProgress: (weatherLoadInProgress) =>
                WeatherLoadInProgress(settlement: weatherLoadInProgress.settlement),
            weatherLoadSuccessful: (weatherLoadSuccessful) =>
                WeatherLoadSuccessful(weather: weatherLoadSuccessful.weather),
            weatherError: (weatherError) =>
                WeatherError(weather: weatherError.weather),
          ),
        ),
      ),
    );
  }
}
