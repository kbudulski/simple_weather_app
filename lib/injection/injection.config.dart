// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../pages/weather/cubit/weather_cubit.dart' as _i6;
import '../pages/weather/repositories/i_weather_repository.dart' as _i3;
import '../pages/weather/repositories/mock_weather_repository.dart' as _i5;
import '../pages/weather/repositories/real_weather_repository.dart' as _i4;

const String _production = 'production';
const String _development = 'development';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IWeatherRepository>(() => _i4.RealWeatherRepository(),
      registerFor: {_production});
  gh.lazySingleton<_i3.IWeatherRepository>(() => _i5.MockWeatherRepository(),
      registerFor: {_development});
  gh.factory<_i6.WeatherCubit>(
      () => _i6.WeatherCubit(get<_i3.IWeatherRepository>()));
  return get;
}
