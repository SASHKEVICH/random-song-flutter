import 'package:random_song/domain/factories/random_song_view_model_factory.dart';
import 'package:random_song/domain/services/first_launch_service.dart';
import 'package:random_song/domain/services/random_song_service.dart';

class Di {
  RandomSongService? _randomSongService;
  FirstLaunchService? _firstLaunchService;
  RandomSongViewModelFactory? _randomSongViewModelFactory;

  RandomSongService get randomSongService {
    return _randomSongService ?? RandomSongService();
  }

  FirstLaunchService get firstLaunchService {
    return _firstLaunchService ?? FirstLaunchService();
  }

  RandomSongViewModelFactory get randomSongViewModelFactory {
    return _randomSongViewModelFactory ?? RandomSongViewModelFactory();
  }
}
