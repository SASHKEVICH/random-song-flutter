import 'package:random_song/domain/services/random_song_service.dart';

class Di {
  RandomSongService? _randomSongService;

  get randomSongService {
    if (_randomSongService != null) {
      return _randomSongService;
    }

    _randomSongService = RandomSongService();
    return _randomSongService;
  }
}
