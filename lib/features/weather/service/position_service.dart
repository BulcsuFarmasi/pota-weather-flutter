import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/features/weather/data/position_exception.dart';
import 'package:pota_weather_flutter/features/weather/data/remote_position.dart';
import 'package:pota_weather_flutter/features/weather/service/position_local.dart';
import 'package:pota_weather_flutter/features/weather/service/position_remote.dart';

final Provider<PositionService> positionServiceProvider = Provider<PositionService>(
  (Ref ref) => PositionService(
    ref.read(positionLocalProvider),
    ref.read(positionRemoteProvider),
  ),
);

class PositionService {
  PositionService(this._positionLocal, this._positionRemote);

  final PositionLocal _positionLocal;
  final PositionRemote _positionRemote;

  Future<LocationData> getPosition() async {
    try {
      return _positionLocal.getPosition();
    } on PositionException {
      rethrow;
    }
  }

  Future<RemotePosition> getPositionBySettlement(String settlement) {
    try {
      return _positionRemote.getPositionBySettlement(settlement);
    } on HttpException {
      rethrow;
    }
  }

  Future<String> getSettlement(Position position) async {
    try {
    return await _positionRemote.getSettlement(position);
    } on HttpException {
      rethrow;
    }
  }
}
