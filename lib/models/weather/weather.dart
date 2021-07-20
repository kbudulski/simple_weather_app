import 'package:hive/hive.dart';
import 'package:simple_weather_app/values/enums.dart';

part 'weather.g.dart';

@HiveType(typeId: 0, adapterName: 'WeatherLocationsAdapter')
class Weather extends HiveObject {
  Weather({
    required this.location,
    required this.weatherCondition,
    required this.temp,
    required this.tempFeelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.latitude,
    required this.longitude,
  });

  factory Weather.mockable({String location = 'Test location'}) {
    return Weather(
      location: location,
      temp: 310,
      tempFeelsLike: 300,
      tempMin: 290,
      tempMax: 320,
      humidity: 100,
      pressure: 1016,
      latitude: 0,
      longitude: 0,
      weatherCondition: WeatherCondition.clear,
    );
  }

  Weather copyWith({
    String? location,
    WeatherCondition? weatherCondition,
    double? temp,
    double? tempFeelsLike,
    double? tempMin,
    double? tempMax,
    int? humidity,
    int? pressure,
    double? latitude,
    double? longitude,
  }) =>
      Weather(
        location: location ?? this.location,
        temp: temp ?? this.temp,
        tempFeelsLike: tempFeelsLike ?? this.tempFeelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        humidity: humidity ?? this.humidity,
        pressure: pressure ?? this.pressure,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        weatherCondition: weatherCondition ?? this.weatherCondition,
      );

  @HiveField(0)
  final String location;
  @HiveField(1)
  final WeatherCondition weatherCondition;
  @HiveField(2)
  final double temp;
  @HiveField(3)
  final double tempFeelsLike;
  @HiveField(4)
  final double tempMin;
  @HiveField(5)
  final double tempMax;
  @HiveField(6)
  final int humidity;
  @HiveField(7)
  final int pressure;
  @HiveField(8)
  final double latitude;
  @HiveField(9)
  final double longitude;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          weatherCondition == other.weatherCondition &&
          temp == other.temp &&
          tempFeelsLike == other.tempFeelsLike &&
          tempMin == other.tempMin &&
          tempMax == other.tempMax &&
          humidity == other.humidity &&
          pressure == other.pressure &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode =>
      location.hashCode ^
      weatherCondition.hashCode ^
      temp.hashCode ^
      tempFeelsLike.hashCode ^
      tempMin.hashCode ^
      tempMax.hashCode ^
      humidity.hashCode ^
      pressure.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
}
