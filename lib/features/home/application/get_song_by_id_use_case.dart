import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';

class GetSongByIdUseCase {
  final SongRepository repository;

  const GetSongByIdUseCase({required this.repository});

  Future<Song> execute(int id) async {
    return await repository.getSongById(id);
  }
}