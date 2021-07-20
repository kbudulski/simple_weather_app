import 'package:flutter/material.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/pages/places/view/places_page.dart';
import 'package:simple_weather_app/pages/settings/view/settings_page.dart';
import 'package:simple_weather_app/pages/weather/view/weather_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

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
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).error),
        ),
        body: Center(
          child: Text(S.of(context).error),
        ),
      );
    });
  }
}
