import 'package:easy_song/features/home/domain/song.dart';

class SongDetailUiState {
  final Song song;
  final bool isLoading;
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
    this.errorMessage
  });

  SongDetailUiState copyWith({
    Song? song,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SongDetailUiState(
      song: song ?? this.song,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}