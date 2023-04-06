import 'package:flutter/material.dart';

class WeatherScaffold extends StatelessWidget {
  const WeatherScaffold({super.key, required this.top, this.bottom});

  final Widget top;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: top,
        ),
        Expanded(
          flex: 1,
          child: bottom ?? Container(),
        )
      ],
    );
  }
}
