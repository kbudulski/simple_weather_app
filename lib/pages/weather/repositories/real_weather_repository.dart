import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/pages/weather/models/weather.dart';
import 'package:simple_weather_app/pages/weather/repositories/i_weather_repository.dart';
import 'package:simple_weather_app/services/weather_api_service/open_weather_api_service_impl.dart';
import 'package:simple_weather_app/values/environment.dart';

@prodEnv
@LazySingleton(as: IWeatherRepository)
class RealWeatherRepository implements IWeatherRepository {

  final OpenWeatherApiService _openWeatherApiService = OpenWeatherApiService();

  @override
  Future<Either<Exception, Weather>> getWeather(String city) async {
    return _openWeatherApiService.getWeather(city);
  }
}
