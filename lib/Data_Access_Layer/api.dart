import 'package:flutterlab2/Data_Access_Layer/client.dart';
import 'package:flutterlab2/Model/movie.dart';

class MovieAPI {
  String url = 'https://api.androidhive.info/json/movies.json';
  Future<List<MoviePOJO>> getMovieList() async {
    HTTPClient client = HTTPClient();
    var json = await client.get(url);
    return List<MoviePOJO>.from(json.map((jsonMovie) => MoviePOJO.fromJson(jsonMovie)));
  }
}