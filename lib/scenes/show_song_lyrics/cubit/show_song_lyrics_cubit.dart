import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_song/domain/services/song_lyrics_service.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

import 'package:random_song/scenes/show_song_lyrics/cubit/show_song_lyrics_state.dart';

class ShowSongLyricsCubit extends Cubit<ShowSongLyricsState> {
  ShowSongLyricsCubit({
    required this.songLyricsService,
  })
    : super(LoadingState());

  final SongLyricsService songLyricsService;

  void loadLyrics(RandomSongViewModel song) async {
    final lyrics = await songLyricsService.loadSongLyrics(song.url);
    emit(LoadedState(song: song, lyrics: lyrics));
  }
}