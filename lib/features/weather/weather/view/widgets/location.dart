import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: const TextStyle(fontSize: 30, color: Colors.white),
    );
  }
}
