import 'dart:async';

import 'package:easy_song/features/favorites/application/watch_favorite_songs_use_case.dart';
import 'package:easy_song/features/favorites/presentation/favorites_ui_state.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:flutter/material.dart';

class FavoritesViewModel extends ChangeNotifier {
  final WatchFavoriteSongsUseCase useCase;

  FavoritesViewModel({required this.useCase}) {
    watchFavorites();
  }

  FavoritesUiState _state = const FavoritesUiState();
  FavoritesUiState get state => _state;

  StreamSubscription<List<Song>>? _subscription;

  void watchFavorites() {
    _subscription?.cancel();
    _state = const FavoritesUiState(isLoading: true);
    notifyListeners();

    // Every add or remove in the detail screen emits a new list here
    _subscription = useCase.execute().listen(
      (songs) {
        _state = FavoritesUiState(songs: songs);
        notifyListeners();
      },
      onError: (e) {
        _state = FavoritesUiState(errorMessage: e.toString());
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
