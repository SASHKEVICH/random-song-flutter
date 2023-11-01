import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:random_song/domain/di.dart';
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
        Routes.initialRoute: (context) => _getRequestRandomSongPage(),
      },
      initialRoute: Routes.initialRoute,
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
}

class Routes {
  static const initialRoute = '/';
}
