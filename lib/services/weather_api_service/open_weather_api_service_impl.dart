import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_weather_app/models/forecast/forecast_raw.dart';
import 'package:simple_weather_app/models/weather/weather_raw.dart';
import 'package:simple_weather_app/services/weather_api_service/weather_api_service.dart';

class OpenWeatherApiService implements WeatherApiService {
  static String? apiKey = dotenv.env['API_KEY'];
  static const String baseUrl = 'api.openweathermap.org/data/2.5';
  final Dio _dio = Dio();

  @override
  Future<WeatherRaw> getWeatherByCity(String location) async {
    try {
      final Response<dynamic> response =
          await _dio.get('http://$baseUrl/weather?q=$location&appid=$apiKey');
      final WeatherRaw weather =
          WeatherRaw.fromJson(response.data as Map<String, dynamic>);
      return weather;
    } on DioError catch (_) {
      throw Exception('Error retrieving weather for city: $location');
    }
  }

  @override
  Future<WeatherRaw> getWeatherByCords(
      double latitude, double longitude) async {
    try {
      final Response<dynamic> response = await _dio.get(
          'http://$baseUrl/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
      final WeatherRaw weather =
          WeatherRaw.fromJson(response.data as Map<String, dynamic>);
      return weather;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ForecastRaw> getForecastByCords(
      double latitude, double longitude) async {
    try {
      final Response<dynamic> response = await _dio.get(
          'http://$baseUrl/onecall?lat=$latitude&lon=$longitude&exclude=minutely,hourly,alerts&appid=$apiKey');
      final ForecastRaw forecast =
          ForecastRaw.fromJson(response.data as Map<String, dynamic>);
      return forecast;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
