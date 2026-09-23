import 'package:randomized_restaurant/data/db/app_database.dart';
import 'package:randomized_restaurant/data/services/api/api_client.dart';
import 'package:randomized_restaurant/models/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

class FavoritesRepository {
  FavoritesRepository(this._db);
  final AppDatabase _db;

  Stream<Set<String>> watchIds() {
    return _db.select(_db.favorites).watch().map((rows) {
      final ids = <String>{};
      for (final row in rows) {
        ids.add(row.placeId);
      }
      return ids;
    });
  }

  Future<void> add(String placeId) {
    return _db
        .into(_db.favorites)
        .insertOnConflictUpdate(FavoritesCompanion.insert(placeId: placeId));
  }

  Future<void> remove(String placeId) {
    return (_db.delete(
      _db.favorites,
    )..where((fav) => fav.placeId.equals(placeId))).go();
  }
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(keepAlive: true)
FavoritesRepository favoritesRepository(Ref ref) =>
    FavoritesRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
Stream<Set<String>> favoriteIds(Ref ref) =>
    ref.watch(favoritesRepositoryProvider).watchIds();

@Riverpod(keepAlive: true)
class FavoriteRestaurants extends _$FavoriteRestaurants {
  final ApiClient _client = ApiClient();

  @override
  Future<List<Restaurant>> build() async {
    ref.listen(favoriteIdsProvider, (previous, next) {
      next.whenData(_syncIds);
    });

    final ids = await ref.read(favoriteIdsProvider.future);
    final restaurants = await Future.wait(ids.map(_client.restaurantById));
    return restaurants.whereType<Restaurant>().toList();
  }

  /// Synchronize repository state with provided restaurant IDs
  Future<void> _syncIds(Set<String> ids) async {
    final current = state.value ?? [];
    final remaining = current.where((r) => ids.contains(r.id)).toList();

    final newIds = ids.difference(remaining.map((r) => r.id).toSet());
    if (newIds.isEmpty) {
      state = AsyncData(remaining);
      return;
    }

    state = AsyncData(remaining);
    final fetched = await Future.wait(newIds.map(_client.restaurantById));
    state = AsyncData([...remaining, ...fetched.whereType<Restaurant>()]);
  }
}
