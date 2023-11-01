import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:random_song/domain/requests/api_config/genius_api_config.dart';

class RandomSongRequest {
  static Future<Map<String, dynamic>> getSongById(int songId) async {
    var parameters = {
      'access_token': GeniusApiConfig.accessToken,
    };

    var url = Uri(
      scheme: GeniusApiConfig.scheme,
      host: GeniusApiConfig.host,
      path: "${GeniusApiConfig.path}$songId",
      queryParameters: parameters
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
