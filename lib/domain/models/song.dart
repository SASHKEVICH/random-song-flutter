import 'package:random_song/domain/models/media.dart';

class Song {
  int? id;

  String? apiPath;
  String? appleMusicId;
  String? appleMusicPlayerUrl;
  String? artistNames;
  String? fullTitle;
  String? headerImageThumbnailUrl;
  String? headerImageUrl;
  String? language;
  String? lyricsState;
  String? path;
  String? releaseDate;
  String? releaseDateForDisplay;
  String? songArtImageThumbnailUrl;
  String? songArtImageUrl;
  String? title;
  String? titleWithFeatured;
  String? url;

  List<Media>? media;

  Song(
      {this.apiPath,
      this.appleMusicId,
      this.appleMusicPlayerUrl,
      this.artistNames,
      this.fullTitle,
      this.headerImageThumbnailUrl,
      this.headerImageUrl,
      this.id,
      this.language,
      this.lyricsState,
      this.path,
      this.releaseDate,
      this.releaseDateForDisplay,
      this.songArtImageThumbnailUrl,
      this.songArtImageUrl,
      this.title,
      this.titleWithFeatured,
      this.url,
      this.media});

  Song.fromJson(Map<String, dynamic> json) {
    apiPath = json['api_path'];
    appleMusicId = json['apple_music_id'];
    appleMusicPlayerUrl = json['apple_music_player_url'];
    artistNames = json['artist_names'];
    fullTitle = json['full_title'];
    headerImageThumbnailUrl = json['header_image_thumbnail_url'];
    headerImageUrl = json['header_image_url'];
    id = json['id'];
    language = json['language'];
    lyricsState = json['lyrics_state'];
    path = json['path'];
    releaseDate = json['release_date'];
    releaseDateForDisplay = json['release_date_for_display'];
    songArtImageThumbnailUrl = json['song_art_image_thumbnail_url'];
    songArtImageUrl = json['song_art_image_url'];
    title = json['title'];
    titleWithFeatured = json['title_with_featured'];
    url = json['url'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_path'] = this.apiPath;
    data['apple_music_id'] = this.appleMusicId;
    data['apple_music_player_url'] = this.appleMusicPlayerUrl;
    data['artist_names'] = this.artistNames;
    data['full_title'] = this.fullTitle;
    data['header_image_thumbnail_url'] = this.headerImageThumbnailUrl;
    data['header_image_url'] = this.headerImageUrl;
    data['id'] = this.id;
    data['language'] = this.language;
    data['lyrics_state'] = this.lyricsState;
    data['path'] = this.path;
    data['release_date'] = this.releaseDate;
    data['release_date_for_display'] = this.releaseDateForDisplay;
    data['song_art_image_thumbnail_url'] = this.songArtImageThumbnailUrl;
    data['song_art_image_url'] = this.songArtImageUrl;
    data['title'] = this.title;
    data['title_with_featured'] = this.titleWithFeatured;
    data['url'] = this.url;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
