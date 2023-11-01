import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_song/domain/requests/random_song_request.dart';
import 'package:random_song/domain/services/random_song_service.dart';
import 'package:random_song/scenes/request_random_song/cubit/request_random_song_state.dart';

class RequestRandomSongScreenCubit extends Cubit<RequestRandomSongState> {
  RequestRandomSongScreenCubit({
    required this.randomSongService
  })
    : super(InitState());

  final RandomSongService randomSongService;

  Future<void> loadRandomSong() async {
    emit(LoadingState());

    while (state is LoadingState) {
      try {
        final song = await randomSongService.getRandomSong();
        emit(LoadedState(song: song));
      } on SongNotFoundException {
        continue;
      }
    }
  }
}
