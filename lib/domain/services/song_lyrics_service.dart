import 'package:genius_lyrics/genius_lyrics.dart';

class SongLyricsService {
  Future<String?> loadSongLyrics(String songUrl) async {
    final lyrics = await Genius.lyrics(url: songUrl);
    return lyrics;
  }
}