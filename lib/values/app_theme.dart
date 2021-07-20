import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather_app/values/app_colors.dart';

const SystemUiOverlayStyle defaultSystemStyle = SystemUiOverlayStyle(
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: AppColors.whiteCream,
);

final RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

const TextStyle normalWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);
