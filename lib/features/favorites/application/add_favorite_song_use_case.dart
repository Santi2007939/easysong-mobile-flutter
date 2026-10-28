import 'package:easy_song/features/favorites/domain/favorite_song.dart';
import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';

class AddFavoriteSongUseCase {
  final FavoriteSongRepository repository;

  const AddFavoriteSongUseCase({required this.repository});

  Future<void> execute(int songId) async {
    return await repository.add(FavoriteSong(songId: songId));
  }
}
