import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

sealed class ShowSongLyricsState {}

class LoadingState extends ShowSongLyricsState {}

class LoadedState extends ShowSongLyricsState {
  final RandomSongViewModel song;
  final String? lyrics;

  LoadedState({
    required this.song,
    required this.lyrics
  });
}

class ErrorState extends ShowSongLyricsState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
