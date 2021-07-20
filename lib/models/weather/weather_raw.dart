import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_raw.freezed.dart';

part 'weather_raw.g.dart';

@freezed
class WeatherRaw with _$WeatherRaw {
  const factory WeatherRaw(
    Coord coord,
    List<WeatherElement> weather,
    String? base,
    Main main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    int id,
    String name,
    int? cod,
  ) = _WeatherRaw;

  factory WeatherRaw.fromJson(Map<String, dynamic> json) =>
      _$WeatherRawFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord(
    double lon,
    double lat,
  ) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds(
    int all,
  ) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Main with _$Main {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Main(
    double temp,
    double feelsLike,
    double tempMin,
    double tempMax,
    int pressure,
    int humidity,
  ) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class WeatherElement with _$WeatherElement {
  const factory WeatherElement(
    int id,
    String main,
    String description,
    String icon,
  ) = _WeatherElement;

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind(
    double speed,
    int deg,
    double? gust,
  ) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
