abstract class WeatherApiService {
  Future<dynamic> getWeatherByCity(String location);

  Future<dynamic> getWeatherByCords(double latitude, double longitude);

  Future<dynamic> getForecastByCords(double latitude, double longitude);
}
