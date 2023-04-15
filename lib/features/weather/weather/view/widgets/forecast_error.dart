import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/shared/colors.dart';

class ForecastError extends ConsumerWidget {
  const ForecastError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'The forecast cannot be loaded',
        style: TextStyle(color: errorColor, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
