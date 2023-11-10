import 'package:random_song/domain/models/song.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class RandomSongViewModelFactory {
  RandomSongViewModel make(Song song) {
    return RandomSongViewModel(
      songTitle: song.title ?? "Неизвестно",
      artists: song.artistNames ?? "Неизвестно",
      songArtImageUrl: song.songArtImageUrl ?? "",
      releaseDate: song.releaseDate ?? "Нет информации",
      url: song.url ?? ""
    );
  }
}
