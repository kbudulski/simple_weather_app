import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_weather_app/models/forecast/forecast.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/pages/weather/cubit/weather_cubit.dart';
import 'package:simple_weather_app/repositories/forecast_repository/mock_forecast_repository.dart';
import 'package:simple_weather_app/repositories/hive_favorites_repository/mock_hive_favorites_repository.dart';
import 'package:simple_weather_app/repositories/weather_repository/mock_weather_repository.dart';

void main() {
  group('WeatherCubit', () {
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherCubit = WeatherCubit(
        MockWeatherRepository(),
        MockHiveFavoritesRepository(),
        MockForecastRepository(),
      );
    });

    tearDown(() {
      weatherCubit.close();
    });

    group('emits correct states', () {
      blocTest<WeatherCubit, WeatherState>(
        'emits no state initially',
        build: () => weatherCubit,
        expect: () => <WeatherState>[],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits loaded state with weather from cache or gps',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.initializeWeather(),
        expect: () => <WeatherState>[
          WeatherLoading(),
          WeatherLoaded(
            Weather.mockable(location: 'Coordinates location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: false,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits no state on successful favorite locations reload',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.updateAllFavorites(),
        expect: () => <WeatherState>[],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits silent loading after refresh',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) async {
          await cubit.initializeWeather();
          await cubit.refreshWeather();
        },
        expect: () => <WeatherState>[
          WeatherLoading(),
          WeatherLoaded(
            Weather.mockable(location: 'Coordinates location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: false,
          ),
          WeatherSilentLoading(),
          WeatherLoaded(
            Weather.mockable(location: 'Coordinates location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: false,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits loaded state with gps location and flag on loading from radar location',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) =>
            cubit.loadWeatherFromRadarLocation(initial: true),
        expect: () => <WeatherState>[
          WeatherLoaded(
            Weather.mockable(location: 'GPS location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: true,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits loaded state with city weather data on correct city name',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.fetchWeatherByCity('pass'),
        expect: () => <WeatherState>[
          WeatherLoading(),
          WeatherLoaded(
            Weather.mockable(location: 'Search location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: false,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits error state with on incorrect city name',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.fetchWeatherByCity('shall not pass'),
        expect: () => <dynamic>[
          WeatherLoading(),
          isA<WeatherLoadError>(),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits loaded state with city weather data on correct coordinates',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.fetchWeatherByCoordinates(0, 0),
        expect: () => <dynamic>[
          WeatherLoading(),
          WeatherLoaded(
            Weather.mockable(location: 'Coordinates location'),
            Forecast.mockable(),
            isFavorite: false,
            isLocatedByRadar: false,
          ),
        ],
      );

      blocTest<WeatherCubit, WeatherState>(
        'emits error state with on incorrect coordinates or lack of them',
        build: () => weatherCubit,
        act: (WeatherCubit cubit) => cubit.fetchWeatherByCoordinates(1, 1),
        expect: () => <dynamic>[
          WeatherLoading(),
          isA<WeatherLoadError>(),
        ],
      );
    });
  });
}
