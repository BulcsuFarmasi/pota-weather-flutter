import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/service/position_local.dart';
import 'package:pota_weather_flutter/features/weather/service/position_remote.dart';

final Provider<PositionService> positionServiceProvider = Provider<PositionService>((Ref ref) =>
    PositionService(ref.read(positionLocalProvider), ref.read(positionRemoteProvider),),);

class PositionService {
  PositionService(this._positionLocal, this._positionRemote);

  final PositionLocal _positionLocal;
  final PositionRemote _positionRemote;

  Future<LocationData> getPosition() async {
    return (await _positionLocal.getPosition())!;
  }

  Future<String> getSettlement(Position position) async {
    return await _positionRemote.getSettlement(position);
  }
}