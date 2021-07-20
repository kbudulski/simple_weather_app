import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/repositories/hive_favorites_repository/i_hive__favorites_repository.dart';

class MockHiveFavoritesRepository implements IHiveFavoritesRepository {
  @override
  Future<void> add(dynamic object) async {
    return;
  }

  @override
  Future<Weather> get(dynamic id) {
    return Future<Weather>.value(
        Weather.mockable(location: 'storage location'));
  }

  @override
  Future<List<Weather>> getAll() {
    final List<Weather> weatherList = <Weather>[
      Weather.mockable(location: 'storage location 1'),
      Weather.mockable(location: 'storage location 2'),
      Weather.mockable(location: 'storage location 3'),
    ];
    return Future<List<Weather>>.value(weatherList);
  }

  @override
  Future<Weather> getFirst() {
    return Future<Weather>.value(
        Weather.mockable(location: 'storage location first'));
  }

  @override
  Future<void> remove(dynamic object) async {
    return;
  }

  @override
  Future<void> update(dynamic object) {
    return Future<Weather>.value(
        Weather.mockable(location: 'storage location updated'));
  }
}
