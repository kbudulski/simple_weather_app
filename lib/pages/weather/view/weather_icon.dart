import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_weather_app/values/enums.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(this.weatherCondition, {required this.iconSize});

  final WeatherCondition weatherCondition;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _getWeatherIcon(),
    );
  }

  SvgPicture _getWeatherIcon() {
    String assetName;
    switch (weatherCondition) {
      case WeatherCondition.thunderstorm:
        assetName = 'assets/weather_icons/wsymbol_0024_thunderstorms.svg';
        break;
      case WeatherCondition.drizzle:
        assetName =
            'assets/weather_icons/wsymbol_0017_cloudy_with_light_rain.svg';
        break;
      case WeatherCondition.rain:
        assetName =
            'assets/weather_icons/wsymbol_0018_cloudy_with_heavy_rain.svg';
        break;
      case WeatherCondition.snow:
        assetName = 'assets/weather_icons/wsymbol_0012_heavy_snow_showers.svg';
        break;
      case WeatherCondition.clear:
        assetName = 'assets/weather_icons/wsymbol_0001_sunny.svg';
        break;
      case WeatherCondition.clouds:
        assetName = 'assets/weather_icons/wsymbol_0003_white_cloud.svg';
        break;
      default:
        assetName = 'assets/weather_icons/wsymbol_0006_mist.svg';
    }
    return SvgPicture.asset(
      assetName,
      height: iconSize,
    );
  }
}
