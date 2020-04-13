import 'package:flutterlab2/Data_Access_Layer/api.dart';
import 'package:flutterlab2/Model/movie.dart';

class MovieRepository {
  Future<List<MoviePOJO>> list() async => await MovieAPI().getMovieList();
}