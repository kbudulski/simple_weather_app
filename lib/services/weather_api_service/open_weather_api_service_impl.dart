import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_weather_app/pages/weather/models/weather.dart';
import 'package:simple_weather_app/services/weather_api_service/weather_api_service.dart';

class OpenWeatherApiService implements WeatherApiService {
  static String? apiKey = dotenv.env['API_KEY'];
  static const String baseUrl = 'api.openweathermap.org/data/2.5';
  final Dio _dio = Dio();

  @override
  Future<Either<Exception, Weather>> getWeather(String location) async {
    final Response<dynamic> response =
        await _dio.get('http://$baseUrl/weather?q=$location&appid=$apiKey');
    final int? code = response.statusCode;
    if (code != 200) {
      return left(Exception('error retrieving weather for city: $location'
          '\n server code: ${response.statusCode}'));
    } else {
      final Weather weather =
          Weather.fromJson(response.data as Map<String, dynamic>);
      return right(weather);
    }
  }
}
