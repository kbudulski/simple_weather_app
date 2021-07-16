import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/pages/weather/models/weather.dart';
import 'package:simple_weather_app/pages/weather/repositories/i_weather_repository.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState.initial());

  final IWeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? location) async {
    if (location == null || location.isEmpty) return;
    emit(const WeatherState.weatherLoading());
    (await _weatherRepository.getWeather(location)).fold(
          (dynamic error) => emit(WeatherState.weatherLoadError(error.toString())),
          (Weather weather) => emit(WeatherState.weatherLoaded(weather)),
    );
  }
}
