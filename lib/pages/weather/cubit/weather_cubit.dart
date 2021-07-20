import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/forecast/forecast.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/repositories/forecast_repository/i_forecast_repository.dart';
import 'package:simple_weather_app/repositories/hive_favorites_repository/i_hive__favorites_repository.dart';
import 'package:simple_weather_app/repositories/weather_repository/i_weather_repository.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._weatherRepository,
    this._hiveFavoritesRepository,
    this._forecastRepository,
  ) : super(const WeatherInitial());

  final IWeatherRepository _weatherRepository;
  final IForecastRepository _forecastRepository;
  final IHiveFavoritesRepository _hiveFavoritesRepository;

  late Weather _weatherTemp;
  late Forecast _forecastTemp;
  late bool _isLocatedByRadar;

  Future<void> initializeWeather() async {
    emit(WeatherLoading());
    try {
      await _loadWeatherFromCache();
    } catch (e) {
      await loadWeatherFromRadarLocation(initial: true);
    }
  }

  Future<void> loadWeatherFromRadarLocation({bool initial = false}) async {
    try {
      final Weather weather =
          await _weatherRepository.getWeatherFromRadarLocation() as Weather;
      await _makeChecksAndLoadWeather(weather, isRadarLocated: true);
    } catch (e) {
      if (initial) {
        emit(WeatherInitialLoadError(e.toString()));
      } else {
        emit(WeatherLoadError(e.toString()));
      }
    }
  }

  Future<void> fetchWeatherByCity(String manualLocation) async {
    if (manualLocation.isEmpty) return;
    emit(WeatherLoading());
    try {
      final Weather weather = await _weatherRepository
          .getWeatherFromSearch(manualLocation) as Weather;
      await _makeChecksAndLoadWeather(weather);
    } catch (e) {
      emit(WeatherLoadError('Could not get weather for $manualLocation.'));
    }
  }

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    emit(WeatherLoading());
    try {
      final Weather weather =
          await _weatherRepository.getWeatherFromCordsOnly(lat, lon) as Weather;
      await _makeChecksAndLoadWeather(weather);
    } catch (e) {
      emit(const WeatherLoadError('Could not get weather from coordinates.'));
    }
  }

  Future<void> refreshWeather() async {
    emit(WeatherSilentLoading());
    try {
      final Weather weather = await _weatherRepository.getWeatherFromCordsOnly(
          _weatherTemp.latitude, _weatherTemp.longitude) as Weather;
      await _makeChecksAndLoadWeather(weather,
          isRadarLocated: _isLocatedByRadar);
    } catch (e) {
      emit(const WeatherLoadError('Could not refresh weather.'));
    }
  }

  Future<void> addWeatherToFavorites(Weather weather) async {
    try {
      _hiveFavoritesRepository.add(weather);
      emit(WeatherLoaded(weather, _forecastTemp,
          isFavorite: true, isLocatedByRadar: _isLocatedByRadar));
    } catch (e) {
      emit(const WeatherLoadError('Could not add weather to favorites.'));
    }
  }

  Future<void> removeWeatherFromFavorites(Weather weather) async {
    try {
      await _hiveFavoritesRepository.remove(weather);
      emit(WeatherLoaded(weather, _forecastTemp,
          isFavorite: false, isLocatedByRadar: _isLocatedByRadar));
    } catch (e) {
      emit(const WeatherLoadError('Could not remove weather from favorites.'));
    }
  }

  Future<void> updateAllFavorites() async {
    try {
      final List<Weather> allFavorites =
          await _hiveFavoritesRepository.getAll() as List<Weather>;
      for (final Weather favorite in allFavorites) {
        final Weather weather = await _weatherRepository
            .getWeatherFromSearch(favorite.location) as Weather;
        await _hiveFavoritesRepository.update(weather);
      }
    } catch (e) {
      emit(const WeatherLoadError('Could not refresh all favorite places.'));
    }
  }

  void _updateTemps(Weather weather, Forecast forecast, bool isLocatedByRadar) {
    _weatherTemp = weather;
    _forecastTemp = forecast;
    _isLocatedByRadar = isLocatedByRadar;
  }

  Future<bool> _checkIfIsWeatherLocationFavorite(Weather weather) async {
    final List<Weather> weatherList =
        await _hiveFavoritesRepository.getAll() as List<Weather>;
    final String weatherLocation = weather.location;
    try {
      weatherList
          .firstWhere((Weather element) => element.location == weatherLocation);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _makeChecksAndLoadWeather(Weather weather,
      {bool isRadarLocated = false}) async {
    final Forecast forecast = await _forecastRepository
            .getWeatherFromCoordinates(weather.latitude, weather.longitude)
        as Forecast;
    final bool isFavorite = await _checkIfIsWeatherLocationFavorite(weather);
    _updateTemps(weather, forecast, isRadarLocated);
    emit(WeatherLoaded(weather, forecast,
        isFavorite: isFavorite, isLocatedByRadar: isRadarLocated));
  }

  Future<void> _loadWeatherFromCache() async {
    emit(WeatherLoading());
    final Weather? favLocation =
        await _hiveFavoritesRepository.getFirst() as Weather?;
    final Weather weather = await _weatherRepository.getWeatherFromCordsOnly(
        favLocation!.latitude, favLocation.longitude) as Weather;
    await _makeChecksAndLoadWeather(weather);
  }

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);
    print(change);
  }
}
