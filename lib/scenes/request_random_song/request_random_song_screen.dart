import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_song/scenes/request_random_song/cubit/request_random_song_cubit.dart';

class RequestRandomSongScreen extends StatefulWidget {
  const RequestRandomSongScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RequestRandomSongScreenState();
}

class _RequestRandomSongScreenState extends State<RequestRandomSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<RequestRandomSongScreenCubit>(context).loadRandomSong();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            fixedSize: const Size(150, 150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(75),
            ),
          ),
          child: const Text(
            _Constants.randomSongButtonTitle,
            textAlign: TextAlign.center,
          )
        ),
      ),
    );
  }
}

class _Constants {
  static const String randomSongButtonTitle = "ууууу, СЛУЧАЙНАЯ ПЕСНЯ";
}
