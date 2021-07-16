abstract class IWeatherRepository {
  Future<dynamic> getWeather(String city);
}