class Media {
  String? provider;
  int? start;
  String? type;
  String? url;
  String? nativeUri;
  String? attribution;

  Media(
      {this.provider,
      this.start,
      this.type,
      this.url,
      this.nativeUri,
      this.attribution});

  Media.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    start = json['start'];
    type = json['type'];
    url = json['url'];
    nativeUri = json['native_uri'];
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['provider'] = this.provider;
    data['start'] = this.start;
    data['type'] = this.type;
    data['url'] = this.url;
    data['native_uri'] = this.nativeUri;
    data['attribution'] = this.attribution;
    return data;
  }
}
