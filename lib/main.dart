import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_weather_app/app/simple_weather_app.dart';
import 'package:simple_weather_app/injection/injection.dart';
import 'package:simple_weather_app/values/environment.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'private.env');
  configureDependencies(prodEnv.name);
  runApp(const SimpleWeatherApp());
}
