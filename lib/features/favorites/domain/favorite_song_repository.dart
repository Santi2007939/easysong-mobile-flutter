import 'package:easy_song/features/favorites/domain/favorite_song.dart';

abstract class FavoriteSongRepository {
  Future<void> add(FavoriteSong favoriteSong);

  Future<void> remove(int songId);

  Future<bool> isFavorite(int songId);

  Future<List<FavoriteSong>> getAll();

  Stream<List<FavoriteSong>> watchAll();
}
