import 'package:random_song/domain/models/song.dart';

class SongResponse {
  Meta? meta;
  Response? response;

  SongResponse({this.meta, this.response});

  SongResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Meta {
  int? status;

  Meta({this.status});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

class Response {
  Song? song;

  Response({this.song});

  Response.fromJson(Map<String, dynamic> json) {
    song = json['song'] != null ? Song.fromJson(json['song']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.song != null) {
      data['song'] = this.song!.toJson();
    }
    return data;
  }
}
