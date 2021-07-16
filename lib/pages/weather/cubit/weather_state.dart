part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.weatherLoading() = _WeatherLoading;

  const factory WeatherState.weatherLoaded(Weather weather) = _WeatherLoaded;

  const factory WeatherState.weatherLoadError(String errorMsg) =
      _WeatherLoadError;
}
