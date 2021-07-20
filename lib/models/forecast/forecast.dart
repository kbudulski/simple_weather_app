import 'package:simple_weather_app/values/enums.dart';

class Forecast {
  Forecast({
    required this.current,
    required this.lastUpdated,
    required this.longitude,
    required this.latitude,
    required this.daily,
  });

  factory Forecast.mockable() {
    return Forecast(
      current: WeatherCurrent(
        sunrise: 10,
        sunset: 20,
        windSpeed: 2,
        clouds: 20,
        uvi: 5,
      ),
      lastUpdated: DateTime(2021),
      longitude: 10,
      latitude: 10,
      daily: <WeatherDaily>[
        WeatherDaily(
          condition: WeatherCondition.thunderstorm,
          temp: 300,
          date: DateTime(2021),
        ),
        WeatherDaily(
          condition: WeatherCondition.clouds,
          temp: 400,
          date: DateTime(2022),
        ),
        WeatherDaily(
          condition: WeatherCondition.clear,
          temp: 500,
          date: DateTime(2023),
        ),
        WeatherDaily(
          condition: WeatherCondition.snow,
          temp: 500,
          date: DateTime(2024),
        ),
        WeatherDaily(
          condition: WeatherCondition.rain,
          temp: 500,
          date: DateTime(2025),
        ),
        WeatherDaily(
          condition: WeatherCondition.drizzle,
          temp: 500,
          date: DateTime(2026),
        ),
        WeatherDaily(
          condition: WeatherCondition.other,
          temp: 500,
          date: DateTime(2027),
        ),
        WeatherDaily(
          condition: WeatherCondition.drizzle,
          temp: 500,
          date: DateTime(2028),
        ),
      ],
    );
  }

  final WeatherCurrent current;
  final DateTime lastUpdated;
  final double longitude;
  final double latitude;
  final List<dynamic> daily;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Forecast &&
          runtimeType == other.runtimeType &&
          longitude == other.longitude &&
          latitude == other.latitude;

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}

class WeatherDaily {
  WeatherDaily({
    required this.condition,
    required this.temp,
    required this.date,
  });

  final WeatherCondition condition;
  final double temp;
  final DateTime date;
}

class WeatherCurrent {
  WeatherCurrent({
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.clouds,
    required this.uvi,
  });

  final int sunrise;
  final int sunset;
  final double windSpeed;
  final int clouds;
  final double uvi;
}
