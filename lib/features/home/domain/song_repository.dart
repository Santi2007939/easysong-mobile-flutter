import 'package:easy_song/features/home/domain/song.dart';

abstract class SongRepository {
  Future<List<Song>> getSongs();
}