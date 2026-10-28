import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_detail.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_detail_view_model.dart';
import 'package:flutter/material.dart';

class SongDetailPage extends StatelessWidget {
  const SongDetailPage({super.key, required this.song, required this.viewModel});

  // Song from the list, shown right away so the Hero animation has an image
  final Song song;
  final SongDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.state.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(title: Text(song.title)),
            body: Center(child: Text(viewModel.state.errorMessage!)),
          );
        }

        return SongDetail(
          song: viewModel.state.isLoading ? song : viewModel.state.song,
          isFavorite: viewModel.state.isFavorite,
          onToggleFavorite: () => viewModel.toggleFavorite(song.id),
        );
      },
    );
  }
}
