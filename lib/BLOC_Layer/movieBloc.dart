import 'package:flutterlab2/Data_Access_Layer/repository.dart';
import 'package:flutterlab2/Model/movie.dart';

class MovieBLOC {

  Future<MoviePOJO> getOne(int loc) async {
    List<MoviePOJO> list = await MovieRepository().list();
    return list[loc];
  }

  Future<List<MoviePOJO>> getAll() async {
    return await MovieRepository().list();
  }
}