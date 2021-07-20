import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/shared/reusable_widgets.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Box<String> box = Hive.box('settings');

  @override
  Widget build(BuildContext context) {
    final String tempUnit =
        box.get('tempUnit', defaultValue: 'Celsius').toString();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: defaultSystemStyle,
      child: Scaffold(
        backgroundColor: AppColors.whiteCream,
        appBar: ReusableWidgets.whiteAppBar(S.of(context).weatherSettings),
        body: _optionsList(context, tempUnit),
      ),
    );
  }

  SingleChildScrollView _optionsList(BuildContext context, String tempUnit) =>
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _degreeOption(context, tempUnit),
          ],
        ),
      );

  Card _degreeOption(BuildContext context, String tempUnit) => Card(
        shape: roundedShape,
        margin: EdgeInsets.zero,
        child: PopupMenuButton<int>(
          initialValue: tempUnit == 'Celsius' ? 0 : 1,
          shape: roundedShape,
          itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
            PopupMenuItem<int>(
              value: 0,
              child: Text(S.of(context).celsius),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text(S.of(context).fahrenheit),
            ),
          ],
          onSelected: (int item) => _onUnitTempOptionSelected(item, context),
          child: _weatherUnitTempTile(context, tempUnit),
        ),
      );

  ListTile _weatherUnitTempTile(BuildContext context, String tempUnit) =>
      ListTile(
        title: Text(S.of(context).degree),
        subtitle: Text(
          tempUnit == 'Celsius'
              ? S.of(context).celsius
              : S.of(context).fahrenheit,
          style: const TextStyle(color: AppColors.darkBlue),
        ),
      );

  void _onUnitTempOptionSelected(int choice, BuildContext context) {
    if (choice == 0) {
      box.put('tempUnit', 'Celsius');
    } else if (choice == 1) {
      box.put('tempUnit', 'Fahrenheit');
    }
    context.read<WeatherCubit>().refreshWeather();
    setState(() {});
  }
}
