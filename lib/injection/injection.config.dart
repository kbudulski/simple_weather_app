// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../pages/weather/cubit/weather_cubit.dart' as _i11;
import '../repositories/forecast_repository/i_forecast_repository.dart' as _i3;
import '../repositories/forecast_repository/mock_forecast_repository.dart'
    as _i4;
import '../repositories/forecast_repository/real_forecast_repository.dart'
    as _i5;
import '../repositories/hive_favorites_repository/hive__favorites_repository.dart'
    as _i7;
import '../repositories/hive_favorites_repository/i_hive__favorites_repository.dart'
    as _i6;
import '../repositories/weather_repository/i_weather_repository.dart' as _i8;
import '../repositories/weather_repository/mock_weather_repository.dart' as _i9;
import '../repositories/weather_repository/open_weather_repository.dart'
    as _i10;

const String _development = 'development';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IForecastRepository>(() => _i4.MockForecastRepository(),
      registerFor: {_development});
  gh.lazySingleton<_i3.IForecastRepository>(() => _i5.RealForecastRepository(),
      registerFor: {_production});
  gh.lazySingleton<_i6.IHiveFavoritesRepository>(
      () => _i7.HiveFavoritesRepository(),
      registerFor: {_development, _production});
  gh.lazySingleton<_i8.IWeatherRepository>(() => _i9.MockWeatherRepository(),
      registerFor: {_development});
  gh.lazySingleton<_i8.IWeatherRepository>(() => _i10.OpenWeatherRepository(),
      registerFor: {_production});
  gh.factory<_i11.WeatherCubit>(() => _i11.WeatherCubit(
      get<_i8.IWeatherRepository>(),
      get<_i6.IHiveFavoritesRepository>(),
      get<_i3.IForecastRepository>()));
  return get;
}
