import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/forecast/forecast.dart';
import 'package:simple_weather_app/models/forecast/forecast_raw.dart';
import 'package:simple_weather_app/services/weather_api_service/open_weather_api_service_impl.dart';
import 'package:simple_weather_app/values/environment.dart';
import 'package:simple_weather_app/utils/converter.dart';

import 'i_forecast_repository.dart';

@prodEnv
@LazySingleton(as: IForecastRepository)
class RealForecastRepository implements IForecastRepository {
  final OpenWeatherApiService _openWeatherApiService = OpenWeatherApiService();

  @override
  Future<Forecast> getWeatherFromCoordinates(
      double latitude, double longitude) async {
    try {
      final ForecastRaw forecastRaw =
          await _openWeatherApiService.getForecastByCords(latitude, longitude);
      final Forecast forecast = _convertRawDataToForecastModel(forecastRaw);
      return forecast;
    } catch (e) {
      throw Exception(e);
    }
  }

  Forecast _convertRawDataToForecastModel(ForecastRaw raw) {
    return Forecast(
      current: _convertRawDataToWeatherCurrentModel(raw.current),
      lastUpdated: DateTime.now(),
      longitude: raw.lon,
      latitude: raw.lat,
      daily: _convertRawDataToDailies(raw.daily),
    );
  }

  WeatherCurrent _convertRawDataToWeatherCurrentModel(Current raw) {
    return WeatherCurrent(
      sunrise: raw.sunrise,
      sunset: raw.sunset,
      windSpeed: raw.windSpeed,
      clouds: raw.clouds,
      uvi: raw.uvi,
    );
  }

  List<WeatherDaily> _convertRawDataToDailies(List<Daily> daily) {
    final List<WeatherDaily> dailyList = <WeatherDaily>[];
    for (final Daily raw in daily) {
      final WeatherDaily daily = WeatherDaily(
        condition: raw.weather[0].main.toCondition,
        temp: raw.temp.day,
        date: DateTime.fromMillisecondsSinceEpoch((raw.dt) * 1000, isUtc: true),
      );
      dailyList.add(daily);
    }
    return dailyList;
  }
}
