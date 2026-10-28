import 'package:easy_song/features/home/application/get_song_by_id_use_case.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_detail_ui_state.dart';
import 'package:flutter/material.dart';

class SongDetailViewModel extends ChangeNotifier {
  final GetSongByIdUseCase useCase;

  SongDetailViewModel({required this.useCase});

  SongDetailUiState _state = const SongDetailUiState();
  SongDetailUiState get state => _state;

  Future loadSong(int id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final song = await useCase.execute(id);
      _state = _state.copyWith(song: song, isLoading: false, errorMessage: null);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }
}