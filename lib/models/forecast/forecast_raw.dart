import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_raw.freezed.dart';
part 'forecast_raw.g.dart';

@freezed
class ForecastRaw with _$ForecastRaw {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ForecastRaw(
    double lat,
    double lon,
    String timezone,
    int timezoneOffset,
    Current current,
    List<Daily> daily,
  ) = _ForecastRaw;

  factory ForecastRaw.fromJson(Map<String, dynamic> json) => _$ForecastRawFromJson(json);
}

@freezed
class Current with _$Current {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Current(
    int dt,
    int sunrise,
    int sunset,
    double temp,
    double feelsLike,
    int pressure,
    int humidity,
    double? dewPoint,
    double uvi,
    int clouds,
    int visibility,
    double windSpeed,
    int? windDeg,
    double? windGust,
    List<ForecastWeather> weather,
  ) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@freezed
class ForecastWeather with _$ForecastWeather {
  const factory ForecastWeather(
    int id,
    String main,
    String description,
    String icon,
  ) = _ForecastWeather;

  factory ForecastWeather.fromJson(Map<String, dynamic> json) => _$ForecastWeatherFromJson(json);
}

@freezed
class Daily with _$Daily {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Daily(
    int dt,
    int sunrise,
    int sunset,
    int moonrise,
    int moonset,
    double moonPhase,
    Temp temp,
    FeelsLike feelsLike,
    int pressure,
    int humidity,
    double dewPoint,
    double windSpeed,
    int? windDeg,
    double? windGust,
    List<ForecastWeather> weather,
    int clouds,
    double? pop,
    double? rain,
    double uvi,
  ) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}

@freezed
class FeelsLike with _$FeelsLike {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeelsLike(
    double day,
    double night,
    double eve,
    double morn,
  ) = _FeelsLike;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => _$FeelsLikeFromJson(json);
}

@freezed
class Temp with _$Temp {
  const factory Temp(
    double day,
    double min,
    double max,
    double night,
    double eve,
    double morn,
  ) = _Temp;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}
