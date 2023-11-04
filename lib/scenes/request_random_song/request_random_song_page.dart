import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_song/scenes/request_random_song/cubit/request_random_song_cubit.dart';
import 'package:random_song/scenes/request_random_song/cubit/request_random_song_state.dart';
import 'package:random_song/scenes/request_random_song/request_random_song_screen.dart';
import 'package:random_song/scenes/show_random_song/show_random_song_screen.dart';

class RequestRandomSongPage extends StatefulWidget {
  const RequestRandomSongPage({super.key});

  @override
  State<StatefulWidget> createState() => _RequestRandomSongPageState();
}

class _RequestRandomSongPageState extends State<RequestRandomSongPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestRandomSongScreenCubit, RequestRandomSongState>(
      listener: (context, state) {
        if (state is ShowRandomSongScreenState) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ShowRandomSongScreen(song: state.song))
          );
          BlocProvider.of<RequestRandomSongScreenCubit>(context).setInitState();
        }
      },
      child: Scaffold(
        body: BlocBuilder<RequestRandomSongScreenCubit, RequestRandomSongState>(
          builder: (context, state) {
            if (state is InitState) {
              return const RequestRandomSongScreen();
            } else if (state is LoadingState) {
              return const Stack(
                alignment: Alignment.center,
                children: [
                  RequestRandomSongScreen(),
                  CircularProgressIndicator()
                ],
              );
            } else if (state is ErrorState) {
              print(state.errorMessage);
              return const RequestRandomSongScreen();
            }

            return Container();
          }
        )
      ),
    );
  }
}
