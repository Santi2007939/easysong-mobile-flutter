import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<List<Song>> getSongs() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Song(
        id: 1,
        title: "Bohemian Rhapsody",
        artist: "Queen",
        image:
            "https://i1.sndcdn.com/artworks-000116795481-6fmihq-t500x500.jpg",
      ),
    ];
  }
}
