import 'package:drift/drift.dart';

// Row class is FavoriteSongEntity so it doesn't clash with the domain FavoriteSong
@DataClassName('FavoriteSongEntity')
class FavoriteSongs extends Table {
  IntColumn get songId => integer()();

  @override
  Set<Column> get primaryKey => {songId};
}
