import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_song/domain/factories/random_song_view_model_factory.dart';
import 'package:random_song/domain/models/song.dart';
import 'package:random_song/domain/services/random_song_service.dart';
import 'package:random_song/scenes/request_random_song/cubit/request_random_song_state.dart';

class RequestRandomSongScreenCubit extends Cubit<RequestRandomSongState> {
  RequestRandomSongScreenCubit({
    required this.randomSongService,
    required this.randomSongViewModelFactory
  })
    : super(InitState());

  final RandomSongService randomSongService;
  final RandomSongViewModelFactory randomSongViewModelFactory;

  Future<void> loadRandomSong() async {
    emit(LoadingState());

    while (state is LoadingState) {
      final song = await randomSongService.getRandomSong();
      if (song == null) continue;

      showRandomSong(song);
      break;
    }
  }

  void showRandomSong(Song song) {
    final songViewModel = randomSongViewModelFactory.make(song);
    emit(ShowRandomSongScreenState(song: songViewModel));
  }

  void setInitState() {
    emit(InitState());
  }
}
