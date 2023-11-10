import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';
import 'package:random_song/scenes/show_song_lyrics/cubit/show_song_lyrics_cubit.dart';
import 'package:random_song/scenes/show_song_lyrics/cubit/show_song_lyrics_state.dart';
import 'package:random_song/scenes/show_song_lyrics/show_song_lyrics_screen.dart';

class ShowSongLyricsPage extends StatelessWidget {
  const ShowSongLyricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context)?.settings.arguments as RandomSongViewModel;
    return BlocBuilder<ShowSongLyricsCubit, ShowSongLyricsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          BlocProvider.of<ShowSongLyricsCubit>(context).loadLyrics(song);
          return Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoadedState) {
          return ShowSongLyricsScreen(song: state.song, lyrics: state.lyrics ?? "Ничего не найдено");
        } else if (state is ErrorState) {
          print(state.errorMessage);
          return Container();
        }

        return Container();
      }
    );
  }
}