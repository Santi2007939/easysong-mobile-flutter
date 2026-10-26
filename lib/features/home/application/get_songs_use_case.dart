import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';

class GetSongsUseCase {
  final SongRepository repository;

  const GetSongsUseCase({required this.repository});

  Future<List<Song>> execute() async {
    return await repository.getSongs();
  }
}
