import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_position.dart';
import 'package:pota_weather_flutter/shared/env.dart';

final Provider<PositionRemote> positionRemoteProvider =
Provider<PositionRemote>((Ref ref) => PositionRemote(ref.read(openWeatherMapKeyProvider)));

class PositionRemote {
  PositionRemote(this.openWeatherMapKey);

  final String openWeatherMapKey;
  static const baseUrl = 'https://api.openweathermap.org/geo/1.0';

  Future<String> getSettlement(Position position) async {
    try {
      Uri uri = Uri.parse(
          '$baseUrl/revse?lat=${position.latitude}&lon=${position.longitude}&limit=1&appid=$openWeatherMapKey');
      final http.Response response = await http.get(uri);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      return (jsonDecode(response.body) as List<dynamic>).first['local_names']['en'];
    } on HttpException {
      rethrow;
    }
    on XMLHttpRequest catch (e) {
      throw HttpException(e.)
    }
  }

  Future<RemotePosition> getPositionBySettlement(String settlement) async {
    Uri uri = Uri.parse(
        '$baseUrl/direct?q=$settlement&limit=1&appid=$openWeatherMapKey');
    final http.Response response = await http.get(uri);
    print(jsonDecode(response.body));
    return RemotePosition.fromJson(jsonDecode(response.body).first);
  }
}
