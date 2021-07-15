import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather_app/shared/reusable_widgets.dart';
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
          appBar: ReusableWidgets.whiteAppBar('Places'),
          body: const Center(child: Text('List of places here.'))),
    );
  }
}
