import 'package:flutter/material.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class ShowSongLyricsScreen extends StatelessWidget {
  const ShowSongLyricsScreen({
    super.key,
    required this.song,
    required this.lyrics
  });

  final RandomSongViewModel song;
  final String lyrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(song.songTitle),
      ),
      body: Center(
        child: Text(lyrics),
      )
    );
  }
}
