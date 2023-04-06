import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/shared/widgets/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
