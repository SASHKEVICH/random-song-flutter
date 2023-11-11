import 'package:flutter/material.dart';

@immutable
class RandomSongViewModel {
  final String songTitle;
  final String artists;
  final String songArtImageUrl;
  final String? releaseDate;
  final String geniusUrl;

  final String? soundcloudUrl;
  final String? spotifyUrl;
  final String? youtubeUrl;

  const RandomSongViewModel({
    required this.songTitle,
    required this.artists,
    required this.songArtImageUrl,
    required this.releaseDate,
    required this.geniusUrl,
    this.soundcloudUrl,
    this.spotifyUrl,
    this.youtubeUrl
  });
}

