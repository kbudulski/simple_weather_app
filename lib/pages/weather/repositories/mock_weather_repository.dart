import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/pages/weather/models/weather.dart';
import 'package:simple_weather_app/pages/weather/repositories/i_weather_repository.dart';
import 'package:simple_weather_app/values/environment.dart';

@devEnv
@LazySingleton(as: IWeatherRepository)
class MockWeatherRepository implements IWeatherRepository {
  @override
  Future<Either<Exception, Weather>> getWeather(String city,
      {bool showError = false}) async {
    if (showError) {
      return left(Exception('Mock exception'));
    } else {
      const Weather weather = Weather(
        <WeatherElement>[WeatherElement(0, 'main', 'description', 'icon')],
        'base',
        Main(1, 2, 3, 4, 5, 6),
        7,
        Wind(1, 2, 3),
        Clouds(1),
        1,
        1,
        'Testing grounds',
        200,
      );
      return right(weather);
    }
  }
}
