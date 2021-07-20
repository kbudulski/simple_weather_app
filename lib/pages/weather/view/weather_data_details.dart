import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/models/forecast/forecast.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/pages/weather/view/weather_background.dart';
import 'package:simple_weather_app/pages/weather/view/weather_icon.dart';
import 'package:simple_weather_app/utils/converter.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/app_theme.dart';
import 'package:simple_weather_app/values/enums.dart';

import 'manual_location_input.dart';

class WeatherDataDetails extends StatelessWidget {
  const WeatherDataDetails({
    Key? key,
    required this.weather,
    required this.forecast,
    required this.onRefresh,
    required this.isFavorite,
    required this.isLocatedByRadar,
  }) : super(key: key);
  final ValueGetter<Future<void>> onRefresh;
  final Weather weather;
  final Forecast forecast;
  final bool isFavorite;
  final bool isLocatedByRadar;

  @override
  Widget build(BuildContext context) {
    final WeatherCondition weatherCondition = weather.weatherCondition;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: weatherCondition.toColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: _mainAppBar(context),
        extendBodyBehindAppBar: true,
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              WeatherBackground(weatherCondition),
              _weatherInfoContent(context, weatherCondition),
            ],
          ),
        ),
      ),
    );
  }

  Container _weatherInfoContent(
          BuildContext context, WeatherCondition weatherCondition) =>
      Container(
        margin: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              _searchTextField(),
              const SizedBox(height: 20),
              _location(isFavorite, context),
              const SizedBox(height: 10),
              _currentWeatherIconAndUnits(weatherCondition),
              const SizedBox(height: 10),
              _feelsLikeTemperature(context),
              const SizedBox(height: 20),
              _weatherDescription(),
              const SizedBox(height: 40),
              _humidityAndPressureInfo(context),
              const SizedBox(height: 40),
              _forecast(),
            ],
          ),
        ),
      );

  Padding _searchTextField() => Padding(
        padding: const EdgeInsets.all(8),
        child: ManualLocationInput(),
      );

  Row _currentWeatherIconAndUnits(WeatherCondition weatherCondition) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WeatherIcon(weatherCondition, iconSize: 80),
          _realTemperature(),
        ],
      );

  AppBar _mainAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          _appBarRadarButton(context),
          _appBarPlacesButton(context),
          _appBarOptionsButton(context),
        ],
      );

  IconButton _appBarRadarButton(BuildContext context) => IconButton(
      onPressed: () {
        context.read<WeatherCubit>().loadWeatherFromRadarLocation();
      },
      icon: Icon(isLocatedByRadar ? Icons.gps_fixed : Icons.gps_not_fixed));

  TextButton _appBarPlacesButton(BuildContext context) => TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/places'),
        child: Text(
          S.of(context).places,
          style: normalWhiteTextStyle,
        ),
      );

  PopupMenuButton<int> _appBarOptionsButton(BuildContext context) =>
      PopupMenuButton<int>(
        shape: roundedShape,
        itemBuilder: (_) => <PopupMenuItem<int>>[
          PopupMenuItem<int>(
            value: 0,
            child: Text(S.of(context).settings),
          ),
        ],
        onSelected: (int item) => _onAppBarOptionSelected(item, context),
      );

  void _onAppBarOptionSelected(int item, BuildContext context) {
    if (item == 0) {
      Navigator.of(context).pushNamed('/settings');
    }
  }

  Widget _location(bool isFavorite, BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          _cityName(),
          _addToFavoritesButton(isFavorite, context),
        ],
      );

  Expanded _addToFavoritesButton(bool isFavorite, BuildContext context) =>
      Expanded(
        child: IconButton(
          alignment: Alignment.centerLeft,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            if (isFavorite) {
              context.read<WeatherCubit>().removeWeatherFromFavorites(weather);
            } else {
              context.read<WeatherCubit>().addWeatherToFavorites(weather);
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      );

  Text _cityName() => Text(weather.location,
      overflow: TextOverflow.ellipsis, style: normalWhiteTextStyle);

  Text _realTemperature() => Text(
        '${quickConvertTempUnit(weather.temp).round()}°',
        style: const TextStyle(
          fontSize: 80,
          color: Colors.white,
        ),
      );

  Text _feelsLikeTemperature(BuildContext context) {
    final String tempMax =
        quickConvertTempUnit(weather.tempMax).round().toString();
    final String tempMin =
        quickConvertTempUnit(weather.tempMin).round().toString();
    final String tempFeelsLike =
        quickConvertTempUnit(weather.tempFeelsLike).round().toString();
    return Text(
      '$tempMax°/$tempMin° ${S.of(context).feelsLike} $tempFeelsLike°',
      style: const TextStyle(
        color: AppColors.whiteCream,
        fontSize: 18,
      ),
    );
  }

  Text _weatherDescription() => Text(
        toBeginningOfSentenceCase(weather.weatherCondition.toShortString())!,
        style: normalWhiteTextStyle,
      );

  Widget _humidityAndPressureInfo(BuildContext context) => Container(
        height: 100,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white.withOpacity(0.2),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _humidityPart(context),
              _cardVerticalDivider(),
              _pressurePart(context),
            ],
          ),
        ),
      );

  VerticalDivider _cardVerticalDivider() {
    return const VerticalDivider(
        color: Colors.white, thickness: 1, indent: 24, endIndent: 24);
  }

  Expanded _pressurePart(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/pressure_icon.svg',
            height: 28,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(S.of(context).pressure, style: normalWhiteTextStyle),
              const SizedBox(height: 6),
              Text('${weather.pressure}', style: normalWhiteTextStyle),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _humidityPart(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/humidity_icon.png', height: 40),
          const SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(S.of(context).humidity, style: normalWhiteTextStyle),
              const SizedBox(height: 6),
              Text('${weather.humidity}', style: normalWhiteTextStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _forecast() {
    final WeatherDaily firstDay = forecast.daily[0] as WeatherDaily;
    final WeatherDaily secondDay = forecast.daily[1] as WeatherDaily;
    final WeatherDaily thirdDay = forecast.daily[2] as WeatherDaily;

    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white.withOpacity(0.2),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _forecastDay(firstDay),
            _forecastDay(secondDay),
            _forecastDay(thirdDay),
          ],
        ),
      ),
    );
  }

  Widget _forecastDay(WeatherDaily weatherDay) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat(DateFormat.ABBR_WEEKDAY).format(weatherDay.date),
              style: normalWhiteTextStyle,
            ),
            const SizedBox(height: 6),
            WeatherIcon(weatherDay.condition, iconSize: 60),
            const SizedBox(height: 6),
            Text('${quickConvertTempUnit(weatherDay.temp).round()}°',
                style: normalWhiteTextStyle),
          ],
        ),
      );
}
