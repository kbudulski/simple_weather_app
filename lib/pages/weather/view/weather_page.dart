import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/pages/weather/view/starter_page.dart';
import 'package:simple_weather_app/pages/weather/view/weather_data_details.dart';
import 'package:simple_weather_app/shared/reusable_widgets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Widget nextView = Container();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (BuildContext context, WeatherState state) =>
          _showErrorSnackbars(state, context),
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherInitial) {
          return ReusableWidgets.customLoading();
        } else if (state is WeatherInitialLoadError) {
          return nextView = StarterPage();
        } else if (state is WeatherLoading) {
          return ReusableWidgets.customLoading();
        } else if (state is WeatherSilentLoading) {
          return nextView;
        } else if (state is WeatherLoaded) {
          return nextView = WeatherDataDetails(
            weather: state.weather,
            forecast: state.forecast,
            isFavorite: state.isFavorite,
            isLocatedByRadar: state.isLocatedByRadar,
            onRefresh: () => context.read<WeatherCubit>().refreshWeather(),
          );
        } else if (state is WeatherLoadError) {
          return nextView;
        }
        return ReusableWidgets.customLoading();
      },
    );
  }

  void _showErrorSnackbars(WeatherState state, BuildContext context) {
    if (state is WeatherLoadError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.error)));
    }
    if (state is WeatherInitialLoadError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
