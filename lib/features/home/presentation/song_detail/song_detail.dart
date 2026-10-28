import 'package:easy_song/features/home/domain/song.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_format.dart';
import 'package:flutter/material.dart';

/// Editorial layout: collapsing cover header, tonal info rows and rating bar.
class SongDetail extends StatelessWidget {
  const SongDetail({
    super.key,
    required this.song,
    required this.isFavorite,
    required this.onToggleFavorite,
  });
  final Song song;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: scheme.surface,
            foregroundColor: scheme.onSurface,
            // Tonal button keeps the back arrow readable over any cover
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton.filledTonal(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton.filledTonal(
                  tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
                  onPressed: onToggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: scheme.tertiary,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: song.id,
                child: Image.network(song.image, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${song.genre} · ${song.year}'.toUpperCase(),
                    style: text.labelMedium?.copyWith(
                      color: scheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    song.title,
                    style: text.headlineMedium?.copyWith(
                      color: scheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: scheme.primaryContainer,
                        foregroundColor: scheme.onPrimaryContainer,
                        child: Text(song.artist.isNotEmpty ? song.artist[0] : '?'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          song.artist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: text.titleMedium?.copyWith(color: scheme.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Divider(color: scheme.outlineVariant),
                  _DetailRow(icon: Icons.album, label: 'Album', value: song.album),
                  _DetailRow(icon: Icons.schedule, label: 'Duration', value: song.formattedDuration),
                  _DetailRow(icon: Icons.music_note, label: 'Genre', value: song.genre),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rating', style: text.labelLarge?.copyWith(color: scheme.onSurfaceVariant)),
                      Text(
                        song.rating.toStringAsFixed(1),
                        style: text.labelLarge?.copyWith(color: scheme.tertiary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: song.ratingProgress,
                      minHeight: 8,
                      color: scheme.tertiary,
                      backgroundColor: scheme.surfaceContainerHighest,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: scheme.onSecondaryContainer, size: 20),
      ),
      title: Text(label, style: TextStyle(color: scheme.onSurfaceVariant)),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 180),
        child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
          style: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
