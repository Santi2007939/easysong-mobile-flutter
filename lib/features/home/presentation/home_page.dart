import 'package:easy_song/features/home/domain/song.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Song> songs = [
    Song(
      id: 1,
      title: "Bohemian Rhapsody",
      artist: "Queen",
      image: "https://i1.sndcdn.com/artworks-000116795481-6fmihq-t500x500.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.network(songs[index].image),
        title: Text(songs[index].title),
      ),
    );
  }
}
