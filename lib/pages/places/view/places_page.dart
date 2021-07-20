import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/pages/weather/view/weather_icon.dart';
import 'package:simple_weather_app/utils/converter.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/app_theme.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: defaultSystemStyle,
      child: Scaffold(
        backgroundColor: AppColors.whiteCream,
        appBar: _placesAppBar(context),
        body: _favoritePlacesListenable(),
      ),
    );
  }

  ValueListenableBuilder<Box<Weather>> _favoritePlacesListenable() {
    return ValueListenableBuilder<Box<Weather>>(
      valueListenable: Hive.box<Weather>('favLocations').listenable(),
      builder: (BuildContext context, Box<Weather> box, _) {
        final List<Weather> favPlaces = box.values.toList().cast<Weather>();
        return _buildFavoritePlacesList(favPlaces, box, context);
      },
    );
  }

  AppBar _placesAppBar(BuildContext context) => AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(S.of(context).places,
            style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: _placesAppBarActions(context),
      );

  List<Widget> _placesAppBarActions(BuildContext context) => <Widget>[
        IconButton(
          onPressed: () => context.read<WeatherCubit>().updateAllFavorites(),
          icon: const Icon(Icons.refresh, color: Colors.black),
        ),
      ];

  Widget _buildFavoritePlacesList(
          List<Weather> favPlaces, Box<Weather> box, BuildContext context) =>
      favPlaces.isNotEmpty
          ? ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  _placesDivider(),
              itemCount: favPlaces.length,
              itemBuilder: (BuildContext context, int index) =>
                  _placeListElement(
                      context, box, index, favPlaces[index], favPlaces),
            )
          : _emptyPlacesFiller(context);

  Dismissible _placeListElement(BuildContext context, Box<Weather> box,
          int index, Weather weather, List<Weather> favPlaces) =>
      Dismissible(
        background: Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete),
        ),
        key: UniqueKey(),
        onDismissed: (_) async => _onLocationCardDismissed(context, box, index),
        child: _favoritePlaceCard(context, weather, favPlaces, index),
      );

  Card _favoritePlaceCard(BuildContext context, Weather weather,
          List<Weather> favPlaces, int index) =>
      Card(
        shape: const RoundedRectangleBorder(),
        elevation: 4,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () => _onLocationCardTapped(context, weather),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _favoritePlaceName(favPlaces, index),
                    _favoritePlaceDetails(weather),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Divider _placesDivider() => const Divider(
        height: 0,
        thickness: 1,
        indent: 8,
        endIndent: 8,
      );

  Center _emptyPlacesFiller(BuildContext context) => Center(
        child: Text(
          S.of(context).addSomeToFavorite,
          style: const TextStyle(fontSize: 20),
        ),
      );

  Widget _favoritePlaceDetails(Weather weather) {
    final int temp = quickConvertTempUnit(weather.temp).round();
    final int tempMin = quickConvertTempUnit(weather.tempMin).round();
    final int tempMax = quickConvertTempUnit(weather.tempMax).round();

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            WeatherIcon(weather.weatherCondition, iconSize: 35),
            Text('$temp°', style: const TextStyle(fontSize: 25)),
          ],
        ),
        Text('$tempMin°/$tempMax°'),
      ],
    );
  }

  Padding _favoritePlaceName(List<Weather> favPlaces, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              favPlaces[index].location,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      );

  void _onLocationCardTapped(BuildContext context, Weather weather) {
    context
        .read<WeatherCubit>()
        .fetchWeatherByCoordinates(weather.latitude, weather.longitude);
    Navigator.of(context).pop();
  }

  Future<void> _onLocationCardDismissed(
      BuildContext context, Box<Weather> box, int index) {
    context.read<WeatherCubit>().refreshWeather();
    return box.deleteAt(index);
  }
}
