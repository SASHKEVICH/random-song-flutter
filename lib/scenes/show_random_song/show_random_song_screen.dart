import 'package:flutter/material.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class ShowRandomSongScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowRandomSongScreenState();
}

class _ShowRandomSongScreenState extends State<ShowRandomSongScreen> {

  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context)?.settings.arguments as RandomSongViewModel;

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
