import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_weather_app/app/simple_weather_app.dart';
import 'package:simple_weather_app/injection/injection.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/repositories/forecast_repository/i_forecast_repository.dart';
import 'package:simple_weather_app/repositories/hive_favorites_repository/i_hive__favorites_repository.dart';
import 'package:simple_weather_app/repositories/weather_repository/i_weather_repository.dart';
import 'package:simple_weather_app/values/enums.dart';
import 'package:simple_weather_app/values/environment.dart';

// devEnv prodEnv
Future<void> main() async {
  configureDependencies(prodEnv.name);
  await dotenv.load(fileName: 'private.env');
  await _initHive();
  runApp(_withInjections());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherLocationsAdapter());
  Hive.registerAdapter(EnumsAdapter());
  await Hive.openBox<Weather>('favLocations');
  await Hive.openBox<String>('settings');
}

BlocProvider<WeatherCubit> _withInjections() {
  return BlocProvider<WeatherCubit>(
    create: (BuildContext context) => WeatherCubit(
      getIt<IWeatherRepository>(),
      getIt<IHiveFavoritesRepository>(),
      getIt<IForecastRepository>(),
    )..initializeWeather(),
    child: const SimpleWeatherApp(),
  );
}
