import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/generated/l10n.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/values/app_colors.dart';

class ManualLocationInput extends StatelessWidget {
  ManualLocationInput({Key? key, this.autofocus = false}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final bool autofocus;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: _controller,
        autofocus: autofocus,
        textInputAction: TextInputAction.done,
        decoration: _locationFieldDecoration(context),
        onFieldSubmitted: (String text) =>
            context.read<WeatherCubit>().fetchWeatherByCity(text),
      );

  InputDecoration _locationFieldDecoration(BuildContext context) =>
      InputDecoration(
        filled: true,
        fillColor: AppColors.darkCream,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        hintText: S.of(context).search,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        suffixIcon: IconButton(
          onPressed: _controller.clear,
          icon: const Icon(Icons.clear),
        ),
      );
}
