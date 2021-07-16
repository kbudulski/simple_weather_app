import 'package:simple_weather_app/pages/weather/models/weather.dart';

abstract class WeatherApiService {
  Future<dynamic> getWeather(String location);
}