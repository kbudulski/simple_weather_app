import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/models/weather/weather_raw.dart';
import 'package:simple_weather_app/services/location_service/geolocator_service.dart';
import 'package:simple_weather_app/services/weather_api_service/open_weather_api_service_impl.dart';
import 'package:simple_weather_app/utils/converter.dart';
import 'package:simple_weather_app/values/environment.dart';

import 'i_weather_repository.dart';

@prodEnv
@LazySingleton(as: IWeatherRepository)
class OpenWeatherRepository implements IWeatherRepository {
  final OpenWeatherApiService _openWeatherApiService = OpenWeatherApiService();
  final GeolocatorService _geolocatorService = GeolocatorService();

  @override
  Future<Weather> getWeatherFromRadarLocation() async {
    try {
      final Position position = await _geolocatorService.determinePosition();
      final WeatherRaw weatherRaw = await _openWeatherApiService
          .getWeatherByCords(position.latitude, position.longitude);
      final Weather weather = _convertRawDataToWeatherModel(weatherRaw);
      return weather;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Weather> getWeatherFromSearch(String city) async {
    try {
      final WeatherRaw weatherRaw =
          await _openWeatherApiService.getWeatherByCity(city);
      final Weather weather = _convertRawDataToWeatherModel(weatherRaw);
      return weather;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Weather> getWeatherFromCordsOnly(
      double latitude, double longitude) async {
    try {
      final WeatherRaw weatherRaw =
          await _openWeatherApiService.getWeatherByCords(latitude, longitude);
      final Weather weather = _convertRawDataToWeatherModel(weatherRaw);
      return weather;
    } catch (e) {
      throw Exception(e);
    }
  }

  Weather _convertRawDataToWeatherModel(WeatherRaw raw) {
    return Weather(
      location: raw.name,
      weatherCondition: raw.weather[0].main.toCondition,
      temp: raw.main.temp,
      tempFeelsLike: raw.main.feelsLike,
      tempMin: raw.main.tempMin,
      tempMax: raw.main.tempMax,
      humidity: raw.main.humidity,
      pressure: raw.main.pressure,
      latitude: raw.coord.lat,
      longitude: raw.coord.lon,
    );
  }
}
