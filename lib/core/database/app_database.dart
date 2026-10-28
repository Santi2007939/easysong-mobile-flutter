import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:easy_song/features/favorites/infrastructure/local/favorite_song_dao.dart';
import 'package:easy_song/features/favorites/infrastructure/local/favorite_songs_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [FavoriteSongs], daos: [FavoriteSongDao])
class AppDatabase extends _$AppDatabase {
  // The connection opens lazily on the first query, so no await is needed here
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'easysong'));

  @override
  int get schemaVersion => 1;
}
