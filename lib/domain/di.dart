import 'package:random_song/domain/services/first_launch_service.dart';
import 'package:random_song/domain/services/random_song_service.dart';

class Di {
  RandomSongService? _randomSongService;
  FirstLaunchService? _firstLaunchService;

  RandomSongService get randomSongService {
    return _randomSongService != null ? _randomSongService! : RandomSongService();
  }

  FirstLaunchService get firstLaunchService {
    return _firstLaunchService != null ? _firstLaunchService! : FirstLaunchService();
  }
}
