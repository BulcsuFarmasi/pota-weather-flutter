import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/weather/controller/weather_page_state_notifier.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_box.dart';
import 'package:pota_weather_flutter/features/weather/weather/view/widgets/weather_scaffold.dart';

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

  void _submitSettlement () {
    final bool settlementValid = _validateSettlement();
    if (!settlementValid) {
      return;
    }
    ref.read(weatherPageStateNotifierProvider.notifier)
  }

  bool _validateSettlement() {
    errorMessage = null;
    if(_settlementEditingController.value.text.isEmpty) {
      errorMessage = 'The settlement is required';
    }
    final RegExp settlementRegRxp = RegExp(r'^[\d -!]+$');

    if (!settlementRegRxp.hasMatch(_settlementEditingController.value.text)) {
      errorMessage = 'Please provide a valid settlement name';
    }
    return errorMessage == null;
  }
  
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
          children:  [
            const Text(
              'Fetching your position wasn\'t successful, please provide your settlement below',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                label: Text('Settlement'),
                labelStyle: TextStyle(color: Colors.white),
              ),
              cursorColor: Colors.white,
              controller: _settlementEditingController,
              onEditingComplete: _submitSettlement,
            ),
          ],
        ),
      ),
    ));
  }
}
