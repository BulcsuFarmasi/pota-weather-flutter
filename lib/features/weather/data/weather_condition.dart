class WeatherCondition {
  WeatherCondition(this.description, this.icon);

  final String description;

  final String icon;

  String get iconUrl =>  'https://openweathermap.org/img/wn/$icon@4x.png';
}
