import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/injection/injection.dart';
import 'package:simple_weather_app/pages/places/view/places_page.dart';
import 'package:simple_weather_app/pages/settings/view/settings_page.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/pages/weather/repositories/i_weather_repository.dart';
import 'package:simple_weather_app/pages/weather/repositories/real_weather_repository.dart';
import 'package:simple_weather_app/pages/weather/view/weather_page.dart';
import 'package:simple_weather_app/services/weather_api_service/open_weather_api_service_impl.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (_) => const WeatherPage());
      case '/settings':
        return MaterialPageRoute<dynamic>(builder: (_) => const SettingsPage());
      case '/places':
        return MaterialPageRoute<dynamic>(builder: (_) => const PlacesPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
