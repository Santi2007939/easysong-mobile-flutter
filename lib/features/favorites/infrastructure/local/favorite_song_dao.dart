import 'package:drift/drift.dart';
import 'package:easy_song/core/database/app_database.dart';
import 'package:easy_song/features/favorites/infrastructure/local/favorite_songs_table.dart';

part 'favorite_song_dao.g.dart';

@DriftAccessor(tables: [FavoriteSongs])
class FavoriteSongDao extends DatabaseAccessor<AppDatabase>
    with _$FavoriteSongDaoMixin {
  FavoriteSongDao(super.attachedDatabase);

  Future<void> insert(FavoriteSongEntity entity) async {
    await into(favoriteSongs).insertOnConflictUpdate(entity);
  }

  Future<void> deleteBySongId(int songId) async {
    await (delete(favoriteSongs)..where((t) => t.songId.equals(songId))).go();
  }

  Future<FavoriteSongEntity?> findBySongId(int songId) {
    return (select(favoriteSongs)..where((t) => t.songId.equals(songId)))
        .getSingleOrNull();
  }

  Future<List<FavoriteSongEntity>> findAll() {
    return select(favoriteSongs).get();
  }

  // Emits again every time the table changes
  Stream<List<FavoriteSongEntity>> watchAll() {
    return select(favoriteSongs).watch();
  }
}
