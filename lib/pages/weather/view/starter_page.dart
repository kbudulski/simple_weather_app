import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/values/app_theme.dart';

import 'manual_location_input.dart';

class StarterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: defaultSystemStyle,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ManualLocationInput(autofocus: true),
                  _radarLocationButton(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _radarLocationButton(BuildContext context) => OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: () =>
            context.read<WeatherCubit>().loadWeatherFromRadarLocation(),
        child: Text(S.of(context).addCurrentLocation),
      );
}
