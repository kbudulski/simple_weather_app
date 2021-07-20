abstract class IWeatherRepository {
  Future<dynamic> getWeatherFromSearch(String city);

  Future<dynamic> getWeatherFromRadarLocation();

  Future<dynamic> getWeatherFromCordsOnly(double latitude, double longitude);
}
