import 'package:flutter/material.dart';

class InfoOnboardingPage extends StatelessWidget {
  const InfoOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              _Constants.greetingsLabelText,
              style: TextStyle(fontSize: _Constants.defaultFontSize),
            ),
            Text(
              _Constants.randomGeniusSongText,
              style: TextStyle(fontSize: _Constants.defaultFontSize),
            ),
            Text(
              _Constants.listenSongText,
              style: TextStyle(fontSize: _Constants.defaultFontSize),
            ),
            Text(
              _Constants.lyricsSongText,
              style: TextStyle(fontSize: _Constants.defaultFontSize),
            ),
          ]
        ),
      )
    );
  }
}

class _Constants {
  static const greetingsLabelText = "Спасибо, что скачали наше приложение ❤️";
  static const randomGeniusSongText = "Приложение выдаст вам случайную песню из библиотеки Genius.";
  static const listenSongText = "Вы можете прослушать её в Soundcloud, Spotify и на YouTube.";
  static const lyricsSongText = "А также просмотреть текст этой песни.";

  static const double defaultFontSize = 25;
}
