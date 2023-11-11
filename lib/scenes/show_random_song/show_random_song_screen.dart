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
    final screenWidth = MediaQuery.of(context).size.width - 2 * _Constants.defaultPadding;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(song.songTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(_Constants.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenWidth,
                  width: screenWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(song.songArtImageUrl,)
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: screenWidth,
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 15,
                    alignment: WrapAlignment.start,
                    children: [
                      Text("Название песни: ${song.songTitle}"),
                      Text("Исполнитель: ${song.artists}"),
                      Text("Дата выхода: ${song.releaseDate ?? "нет информации"}"),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Routes.showSongLyricsRoute,
                      arguments: song
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(_Constants.defaultButtonWidth, _Constants.defaultButtonHeight)
                  ),
                  child: const Text(_Constants.lyricsButtonTitle)
                ),
                ElevatedButton(
                  onPressed: () => _launchUrl(song.youtubeUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(_Constants.defaultButtonWidth, _Constants.defaultButtonHeight)
                  ),
                  child: const Text(_Constants.youtubeButtonTitle),
                ),
                ElevatedButton(
                  onPressed: () => _launchUrl(song.soundcloudUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(_Constants.defaultButtonWidth, _Constants.defaultButtonHeight)
                  ),
                  child: const Text(_Constants.soundcloudButtonTitle),
                ),
                ElevatedButton(
                  onPressed: () => _launchUrl(song.spotifyUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(_Constants.defaultButtonWidth, _Constants.defaultButtonHeight)
                  ),
                  child: const Text(_Constants.spotifyButtonTitle),
                )
              ],
            ),
          ),
        )
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
        title: const Text(_Constants.cannotOpenSongAlertTitle),
        content: const Text(_Constants.cannotOpenSongAlertMessage),
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

class _Constants {
  static const String youtubeButtonTitle = "Открыть на YouTube";
  static const String soundcloudButtonTitle = "Прослушать на Soundcloud";
  static const String spotifyButtonTitle = "Открыть в Spotify";
  static const String lyricsButtonTitle = "Текст песни";

  static const String cannotOpenSongAlertTitle = "Нет ссылки на ресурс";
  static const String cannotOpenSongAlertMessage = "К сожалению, открыть песню по этой ссылке не получится :(";

  static const double defaultPadding = 10;

  static const double defaultButtonWidth = 250;
  static const double defaultButtonHeight = 40;
}
