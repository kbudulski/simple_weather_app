import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/enums.dart';

double quickConvertTempUnit(double temperature) {
  final Box<String> box = Hive.box('settings');
  final String tempUnit =
      box.get('tempUnit', defaultValue: 'Celsius').toString();
  if (tempUnit == 'Celsius') {
    return temperature.fromKelvinToCelsius();
  } else if (tempUnit == 'Fahrenheit') {
    return temperature.fromKelvinToFahrenheit();
  }
  return temperature;
}

List<Color> getWeatherGradientColors(WeatherCondition weatherCondition) {
  switch (weatherCondition) {
    case WeatherCondition.thunderstorm:
      return <Color>[AppColors.darkStorm, AppColors.lightStorm];
    case WeatherCondition.drizzle:
      return <Color>[AppColors.darkVenice, AppColors.lightVenice];
    case WeatherCondition.rain:
      return <Color>[AppColors.darkRain, AppColors.lightRain];
    case WeatherCondition.snow:
      return <Color>[AppColors.darkWinter, AppColors.lightWinter];
    case WeatherCondition.clear:
      return <Color>[AppColors.darkOrange, AppColors.lightOrange];
    case WeatherCondition.clouds:
      return <Color>[AppColors.darkBlue, AppColors.lightBlue];
    default:
      return <Color>[AppColors.darkWarning, AppColors.lightWarning];
  }
}

extension on double {
  double fromKelvinToFahrenheit() => (this * 9 / 5) - 459.67;

  double fromKelvinToCelsius() => this - 273.15;
}

extension WeatherColor on WeatherCondition {
  Color get toColor {
    switch (this) {
      case WeatherCondition.thunderstorm:
        return AppColors.lightStorm;
      case WeatherCondition.drizzle:
        return AppColors.lightVenice;
      case WeatherCondition.rain:
        return AppColors.lightRain;
      case WeatherCondition.snow:
        return AppColors.lightWinter;
      case WeatherCondition.clear:
        return AppColors.lightOrange;
      case WeatherCondition.clouds:
        return AppColors.lightBlue;
      default:
        return AppColors.lightWarning;
    }
  }
}


extension Condition on String {
  WeatherCondition get toCondition {
    switch (this) {
      case 'Thunderstorm':
        return WeatherCondition.thunderstorm;
      case 'Drizzle':
        return WeatherCondition.drizzle;
      case 'Rain':
        return WeatherCondition.rain;
      case 'Snow':
        return WeatherCondition.snow;
      case 'Clear':
        return WeatherCondition.clear;
      case 'Clouds':
        return WeatherCondition.clouds;
      default:
        return WeatherCondition.other;
    }
  }
}