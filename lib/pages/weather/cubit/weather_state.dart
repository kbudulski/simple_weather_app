part of 'weather_cubit.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
}
