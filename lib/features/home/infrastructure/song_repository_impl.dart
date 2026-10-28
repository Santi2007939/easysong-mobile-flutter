import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:easy_song/features/home/infrastructure/remote/song_api.dart';
import 'package:easy_song/features/home/infrastructure/remote/song_dto.dart';

class SongRepositoryImpl implements SongRepository {
  final SongApi api;

  const new({required this.api});

  @override
  Future<List<Song>> getSongs() async {
    final List<SongDto> dtos = await api.getSongs();
    return dtos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<Song> getSongById(int id) async {
    final SongDto dto = await api.getSongById(id);
    return dto.toDomain();
  }
}
