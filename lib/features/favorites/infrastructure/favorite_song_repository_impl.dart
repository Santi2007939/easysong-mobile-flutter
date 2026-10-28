import 'package:easy_song/core/database/app_database.dart';
import 'package:easy_song/features/favorites/domain/favorite_song.dart';
import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';
import 'package:easy_song/features/favorites/infrastructure/local/favorite_song_dao.dart';

class FavoriteSongRepositoryImpl implements FavoriteSongRepository {
  final FavoriteSongDao dao;

  const FavoriteSongRepositoryImpl({required this.dao});

  @override
  Future<void> add(FavoriteSong favoriteSong) async {
    await dao.insert(FavoriteSongEntity(songId: favoriteSong.songId));
  }

  @override
  Future<void> remove(int songId) async {
    await dao.deleteBySongId(songId);
  }

  @override
  Future<bool> isFavorite(int songId) async {
    return await dao.findBySongId(songId) != null;
  }

  @override
  Future<List<FavoriteSong>> getAll() async {
    final List<FavoriteSongEntity> entities = await dao.findAll();
    return entities.map((e) => e.toDomain()).toList();
  }

  @override
  Stream<List<FavoriteSong>> watchAll() {
    return dao.watchAll().map(
      (entities) => entities.map((e) => e.toDomain()).toList(),
    );
  }
}

extension on FavoriteSongEntity {
  FavoriteSong toDomain() => FavoriteSong(songId: songId);
}
