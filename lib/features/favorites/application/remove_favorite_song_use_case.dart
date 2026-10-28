import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';

class RemoveFavoriteSongUseCase {
  final FavoriteSongRepository repository;

  const RemoveFavoriteSongUseCase({required this.repository});

  Future<void> execute(int songId) async {
    return await repository.remove(songId);
  }
}
