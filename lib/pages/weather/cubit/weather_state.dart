part of 'weather_cubit.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => <Object>[];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {}

class WeatherSilentLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(
    this.weather,
    this.forecast, {
    required this.isFavorite,
    required this.isLocatedByRadar,
  });

  final Weather weather;
  final Forecast forecast;
  final bool isFavorite;
  final bool isLocatedByRadar;

  @override
  List<Object> get props =>
      <Object>[weather, forecast, isFavorite, isLocatedByRadar];

  @override
  String toString() {
    return 'WeatherLoaded{weather: ${weather.location}, forecast: $forecast, isFavorite: $isFavorite, isLocatedByRadar: $isLocatedByRadar}';
  }
}

class WeatherLoadError extends WeatherState {
  const WeatherLoadError(this.error);

  final String error;
}

class WeatherInitialLoadError extends WeatherState {
  const WeatherInitialLoadError(this.error);

  final String error;
}
