import 'package:envied/envied.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'env.g.dart';

final Provider<String> openWeatherMapKeyProvider = Provider<String>((_) => Env.openWeatherMapKey);

@Envied()
abstract class Env {
  @EnviedField(varName: 'OPEN_WEATHER_MAP_KEY')
  static const openWeatherMapKey = _Env.openWeatherMapKey;
}
