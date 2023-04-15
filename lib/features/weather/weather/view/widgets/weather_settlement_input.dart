import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';
import 'package:pota_weather_flutter/shared/colors.dart';

class WeatherSettlementInput extends ConsumerStatefulWidget {
  const WeatherSettlementInput({super.key});

  @override
  ConsumerState<WeatherSettlementInput> createState() => _WeatherSettlementInputState();
}

class _WeatherSettlementInputState extends ConsumerState<WeatherSettlementInput> {
  final TextEditingController _settlementEditingController = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    _settlementEditingController.dispose();
  }

  void _submitSettlement(String? settlement) {
    final bool settlementValid = _validateSettlement(settlement);
    if (!settlementValid) {
      return;
    }
    ref.read(weatherPageStateNotifierProvider.notifier).getWeatherBySettlement(settlement!);
  }

  bool _validateSettlement(String? settlement) {
    setState(() {
      errorMessage = null;
    });
    if (settlement == null || settlement.isEmpty) {
      setState(() {
        errorMessage = 'The settlement is required';
      });
      return false;
    }
    final RegExp settlementRegRxp = RegExp(r'^[A-Za-zÀ-ÖØ-öø-ÿ !-]+$');

    if (!settlementRegRxp.hasMatch(settlement)) {
      setState(() {
        errorMessage = 'Please provide a valid settlement name';
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    const UnderlineInputBorder inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    const UnderlineInputBorder errorBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: errorColor),
    );
    return WeatherScaffold(
        top: WeatherBox(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Fetching your position wasn\'t successful, please provide your settlement below',
              style: TextStyle(color: errorColor, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
                label: const Text('Settlement'),
                labelStyle: const TextStyle(color: Colors.white),
                errorText: errorMessage,
                errorStyle: const TextStyle(color: errorColor),
              ),
              cursorColor: Colors.white,
              controller: _settlementEditingController,
              onSubmitted: _submitSettlement,
            ),
          ],
        ),
      ),
    ));
  }
}
