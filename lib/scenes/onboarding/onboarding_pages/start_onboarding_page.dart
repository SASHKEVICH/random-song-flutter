import 'package:flutter/material.dart';

class StartOnboardingPage extends StatelessWidget {
  const StartOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_Constants.greetText),
      ],
    );
  }
}

class _Constants {
  static const greetText = "Добро пожаловать!";
}
