// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['base'] as String,
    Main.fromJson(json['main'] as Map<String, dynamic>),
    json['visibility'] as int,
    Wind.fromJson(json['wind'] as Map<String, dynamic>),
    Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    json['dt'] as int,
    json['id'] as int,
    json['name'] as String,
    json['cod'] as int,
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

_$_Clouds _$_$_CloudsFromJson(Map<String, dynamic> json) {
  return _$_Clouds(
    json['all'] as int,
  );
}

Map<String, dynamic> _$_$_CloudsToJson(_$_Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

_$_Main _$_$_MainFromJson(Map<String, dynamic> json) {
  return _$_Main(
    (json['temp'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
    (json['temp_max'] as num).toDouble(),
    json['pressure'] as int,
    json['humidity'] as int,
  );
}

Map<String, dynamic> _$_$_MainToJson(_$_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_$_WeatherElement _$_$_WeatherElementFromJson(Map<String, dynamic> json) {
  return _$_WeatherElement(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$_$_WeatherElementToJson(_$_WeatherElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_Wind _$_$_WindFromJson(Map<String, dynamic> json) {
  return _$_Wind(
    (json['speed'] as num).toDouble(),
    json['deg'] as int,
    (json['gust'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_WindToJson(_$_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
