import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:pota_weather_flutter/features/weather/data/position_exception.dart';
import 'package:pota_weather_flutter/shared/providers/location_provider.dart';

final Provider<PositionLocal> positionLocalProvider = Provider<PositionLocal>(
  (Ref ref) => PositionLocal(
    ref.read(locationProvider),
  ),
);

class PositionLocal {
  PositionLocal(this._location);

  final Location _location;

  Future<LocationData> getPosition() async {
    bool serviceEnabled = await _location.serviceEnabled();

    serviceEnabled = !serviceEnabled ? await _location.requestService() : serviceEnabled;

    if (!serviceEnabled) {
      throw PositionException();
    }

    PermissionStatus permission = await _location.hasPermission();

    permission = permission == PermissionStatus.denied ? await _location.requestPermission() : permission;

    if (permission != PermissionStatus.granted) {
      throw PositionException();
    }


    return _location.getLocation();
  }
}
