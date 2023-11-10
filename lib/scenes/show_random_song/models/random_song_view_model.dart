import 'package:flutter/material.dart';

@immutable
class RandomSongViewModel {
  final String songTitle;
  final String artists;
  final String songArtImageUrl;
  final String releaseDate;
  final String url;

  final String? appleMusicUrl;
  final String? spotifyMusicUrl;
  final String? youtubeMusicUrl;

  const RandomSongViewModel({
    required this.songTitle,
    required this.artists,
    required this.songArtImageUrl,
    required this.releaseDate,
    required this.url,
    this.appleMusicUrl,
    this.spotifyMusicUrl,
    this.youtubeMusicUrl
  });
}