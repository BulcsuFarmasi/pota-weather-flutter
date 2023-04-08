import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/service/position_local.dart';

final Provider<PositionService> positionServiceProvider = Provider<PositionService>((Ref ref) => PositionService(ref.read(positionLocalProvider)));

class PositionService {
  PositionService(this._positionLocal);

  final PositionLocal _positionLocal;

  Future<LocationData> getPosition() async {
    return (await _positionLocal.getPosition())!;
  }

  Future<String> getSettlement() {

  }
}