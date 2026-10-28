import 'package:easy_song/features/favorites/domain/favorite_song.dart';
import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';

class WatchFavoriteSongsUseCase {
  final FavoriteSongRepository favoriteSongRepository;
  final SongRepository songRepository;

  const WatchFavoriteSongsUseCase({
    required this.favoriteSongRepository,
    required this.songRepository,
  });

  Stream<List<Song>> execute() {
    // Songs come from the API once; favorites are re-read on every change
    List<Song>? songs;

    return favoriteSongRepository.watchAll().asyncMap((
      List<FavoriteSong> favorites,
    ) async {
      songs ??= await songRepository.getSongs();
      final Set<int> favoriteIds = favorites.map((e) => e.songId).toSet();
      return songs!.where((song) => favoriteIds.contains(song.id)).toList();
    });
  }
}
