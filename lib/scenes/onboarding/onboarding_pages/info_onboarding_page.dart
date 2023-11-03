import 'package:flutter/material.dart';

class InfoOnboardingPage extends StatelessWidget {
  const InfoOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_Constants.randomGeniusSongText),
        Text(_Constants.listenSongText),
        Text(_Constants.lyricsSongText),
      ],
    );
  }
}

class _Constants {
  static const randomGeniusSongText = "Приложение выдаст вам случайную песню из Genius.";
  static const listenSongText = "Вы можете прослушать её в Apple Music, Spotify и на YouTube.";
  static const lyricsSongText = "А также просмотреть текст этой песни.";
}
