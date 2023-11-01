import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class GeniusApiConfig {
  static const scheme = 'https';
  static const host = 'api.genius.com';
  static const path = 'songs';
  static String? accessToken = dotenv.env["GENIUS_ACCESS_TOKEN"];
}
