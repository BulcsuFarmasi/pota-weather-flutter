import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/position.dart';
import 'package:pota_weather_flutter/shared/providers/location_provider.dart';

final Provider<PositionLocal> positionLocalProvider = Provider<PositionLocal>(
  (Ref ref) => PositionLocal(
    ref.read(locationProvider),
  ),
);

class PositionLocal {
  PositionLocal(this._location);

  final Location _location;

  Future<LocationData?> getPosition() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return Future.value(null);
      }
    }
    PermissionStatus permissonGranted = await _location.hasPermission();
    if (permissonGranted == PermissionStatus.denied) {
      permissonGranted = await _location.requestPermission();
      if (permissonGranted != PermissionStatus.granted) {
        return Future.value(null);
      }
    }

    return _location.getLocation();
  }
}
