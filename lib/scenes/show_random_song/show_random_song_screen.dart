import 'package:flutter/material.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class ShowRandomSongScreen extends StatelessWidget {
  const ShowRandomSongScreen({super.key, required this.song});

  final RandomSongViewModel song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(song.songTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage(song.songArtImageUrl)),
          Text("Название песни: ${song.songTitle}"),
          Text("Исполнитель: ${song.artists}"),
          Text("Дата выхода: ${song.releaseDate}"),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Текст песни")
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("YouTube"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Apple Music"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Spotify"),
          )
        ],
      )
    );
  }
}
