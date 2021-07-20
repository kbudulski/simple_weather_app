// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_raw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForecastRaw _$_$_ForecastRawFromJson(Map<String, dynamic> json) {
  return _$_ForecastRaw(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
    json['timezone'] as String,
    json['timezone_offset'] as int,
    Current.fromJson(json['current'] as Map<String, dynamic>),
    (json['daily'] as List<dynamic>)
        .map((e) => Daily.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ForecastRawToJson(_$_ForecastRaw instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
      'daily': instance.daily,
    };

_$_Current _$_$_CurrentFromJson(Map<String, dynamic> json) {
  return _$_Current(
    json['dt'] as int,
    json['sunrise'] as int,
    json['sunset'] as int,
    (json['temp'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
    json['pressure'] as int,
    json['humidity'] as int,
    (json['dew_point'] as num?)?.toDouble(),
    (json['uvi'] as num).toDouble(),
    json['clouds'] as int,
    json['visibility'] as int,
    (json['wind_speed'] as num).toDouble(),
    json['wind_deg'] as int?,
    (json['wind_gust'] as num?)?.toDouble(),
    (json['weather'] as List<dynamic>)
        .map((e) => ForecastWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CurrentToJson(_$_Current instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
    };

_$_ForecastWeather _$_$_ForecastWeatherFromJson(Map<String, dynamic> json) {
  return _$_ForecastWeather(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$_$_ForecastWeatherToJson(_$_ForecastWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_Daily _$_$_DailyFromJson(Map<String, dynamic> json) {
  return _$_Daily(
    json['dt'] as int,
    json['sunrise'] as int,
    json['sunset'] as int,
    json['moonrise'] as int,
    json['moonset'] as int,
    (json['moon_phase'] as num).toDouble(),
    Temp.fromJson(json['temp'] as Map<String, dynamic>),
    FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
    json['pressure'] as int,
    json['humidity'] as int,
    (json['dew_point'] as num).toDouble(),
    (json['wind_speed'] as num).toDouble(),
    json['wind_deg'] as int?,
    (json['wind_gust'] as num?)?.toDouble(),
    (json['weather'] as List<dynamic>)
        .map((e) => ForecastWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['clouds'] as int,
    (json['pop'] as num?)?.toDouble(),
    (json['rain'] as num?)?.toDouble(),
    (json['uvi'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_DailyToJson(_$_Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
      'uvi': instance.uvi,
    };

_$_FeelsLike _$_$_FeelsLikeFromJson(Map<String, dynamic> json) {
  return _$_FeelsLike(
    (json['day'] as num).toDouble(),
    (json['night'] as num).toDouble(),
    (json['eve'] as num).toDouble(),
    (json['morn'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_FeelsLikeToJson(_$_FeelsLike instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

_$_Temp _$_$_TempFromJson(Map<String, dynamic> json) {
  return _$_Temp(
    (json['day'] as num).toDouble(),
    (json['min'] as num).toDouble(),
    (json['max'] as num).toDouble(),
    (json['night'] as num).toDouble(),
    (json['eve'] as num).toDouble(),
    (json['morn'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_TempToJson(_$_Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
