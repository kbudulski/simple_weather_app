import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather_app/shared/reusable_widgets.dart';
import 'package:simple_weather_app/values/app_colors.dart';
import 'package:simple_weather_app/values/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: defaultSystemStyle,
      child: Scaffold(
        backgroundColor: AppColors.whiteCream,
        appBar: ReusableWidgets.whiteAppBar('Weather settings'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _degreeOption(),
            ],
          ),
        ),
      ),
    );
  }

  Card _degreeOption() {
    return Card(
      shape: roundedShape,
      margin: EdgeInsets.zero,
      child: PopupMenuButton<int>(
        shape: roundedShape,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Celsius'),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text('Fahrenheit'),
          ),
        ],
        onSelected: (int item) {},
        child: const ListTile(
          title: Text('Degree'),
          subtitle: Text('°C', style: TextStyle(color: AppColors.darkBlue)),
        ),
      ),
    );
  }
}


class WhiteAppBar extends AppBar {

}