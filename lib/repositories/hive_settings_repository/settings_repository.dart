import 'package:hive/hive.dart';

class HiveSettingsRepository {
  Future<String> get(dynamic id) async {
    try {
      final Box<String> _box = Hive.box('settings');
      return _box.get(id)!;
    } catch (e) {
      throw Exception('Failed to get the value from the box.');
    }
  }

  Future<void> add(dynamic object) async {
    try {
      final Box<String> _box = Hive.box('settings');
      if (!_box.isOpen) {
        return;
      }
      await _box.add(object as String);
    } catch (e) {
      throw Exception('Failed to add the value to the box.');
    }
  }

  Future<void> remove(dynamic object) async {
    try {
      final Box<String> _box = Hive.box('settings');
      if (!_box.isOpen) {
        return;
      }
      await _box.delete(object as String);
    } catch (e) {
      throw Exception('Failed to add the value to the box.');
    }
  }
}
