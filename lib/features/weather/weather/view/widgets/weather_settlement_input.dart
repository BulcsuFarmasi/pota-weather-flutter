import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

class WeatherSettlementInput extends StatelessWidget {
  const WeatherSettlementInput({super.key});

  @override
  Widget build(BuildContext context) {
    const UnderlineInputBorder inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    return WeatherScaffold(
        top: WeatherBox(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: const [
            Text(
              'Settlement wasn\'t successful, please provide your settlement below',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
              ),
              cursorColor: Colors.white,
            ),
          ],
        ),
      ),
    ));
  }
}
