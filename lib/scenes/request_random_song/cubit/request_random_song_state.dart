import 'package:random_song/domain/models/song.dart';

abstract class RequestRandomSongState {}

class InitState extends RequestRandomSongState {}

class LoadingState extends RequestRandomSongState {}

class LoadedState extends RequestRandomSongState {
  final Song? song;

  LoadedState({required this.song});
}

class ErrorState extends RequestRandomSongState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
