import 'package:easy_song/features/home/domain/song.dart';
import 'package:flutter/material.dart';

class SongDetailPage extends StatelessWidget {
  const new({super.key, required this.song});
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: song.id,
                  child: Image.network(
                    song.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Text('body'),
      ),
    );
  }
}
