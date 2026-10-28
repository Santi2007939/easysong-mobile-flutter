import 'package:easy_song/features/favorites/application/add_favorite_song_use_case.dart';
import 'package:easy_song/features/favorites/application/is_favorite_song_use_case.dart';
import 'package:easy_song/features/favorites/application/remove_favorite_song_use_case.dart';
import 'package:easy_song/features/home/application/get_song_by_id_use_case.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_detail_ui_state.dart';
import 'package:flutter/material.dart';

class SongDetailViewModel extends ChangeNotifier {
  final GetSongByIdUseCase getSongByIdUseCase;
  final IsFavoriteSongUseCase isFavoriteSongUseCase;
  final AddFavoriteSongUseCase addFavoriteSongUseCase;
  final RemoveFavoriteSongUseCase removeFavoriteSongUseCase;

  SongDetailViewModel({
    required this.getSongByIdUseCase,
    required this.isFavoriteSongUseCase,
    required this.addFavoriteSongUseCase,
    required this.removeFavoriteSongUseCase,
  });

  SongDetailUiState _state = const SongDetailUiState();
  SongDetailUiState get state => _state;

  Future loadSong(int id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final song = await getSongByIdUseCase.execute(id);
      final isFavorite = await isFavoriteSongUseCase.execute(id);
      _state = _state.copyWith(song: song, isFavorite: isFavorite, isLoading: false, errorMessage: null);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(int songId) async {
    final bool wasFavorite = _state.isFavorite;

    // Update the button right away, revert if saving fails
    _state = _state.copyWith(isFavorite: !wasFavorite);
    notifyListeners();

    try {
      if (wasFavorite) {
        await removeFavoriteSongUseCase.execute(songId);
      } else {
        await addFavoriteSongUseCase.execute(songId);
      }
    } catch (e) {
      _state = _state.copyWith(isFavorite: wasFavorite);
      notifyListeners();
    }
  }
}
