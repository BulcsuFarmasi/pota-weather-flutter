enum WeatherCondition {
  clearSky('Clear Sky', 'https://openweathermap.org/img/wn/01d@4x.png'),
  fewClouds('Few Clouds', 'https://openweathermap.org/img/wn/02d@4x.png'),
  scatteredClouds('Scattered Clouds', 'https://openweathermap.org/img/wn/03d@4x.png'),
  brokenClouds('Broken Clouds', 'https://openweathermap.org/img/wn/04d@4x.png'),
  showerRain('Shower Rain', 'https://openweathermap.org/img/wn/09d@4x.png'),
  rain('Rain', 'https://openweathermap.org/img/wn/10d@4x.png'),
  thunderstorm('Thunderstorm', 'https://openweathermap.org/img/wn/11d@4x.png'),
  snow('Snow', 'https://openweathermap.org/img/wn/13d@4x.png'),
  mist('Mist', 'https://openweathermap.org/img/wn/50d@4x.png');

  final String text;
  final String iconUrl;

  const WeatherCondition(this.text, this.iconUrl);
}
