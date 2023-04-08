import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';

final Provider<PositionRemote> positionRemoteProvider = Provider<PositionRemote>((Ref ref) => PositionRemote());

class PositionRemote {
  String getSettlement(Position position) {

  }
}