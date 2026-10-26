class SongDto {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String image;

  const new({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.image,
  });

  factory SongDto.fromJson(Map<String, dynamic> json) {
    return SongDto(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      image: json['image'],
    );
  }
}
