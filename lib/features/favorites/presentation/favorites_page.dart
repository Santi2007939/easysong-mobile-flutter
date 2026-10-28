import 'package:easy_song/features/favorites/presentation/favorites_view_model.dart';
import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/song_card.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key, required this.viewModel});
  final FavoritesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (viewModel.state.errorMessage != null) {
          return _Message(
            icon: Icons.wifi_off,
            title: "Couldn't load your favorites",
            action: TextButton(
              onPressed: viewModel.watchFavorites,
              child: const Text('Retry'),
            ),
          );
        }

        if (viewModel.state.songs.isEmpty) {
          return const _Message(
            icon: Icons.favorite_border,
            title: 'No favorites yet',
            subtitle: 'Tap the heart on a song to save it here.',
          );
        }

        return ListView.builder(
          itemCount: viewModel.state.songs.length,
          itemBuilder: (context, index) {
            final Song song = viewModel.state.songs[index];
            return SongCard(song: song);
          },
        );
      },
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
  });
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: scheme.tertiary),
            const SizedBox(height: 16),
            Text(title, style: text.titleMedium, textAlign: TextAlign.center),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: text.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ],
            if (action != null) ...[const SizedBox(height: 12), action!],
          ],
        ),
      ),
    );
  }
}
