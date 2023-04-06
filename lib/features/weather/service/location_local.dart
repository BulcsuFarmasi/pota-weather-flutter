import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<LocationLocal> locationLocalProvider = Provider<LocationLocal>((Ref ref) => LocationLocal());

class LocationLocal {
  LocationLocal(this._location);

  final Location _location;


}