import 'package:envied/envied.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'OPEN_WEATHER_MAP_KEY')
  static const openWeatherMapKey = _Env.openWeatherMapKey;
}