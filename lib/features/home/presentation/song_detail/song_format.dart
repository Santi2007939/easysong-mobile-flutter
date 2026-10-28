import 'package:easy_song/features/home/domain/song.dart';

extension SongFormat on Song {
  String get formattedDuration =>
      '${duration ~/ 60}:${(duration % 60).toString().padLeft(2, '0')}';

  // Rating comes on a 0–5 scale
  double get ratingProgress => (rating / 5).clamp(0.0, 1.0);
}
