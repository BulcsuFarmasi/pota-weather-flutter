import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/shared/env.dart';

final Provider<PositionRemote> positionRemoteProvider =
    Provider<PositionRemote>((Ref ref) => PositionRemote(ref.read(openWeatherMapKeyProvider)));

class PositionRemote {
  PositionRemote(this.openWeatherMapKey);

  final String openWeatherMapKey;

  Future<String> getSettlement(Position position) async {
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/geo/1.0/reverse?lat=${position.latitude}&lon=${position.longitude}&limit=1&appid=$openWeatherMapKey');
    final http.Response response = await http.get(uri);
    return (jsonDecode(response.body) as List<dynamic>).first['local_names']['en'];
  }
}
