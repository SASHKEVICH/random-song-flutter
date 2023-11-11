import 'package:random_song/domain/models/media.dart';

enum MediaEnum {
  youtube("youtube"),
  soundcloud("soundcloud"),
  spotify("spotify");

  const MediaEnum(this.value);
  final String value;
}

class MediaFactory {
  static String? getMediaUrl(List<Media> medias, MediaEnum provider) {
    if (medias.isEmpty) return null;

    final filteredMedias = medias.where((media) => media.provider != null && media.provider == provider.value);
    if (filteredMedias.isEmpty) return null;

    return filteredMedias.first.url;
  }
}

