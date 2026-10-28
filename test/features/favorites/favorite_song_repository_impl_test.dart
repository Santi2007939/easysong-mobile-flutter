import 'package:drift/native.dart';
import 'package:easy_song/core/database/app_database.dart';
import 'package:easy_song/features/favorites/domain/favorite_song.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_song_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late FavoriteSongRepositoryImpl repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = FavoriteSongRepositoryImpl(dao: database.favoriteSongDao);
  });

  tearDown(() => database.close());

  test('a song is not favorite by default', () async {
    expect(await repository.isFavorite(1), isFalse);
  });

  test('add marks the song as favorite', () async {
    await repository.add(const FavoriteSong(songId: 1));

    expect(await repository.isFavorite(1), isTrue);
    expect(await repository.isFavorite(2), isFalse);
  });

  test('adding the same song twice keeps a single row', () async {
    await repository.add(const FavoriteSong(songId: 1));
    await repository.add(const FavoriteSong(songId: 1));

    final favorites = await repository.getAll();
    expect(favorites.map((e) => e.songId), [1]);
  });

  test('remove unmarks the song', () async {
    await repository.add(const FavoriteSong(songId: 1));
    await repository.remove(1);

    expect(await repository.isFavorite(1), isFalse);
  });
}
