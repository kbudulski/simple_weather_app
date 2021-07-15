
import 'package:flutter/material.dart';
import 'package:simple_weather_app/services/route_generator.dart';

class SimpleWeatherApp extends StatelessWidget {
  const SimpleWeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Weather App',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
