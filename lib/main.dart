import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:random_song/domain/di.dart';
import 'package:random_song/scenes/onboarding/onboarding_screen.dart';
import 'package:random_song/scenes/request_random_song/cubit/request_random_song_cubit.dart';
import 'package:random_song/scenes/request_random_song/request_random_song_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Di _di = Di();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.onboardingRoute: (context) => const OnboardingScreen(),
        Routes.randomSongRoute: (context) => _getRequestRandomSongPage(),
      },
      home: FutureBuilder (
        future: getInitialRoute(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Future.microtask(() => Navigator.of(context).pushReplacementNamed(snapshot.data!));
            return Container();
          } else {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }

  Widget _getRequestRandomSongPage() {
    return BlocProvider<RequestRandomSongScreenCubit>(
      create: (context) => RequestRandomSongScreenCubit(
        randomSongService: _di.randomSongService
      ),
      child: const RequestRandomSongPage(),
    );
  }

  Future<String> getInitialRoute() async {
    return await _di.firstLaunchService.isFirstLaunch ? Routes.onboardingRoute : Routes.randomSongRoute;
  }
}

class Routes {
  static const onboardingRoute = '/onboarding';
  static const randomSongRoute = '/random-song';
}
