abstract class IForecastRepository {
  Future<dynamic> getWeatherFromCoordinates(double latitude, double longitude);
}
