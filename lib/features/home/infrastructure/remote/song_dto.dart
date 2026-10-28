import 'package:easy_song/features/home/domain/song.dart';

class SongDto {
  final int id;
  final String title;
  final String artist;
  final String album;
  final int year;
  final int duration;
  final String genre;
  final double rating;
  final String image;

  const new({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.duration,
    required this.genre,
    required this.rating,
    required this.image,
  });

  factory SongDto.fromJson(Map<String, dynamic> json) {
    return SongDto(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      year: json['year'],
      duration: json['duration'],
      genre: json['genre'],
      // JSON numbers like 4 arrive as int, not double
      rating: (json['rating'] as num).toDouble(),
      image: json['image'],
    );
  }

  Song toDomain() {
    return Song(
      id: id,
      title: title,
      artist: artist,
      album: album,
      year: year,
      duration: duration,
      genre: genre,
      rating: rating,
      image: image,
    );
  }
}
