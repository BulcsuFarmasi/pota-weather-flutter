import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final Provider<Location> locationProvider = Provider<Location>((Ref ref) => Location());