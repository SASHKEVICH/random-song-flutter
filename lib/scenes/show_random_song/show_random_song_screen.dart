import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:random_song/main.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class ShowRandomSongScreen extends StatefulWidget {
  const ShowRandomSongScreen({super.key});

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
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.showSongLyricsRoute,
                arguments: song
              );
            },
            child: const Text("Текст песни")
          ),
          ElevatedButton(
            onPressed: () => _launchUrl(song.youtubeUrl),
            child: const Text("YouTube"),
          ),
          ElevatedButton(
            onPressed: () => _launchUrl(song.soundcloudUrl),
            child: const Text("Soundcloud"),
          ),
          ElevatedButton(
            onPressed: () => _launchUrl(song.spotifyUrl),
            child: const Text("Spotify"),
          )
        ],
      )
    );
  }

  Future<void> _launchUrl(String? urlString) async {
    if (urlString == null) {
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () => Navigator.pop(context),
      );

      AlertDialog alert = AlertDialog(
        title: const Text("Нет ссылки на ресурс"),
        content: const Text("К сожалению, открыть песню по этой ссылке не получится :("),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      return; 
    }

    final url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
