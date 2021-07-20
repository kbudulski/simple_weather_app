import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/forecast/forecast.dart';
import 'package:simple_weather_app/values/environment.dart';

import 'i_forecast_repository.dart';

@devEnv
@LazySingleton(as: IForecastRepository)
class MockForecastRepository implements IForecastRepository {
  @override
  Future<Forecast> getWeatherFromCoordinates(
      double latitude, double longitude) async {
    if (latitude == 0 && longitude == 0) {
      return Forecast.mockable();
    } else {
      throw Exception('Mock repo exception from coordinates search.');
    }
  }
}
