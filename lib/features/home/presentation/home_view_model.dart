import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/home_ui_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetSongsUseCase useCase;

  HomeViewModel({required this.useCase}) {
    loadSongs();
  }

  HomeUiState _state = HomeUiState();
  HomeUiState get state => _state;

  Future<void> loadSongs() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final List<Song> songs = await useCase.execute();
      _state = _state.copyWith(songs: songs, errorMessage: null, isLoading: false);
    } catch (e) {
      _state = _state.copyWith( errorMessage: e.toString(), isLoading: false);

    }
    notifyListeners();
  }
}
