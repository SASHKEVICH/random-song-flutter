import 'package:flutter/material.dart';
import 'package:random_song/main.dart';

class FinalOnboardingPage extends StatelessWidget {
  const FinalOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          _Constants.readyToHearASongText,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 15,),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.requestRandomSongRoute);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text(_Constants.buttonTitle)
        )
      ],
    );
  }
}

class _Constants {
  static const readyToHearASongText = "Готовы найти новую песню?";
  static const buttonTitle = "Давайте уже!";
}
