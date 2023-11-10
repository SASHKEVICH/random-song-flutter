import 'package:random_song/domain/models/song.dart';
import 'package:random_song/domain/models/song_response.dart';
import 'package:random_song/domain/random/random_generator.dart';
import 'package:random_song/domain/requests/random_song_request.dart';

class RandomSongService {
  final minSongId = 1;
  final maxSongId = 2471960;

  Future<Song?> getRandomSong() async {
    final songId = RandomGenerator.getRandomInt(minSongId, maxSongId);
    final apiData = await RandomSongRequest.getSongById(songId);

    if (apiData == null) return null;

    SongResponse response = SongResponse.fromJson(apiData);

    if (response.meta?.status != 200) {
      throw Exception('Request error. ${response.meta}');
    }

    return response.response!.song!;
  }
}
