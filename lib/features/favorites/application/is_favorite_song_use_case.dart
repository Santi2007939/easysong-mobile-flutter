import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';

class IsFavoriteSongUseCase {
  final FavoriteSongRepository repository;

  const IsFavoriteSongUseCase({required this.repository});

  Future<bool> execute(int songId) async {
    return await repository.isFavorite(songId);
  }
}
