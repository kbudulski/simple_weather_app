import 'package:flutter/material.dart';
import 'package:simple_weather_app/utils/converter.dart';
import 'package:simple_weather_app/values/enums.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground(this.weatherCondition);

  final WeatherCondition weatherCondition;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = getWeatherGradientColors(weatherCondition);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
