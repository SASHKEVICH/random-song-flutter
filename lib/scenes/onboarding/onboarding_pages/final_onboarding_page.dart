import 'package:flutter/material.dart';
import 'package:random_song/main.dart';

class FinalOnboardingPage extends StatelessWidget {
  const FinalOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(_Constants.readyToHearASongText),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.randomSongRoute);
          },
          child: const Text(_Constants.buttonText)
        )
      ],
    );
  }
}

class _Constants {
  static const readyToHearASongText = "Готовы послушать новую песню?";
  static const buttonText = "Да!";
}