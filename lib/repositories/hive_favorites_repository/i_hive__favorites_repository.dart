abstract class IHiveFavoritesRepository {
  Future<dynamic> get(dynamic id);

  Future<dynamic> getFirst();

  Future<dynamic> getAll();

  Future<void> add(dynamic object);

  Future<void> remove(dynamic object);

  Future<void> update(dynamic object);
}
