import 'dart:math';

import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        gradient: const LinearGradient(
          colors: [Color(0xFF82DAF4), Color(0xFF126CF4)],
          stops: [0.0496, 0.9735],
          transform: GradientRotation(193.87 * pi / 180),
        ),
      ),
      child: child,
    );
  }
}
