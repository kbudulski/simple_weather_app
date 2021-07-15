import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/app_theme.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: gradientSystemStyle,
      child: Scaffold(
        appBar: _mainAppBar(context),
        body: Container(
          decoration: _weatherBackground(),
          child: const Center(
            child: Text('Weather page here.'),
          ),
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }

  AppBar _mainAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        _appBarPlacesButton(context),
        _appBarOptionsButton(context),
      ],
    );
  }

  TextButton _appBarPlacesButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/places'),
      child: const Text(
        'Places',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  PopupMenuButton<int> _appBarOptionsButton(BuildContext context) {
    return PopupMenuButton<int>(
      shape: roundedShape,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        const PopupMenuItem<int>(
          value: 0,
          child: Text('Settings'),
        ),
      ],
      onSelected: (int item) => _onAppBarOptionSelected(item, context),
    );
  }

  void _onAppBarOptionSelected(int item, BuildContext context) {
    if (item == 0) {
      Navigator.of(context).pushNamed('/settings');
    }
  }

  BoxDecoration _weatherBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[AppColors.darkBlue, AppColors.lightBlue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
