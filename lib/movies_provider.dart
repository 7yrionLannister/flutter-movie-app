import 'dart:convert';

import 'package:movies/secret.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  static const apiRootURL = "http://api.themoviedb.org/3";
  static const String imagePathPrefix = 'https://image.tmdb.org/t/p/w500';

  static Future<Map> getJson() async {
    const url =
        "$apiRootURL/discover/movie?api_key=$apiKey&sort_by=popularity.desc";
    final apiResponse = await http.get(Uri.parse(url));
    return json.decode(apiResponse.body);
  }
}