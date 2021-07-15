import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather_app/values/app_colors.dart';

const SystemUiOverlayStyle gradientSystemStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: AppColors.lightBlue,
);

const SystemUiOverlayStyle defaultSystemStyle = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: AppColors.whiteCream,
);

final RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);
