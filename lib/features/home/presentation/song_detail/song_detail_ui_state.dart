import 'package:easy_song/features/home/domain/song.dart';

class SongDetailUiState {
  final Song song;
  final bool isLoading;
  final bool isFavorite;
  final String? errorMessage;

  const SongDetailUiState({
    this.song = const Song(
      id: 0,
      title: '',
      artist: '',
      album: '',
      year: 0,
      duration: 0,
      genre: '',
      rating: 0.0,
      image: ''
    ),
    this.isLoading = false,
    this.isFavorite = false,
    this.errorMessage
  });

  SongDetailUiState copyWith({
    Song? song,
    bool? isLoading,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return SongDetailUiState(
      song: song ?? this.song,
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}