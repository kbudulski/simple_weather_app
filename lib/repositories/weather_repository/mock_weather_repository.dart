import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/values/environment.dart';

import 'i_weather_repository.dart';

@devEnv
@LazySingleton(as: IWeatherRepository)
class MockWeatherRepository implements IWeatherRepository {

  @override
  Future<Weather> getWeatherFromSearch(String city) async {
    if (city == 'pass') {
      return Weather.mockable(location: 'Search location');
    } else if (city == 'storage location 1' ||
        city == 'storage location 2' ||
        city == 'storage location 3') {
      return Weather.mockable(location: city);
    } else {
      throw Exception('Mock repo exception from manual search.');
    }
  }

  @override
  Future<Weather> getWeatherFromRadarLocation() async {
      return Weather.mockable(location: 'GPS location');
  }

  @override
  Future<Weather> getWeatherFromCordsOnly(
      double latitude, double longitude) async {
    if (latitude == 0 && longitude == 0) {
      return Weather.mockable(location: 'Coordinates location');
    } else {
      throw Exception('Mock repo exception from coordinates search.');
    }
  }
}
