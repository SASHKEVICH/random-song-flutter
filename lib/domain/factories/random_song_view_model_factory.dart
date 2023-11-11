import 'package:random_song/domain/factories/media_factory.dart';
import 'package:random_song/domain/models/song.dart';
import 'package:random_song/scenes/show_random_song/models/random_song_view_model.dart';

class RandomSongViewModelFactory {
  RandomSongViewModel make(Song song) {
    return RandomSongViewModel(
      songTitle: song.title ?? "Неизвестно",
      artists: song.artistNames ?? "Неизвестно",
      songArtImageUrl: song.songArtImageUrl ?? "",
      releaseDate: song.releaseDate,
      geniusUrl: song.url ?? "",
      soundcloudUrl: MediaFactory.getMediaUrl(song.media!, MediaEnum.soundcloud),
      youtubeUrl: MediaFactory.getMediaUrl(song.media!, MediaEnum.youtube),
      spotifyUrl: MediaFactory.getMediaUrl(song.media!, MediaEnum.spotify),
    );
  }
}
