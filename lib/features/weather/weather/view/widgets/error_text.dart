import 'package:flutter/material.dart';
import 'package:pota_weather_flutter/shared/colors.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: errorColor, fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}
