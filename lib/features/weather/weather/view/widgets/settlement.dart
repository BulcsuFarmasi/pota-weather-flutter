import 'package:flutter/material.dart';

class Settlement extends StatelessWidget {
  const Settlement({super.key, required this.settlement});

  final String settlement;

  @override
  Widget build(BuildContext context) {
    return Text(
      settlement,
      style: const TextStyle(fontSize: 30, color: Colors.white),
    );
  }
}
