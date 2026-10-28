import 'package:drift/native.dart';
import 'package:easy_song/core/database/app_database.dart';
import 'package:easy_song/features/favorites/application/watch_favorite_songs_use_case.dart';
import 'package:easy_song/features/favorites/domain/favorite_song.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_song_repository_impl.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:flutter_test/flutter_test.dart';

Song _song(int id) => Song(
      id: id,
      title: 'Song $id',
      artist: 'Artist',
      album: 'Album',
      year: 2000,
      duration: 180,
      genre: 'Rock',
      rating: 4.5,
      image: '',
    );

class _FakeSongRepository implements SongRepository {
  int getSongsCalls = 0;

  @override
  Future<List<Song>> getSongs() async {
    getSongsCalls++;
    return [_song(1), _song(2), _song(3)];
  }

  @override
  Future<Song> getSongById(int id) async => _song(id);
}

void main() {
  late AppDatabase database;
  late FavoriteSongRepositoryImpl favoriteSongRepository;
  late _FakeSongRepository songRepository;
  late WatchFavoriteSongsUseCase useCase;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    favoriteSongRepository = FavoriteSongRepositoryImpl(dao: database.favoriteSongDao);
    songRepository = _FakeSongRepository();
    useCase = WatchFavoriteSongsUseCase(
      favoriteSongRepository: favoriteSongRepository,
      songRepository: songRepository,
    );
  });

  tearDown(() => database.close());

  List<int> ids(List<Song> songs) => songs.map((e) => e.id).toList();

  test('emits only the songs marked as favorite', () async {
    await favoriteSongRepository.add(const FavoriteSong(songId: 1));
    await favoriteSongRepository.add(const FavoriteSong(songId: 3));

    expect(ids(await useCase.execute().first), [1, 3]);
  });

  test('emits again when a favorite is added or removed', () async {
    final emissions = useCase.execute().map(ids);

    expectLater(
      emissions,
      emitsInOrder([
        <int>[],
        [2],
        <int>[],
      ]),
    );

    await pumpEventQueue();
    await favoriteSongRepository.add(const FavoriteSong(songId: 2));
    await pumpEventQueue();
    await favoriteSongRepository.remove(2);
  });

  test('loads songs from the API only once per subscription', () async {
    final subscription = useCase.execute().listen((_) {});

    await pumpEventQueue();
    await favoriteSongRepository.add(const FavoriteSong(songId: 1));
    await pumpEventQueue();
    await favoriteSongRepository.add(const FavoriteSong(songId: 2));
    await pumpEventQueue();

    expect(songRepository.getSongsCalls, 1);
    await subscription.cancel();
  });
}
