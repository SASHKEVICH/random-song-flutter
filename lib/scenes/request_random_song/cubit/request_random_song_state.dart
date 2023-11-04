import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

abstract class RequestRandomSongState {}

class InitState extends RequestRandomSongState {}

class LoadingState extends RequestRandomSongState {}

class ErrorState extends RequestRandomSongState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class ShowRandomSongScreenState extends RequestRandomSongState {
  final RandomSongViewModel song;

  ShowRandomSongScreenState({required this.song});
}
