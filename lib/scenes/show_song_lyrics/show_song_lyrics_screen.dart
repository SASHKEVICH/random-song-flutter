import 'package:flutter/material.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class ShowSongLyricsScreen extends StatelessWidget {
  const ShowSongLyricsScreen({
    super.key,
    required this.songTitle,
    required this.lyrics
  });

  final String songTitle;
  final String lyrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(songTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            child: Text(lyrics),
          )
        )
      )
    );
  }
}
