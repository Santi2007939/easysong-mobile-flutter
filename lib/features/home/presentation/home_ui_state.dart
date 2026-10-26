import 'package:easy_song/features/home/domain/song.dart';

class HomeUiState {
  final List<Song> songs;
  final bool isLoading;
  final String? errorMessage;

  const HomeUiState({
    this.songs = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HomeUiState copyWith({
    List<Song>? songs,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeUiState(
      songs: songs ?? this.songs,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
