import 'package:easy_song/features/home/domain/song.dart';
import 'package:flutter/material.dart';
  
class SongDetail extends StatelessWidget {
  const new({super.key, required this.song});
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320.0,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                song.title,
                style: Theme.of(context).textTheme.bodyLarge
                ),
              background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: song.id,
                  child: Image.network(
                    song.image,
                    fit: BoxFit.cover
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white]
                    ),
                  ),
              ),
              ]
            ),
            ),
    ),
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: Theme.of(context).textTheme.titleLarge
            ),
            Text(
              song.artist,
              style: Theme.of(context).textTheme.bodyMedium
            ),
            const SizedBox(height: 24),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow(Icons.album, 'Album', song.album),
                  const Divider(height: 24),
                  _buildDetailRow(Icons.calendar_today, 'Year', song.year.toString()),
                  const Divider(height: 24),
                  _buildDetailRow(Icons.access_time, 'Duration', '${song.duration ~/ 60}:${(song.duration % 60).toString().padLeft(2, '0')}'),
                  const Divider(height: 24),
                  _buildDetailRow(Icons.music_note, 'Genre', song.genre),
                  const Divider(height: 24),
                  _buildDetailRow(Icons.star, 'Rating', song.rating.toString()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 22),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}