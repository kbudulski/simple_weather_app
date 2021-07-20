import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_weather_app/models/weather/weather.dart';
import 'package:simple_weather_app/repositories/hive_favorites_repository/i_hive__favorites_repository.dart';
import 'package:simple_weather_app/values/environment.dart';

@devEnv
@prodEnv
@LazySingleton(as: IHiveFavoritesRepository)
class HiveFavoritesRepository implements IHiveFavoritesRepository {
  @override
  Future<Weather?> get(dynamic id) async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      return _box.get(id);
    } catch (e) {
      throw Exception('Failed to get the value from the box.');
    }
  }

  @override
  Future<Weather?> getFirst() async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      return _box.getAt(0);
    } catch (e) {
      throw Exception('Failed to get the value from the box.');
    }
  }

  @override
  Future<List<Weather>> getAll() async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      return _box.values.toList();
    } catch (e) {
      throw Exception('Failed to get the value from the box.');
    }
  }

  @override
  Future<void> add(dynamic object) async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      if (!_box.isOpen) {
        return;
      }
      final Weather fav = object as Weather;
      await _box.put(fav.location, fav);
    } catch (e) {
      throw Exception('Failed to add the value to the box.');
    }
  }

  @override
  Future<void> remove(dynamic object) async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      if (!_box.isOpen) {
        return;
      }
      final Weather fav = object as Weather;

      await _box.delete(fav.location);
    } catch (e) {
      throw Exception('Failed to add the value to the box.');
    }
  }

  @override
  Future<void> update(dynamic object) async {
    try {
      final Box<Weather> _box = Hive.box('favLocations');
      if (!_box.isOpen) {
        return;
      }
      final Weather fav = object as Weather;
      await _box.put(fav.location, fav);
    } catch (e) {
      throw Exception('Failed to add the value to the box.');
    }
  }
}
