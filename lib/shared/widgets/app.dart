import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/pages/weather_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POTA Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WeatherPage(),
    );
  }
}
