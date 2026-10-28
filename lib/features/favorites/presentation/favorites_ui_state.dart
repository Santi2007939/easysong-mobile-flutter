import 'package:easy_song/features/home/domain/song.dart';

class FavoritesUiState {
  final List<Song> songs;
  final bool isLoading;
  final String? errorMessage;

  const FavoritesUiState({
    this.songs = const [],
    this.isLoading = false,
    this.errorMessage,
  });
}
